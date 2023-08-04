//
//  HomeAPI.swift
//  MangaSocial
//

import Foundation

class HomeAPI: BaseAPI<HomeServiceConfiguration> {
    static let shared = HomeAPI()
    func getHome(completionHandler: @escaping (Result<[HomeModel], ServiceError>) -> Void) {
//        fetchData(configuration: .getHome,
//                  responseType: [HomeModel].self) { result in
//            completionHandler(result)
//        }
        guard let url = Bundle.main.url(forResource: "json", withExtension: "geojson") else {
            completionHandler(.failure(.urlError))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([HomeModel].self, from: data)
            completionHandler(.success(jsonData))
        } catch {
            completionHandler(.failure(.jsonError))
        }
    }
}
