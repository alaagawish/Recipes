//
//  Network.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation
import Alamofire

class Network: NetworkProtocol {
    func getData(handler: @escaping (Response?) -> Void) {
        AF.request(Constants.url).responseDecodable(of: Response.self) { response in
            switch response.result {
            case .success(let data):
                handler(data)
            case .failure(let error):
                print("Error in retrieving data: \(error)")
            }
            
        }
    }
    
    
}
