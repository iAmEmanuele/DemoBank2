//
//  UserInfo.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 08/11/23.
//

import Foundation

struct UserInfo : Codable {
    let infoPrincipali : MainInfo
    let carte : [Card]
    var listaMovimenti : [Movement]
}
