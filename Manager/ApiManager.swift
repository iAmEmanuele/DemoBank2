//
//  ApiManager.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 14/11/23.
//

import Foundation

class ApiManager {
    static var userInfo : UserInfo?{
        guard let path = Bundle.main.path(forResource: "userInfo", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)), let userInfo = try? JSONDecoder().decode(UserInfo.self, from: data)
                
        else{
            return  nil
        }
        return userInfo
        
    }
}
