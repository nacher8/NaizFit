//
//  NaizServiceProtocol.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 29/1/24.
//

import Foundation
import Combine

protocol NaizServiceProtocol {
    func getPerks() -> Future<NaizPerkDataModel, Error>
}
