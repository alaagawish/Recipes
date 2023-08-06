//
//  MockAPIFileLoader.swift
//  RecipesTests
//
//  Created by Alaa on 06/08/2023.
//

import Foundation
@testable import Recipes

class MockAPIFileLoader {
    
    func loadApiFiles() -> [Recipe]? {
        let bundle = Bundle(for: type(of: self))
        
        let fileUrl = bundle.url(forResource: "MockResponse", withExtension: "json")
        do {
            let data = try Data(contentsOf: fileUrl!)
            let response = try JSONDecoder().decode([Recipe].self, from: data)
            return response
        } catch {
            return nil
        }
    }
    
    
    private func generateModel(for path: String) -> [Recipe]? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let mockyJSON = try? JSONDecoder().decode([Recipe].self, from: data)
        else { return nil }
        return mockyJSON
    }
    
}
