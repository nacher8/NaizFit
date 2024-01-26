//
//  NaizUserModel.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import Foundation

public struct NaizUserModel: Codable, Hashable {
    var id: String
    var name: String
    var level: String
    var nextLevel: String
    var height: String
    var weight: String
    var qrCode: String
}
