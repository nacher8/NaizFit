//
//  NaizUserModel.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import Foundation
import SwiftUI

// Info Model Perk
public struct NaizPerkModel: Decodable, Hashable {
    var id: Int
    var name: String
    var brand: String
    var perkType: String
    var expirationDate: String
    var perkColor: PerkType
    var image: String
}

public struct NaizPerkDataModel: Decodable, Hashable {
    var data: [NaizPerkModel]
}

// Enum with different perk types
enum PerkType: Codable {
    case orange
    case green
    
    var background: Color {
        switch self {
        case .green: return Color.capsuleBackgroundGreen
        case .orange: return Color.capsuleBackgroundOrange
        }
    }
    
    var text: Color {
        switch self {
        case .green: return Color.capsuleTextGreen
        case .orange: return Color.capsuleTextOrange
        }
    }
}

