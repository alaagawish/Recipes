//
//  Network.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation
import Alamofire

class Network: NetworkProtocol {
    func getData(handler: @escaping ([Recipe]?) -> Void) {
        AF.request(Constants.url).responseDecodable(of: [Recipe].self) { response in
            
            switch response.result {
            case .success(let recipes):
                handler(recipes)
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    
}
