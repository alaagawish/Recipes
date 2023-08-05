//
//  NetworkProtocol.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

protocol NetworkProtocol {
    func getData(handler: @escaping ([Recipe]?)-> Void)
}
