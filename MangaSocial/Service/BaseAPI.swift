//
//  BaseAPI.swift
//  MangaSocial
//

import Foundation
import Alamofire

class BaseAPI {
    static let share = BaseAPI()
    let baseURL: String = "https://staging.probitglobal.com/"

    func upload<M: Decodable>(urlString: String,
                              imageData: Data,
                              name: String,
                              parameters: [String: String] = [:],
                              responseType: M.Type,
                              completionHandler: @escaping (Result<M, ServiceError>) -> Void) {
        guard let host = URLComponents(string: baseURL + urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        let headers: HTTPHeaders = .init([
            "Content-Type": "application/json; charset=UTF-8",
            "accept": "application/json"
        ])
        
        AF.upload(multipartFormData: { multipart in
            multipart.append(imageData,
                             withName: name,
                             fileName: "\(name).jpg",
                             mimeType: "image/jpeg")
            for (key, value) in parameters {
                multipart.append(value.data(using: .utf8) ?? Data(), withName: key)
            }
        }, to: host,
                  usingThreshold: UInt64(),
                  method: .post,
                  headers: headers)
        .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseDecodable(of: M.self) { response in
            guard let existData = response.data else {
                completionHandler(.failure(ServiceError.notFoundData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let responseObj = try decoder.decode(M.self, from: existData)
                completionHandler(.success(responseObj))
            } catch {
                print("\n----- Parse Model Error: \n", error)
                print("\n----- End:")
                completionHandler(.failure(.parseError))
            }
        }
    }
    
    func fetchData<M: Decodable>(urlString: String,
                                 method: HTTPMethod = .get,
                                 parameters: [String: Any] = [:],
                                 headers: [String: String] = [:],
                                 responseType: M.Type,
                                 completionHandler: @escaping (Result<M, ServiceError>) -> Void) {
        
        guard var components = URLComponents(string: baseURL + urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        if method == HTTPMethod.get {
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: "\(value)")
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        
        guard let url = components.url else {
            completionHandler(.failure(.urlError))
            return
        }
        
        // Create request
        let request = self.generateRequest(url: url, method: method.rawValue, headers: headers)
        
        if method == HTTPMethod.post {
            let postString = self.getPostString(params: parameters)
            request.httpBody = postString.data(using: .utf8)
        }
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest,
                                                  completionHandler: { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    let errorMessage = error?.localizedDescription ?? "Server Error"
                    completionHandler(.failure(ServiceError.init(issueCode: .initValue(value: errorMessage))))
                    return
                }
                
                guard let existData = data, let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(ServiceError.notFoundData))
                    return
                }
                
                guard (try? JSONSerialization.jsonObject(with: existData, options: [])) != nil else {
                    completionHandler(.failure(.jsonError))
                    return
                }
                
                guard self.isSuccess(httpResponse.statusCode) else {
                    completionHandler(.failure(.somethinkWrong))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let responseObj = try decoder.decode(M.self, from: existData)
                    completionHandler(.success(responseObj))
                } catch {
                    completionHandler(.failure(.parseError))
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getPostString(params: [String: Any]) -> String {
        var data = [String]()
        for(key, value) in params {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    func isSuccess(_ code: Int) -> Bool {
        switch code {
        case 200...304:
            return true
        default:
            return false
        }
    }
    
    private func generateRequest(url: URL, method: String, headers: [String: String] = [:]) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = method
        request.setValue("application/x-www-form-urlencoded charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
}
