//
//  SegmentedTypes.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import Foundation

// Enum with different segmented types
enum SegmentedTypes: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    case perks = "PERKS"
    case nepsHistory = "NEPS HISTORY"
}
