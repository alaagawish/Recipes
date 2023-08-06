//
//  MockNetwork.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import Foundation
@testable import Alamofire
@testable import Recipes

class MockNetwork: NetworkProtocol{
    
    var isSuccess: Bool!
    init(isSuccess: Bool!) {
        self.isSuccess = isSuccess
    }
    
    let files = MockAPIFileLoader().loadApiFiles()
    func getData(handler: @escaping ([Recipes.Recipe]?) -> Void) {
        
        if isSuccess {
            handler(files)
        }else {
            handler([])
        }
        
    }
}


