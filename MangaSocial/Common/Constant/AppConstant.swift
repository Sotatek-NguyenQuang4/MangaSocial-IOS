//
//  AppConstant.swift
//  MangaSocial
//
//  Created by Quang Nguyễn Như on 24/07/2023.
//

import UIKit

struct AppConstant {
    
    static var locale: String {
        get { UserDefaults.standard.value(forKey: "locale-setting") as? String ?? "en-us" }
        set { UserDefaults.standard.setValue(newValue, forKey: "locale-setting") }
    }
    
    static var accessToken: String? {
        get { UserDefaults.standard.value(forKey: "access-token") as? String }
        set { UserDefaults.standard.setValue(newValue, forKey: "access-token") }
    }
}

extension AppConstant {
    
    static func logout() {
        accessToken = nil
    }
}

extension UserDefaults {
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}
