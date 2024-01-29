//
//  ProfileViewModel.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    private var service = NaizService()
    
    @Published var perks: [NaizPerkModel] = []
    @Published var showCondition: Bool = false
    @Published var changeHeight: Bool = false
    @Published var changeWeight: Bool = false
    @Published var perkInfoCondtion: NaizPerkModel?
    @Published var naizUser: NaizUserModel?
    
    private var subscriptions = Set<AnyCancellable>()
    
    let mockData: [NaizPerkModel] = [
        NaizPerkModel(id: 1, name: "Perk Name One", brand: "Brand One", perkType: "Perk Type (Online/Physical)", expirationDate: "30/05/2024", perkColor: .green, image: "ImagePerkOne"),
        NaizPerkModel(id: 2, name: "Perk Name Two", brand: "Brand Two", perkType: "Perk Type (Online/Physical)", expirationDate: "27/01/2024", perkColor: .green, image: "ImagePerkTwo"),
        NaizPerkModel(id: 3, name: "Perk Name Three", brand: "Brand Three", perkType: "Perk Type (Online/Physical)", expirationDate: "30/11/2024", perkColor: .orange, image: "ImagePerkOne"),
        NaizPerkModel(id: 4, name: "Perk Name Four", brand: "Brand Four", perkType: "Perk Type (Online/Physical)", expirationDate: "09/06/2024", perkColor: .orange, image: "ImagePerkTwo"),
        NaizPerkModel(id: 5, name: "Perk Name Five", brand: "Brand Five", perkType: "Perk Type (Online/Physical)", expirationDate: "08/11/2024", perkColor: .green, image: "ImagePerkOne"),
        NaizPerkModel(id: 6, name: "Perk Name Six", brand: "Brand Six", perkType: "Perk Type (Online/Physical)", expirationDate: "09/03/2024", perkColor: .orange, image: "ImagePerkTwo"),
        NaizPerkModel(id: 7, name: "Perk Name Seven", brand: "Brand Seven", perkType: "Perk Type (Online/Physical)", expirationDate: "26/02/2024", perkColor: .orange, image: "ImagePerkOne"),
        NaizPerkModel(id: 8, name: "Perk Name Eight", brand: "Brand Eight", perkType: "Perk Type (Online/Physical)", expirationDate: "19/04/2024", perkColor: .green, image: "ImagePerkTwo")
    ]
    
    // In this case I check I we have information about the user in UserDefaults
    // if I have information I recover it else I create a mock and save in UserDefaults
    init() {
        guard let data = UserDefaults.standard.data(forKey: "naizUser") else {
            do {
                naizUser = NaizUserModel(id: "1", name: "Maria Peralta", level: "10", nextLevel: "300 NEPS to next level", height: "168", weight: "74", qrCode: "QRCode", neps: "1000", reports: "23", coins: "1000")
                let encoder = JSONEncoder()
                let data = try encoder.encode(naizUser)
                UserDefaults.standard.set(data, forKey: "naizUser")
            } catch let error {
                print(error.localizedDescription)
            }
            return
        }
        do {
            let decoder = JSONDecoder()
            naizUser = try decoder.decode(NaizUserModel.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // Call to get the info of PERKS
    func getPerks() {
        let result = service.getPerks()
        result.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print(completion)
            case .failure(let error):
                print(error.localizedDescription)
                self.perks = self.mockData
                break
            }
        }, receiveValue: { value in
            self.perks.append(contentsOf: value.data)
        }).store(in: &subscriptions)
    }
    
    // Funtion to update the height
    func saveHeight(_ height: String) {
        naizUser?.height = height.isEmpty ? "0" : height
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(naizUser)
            UserDefaults.standard.set(data, forKey: "naizUser")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // Funtion to update the weight
    func saveWeight(_ weight: String) {
        naizUser?.weight = weight.isEmpty ? "0" : weight
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(naizUser)
            UserDefaults.standard.set(data, forKey: "naizUser")
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
