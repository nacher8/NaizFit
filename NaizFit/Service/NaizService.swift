//
//  NaizService.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import Foundation
import Alamofire
import Combine

public class NaizService {
    private var urlNaiz: String = "https://naiz.perks.com/public"
    
    public func getPerks() -> Future<NaizPerkDataModel, Error> {
        return Future<NaizPerkDataModel, Error> { promise in
            AF.request(self.urlNaiz, method: .get)
                .responseDecodable(of: NaizPerkDataModel.self) { response in
                    switch response.result {
                    case .success(let naizObject):
                        promise(.success(naizObject))
                        break
                    case .failure(let error):
                        promise(.failure(error))
                        break
                    }
                }
        }
    }
}
