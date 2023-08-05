//
//  Recipe.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

struct Recipe: Decodable {
    let id: String
    let fats: String
    let name: String
    let time: String
    let image: String
    let weeks: [String]
    let carbos: String
    let fibers: String
    let rating: Double?
    let country: String
    let ratings: Double?
    let calories: String
    let headline: String
    let keywords: [String]
    let products: [String]
    let proteins: String
    let favorites: Int
    let difficulty: Int
    let description: String
    let highlighted: Bool
    let ingredients: [String]
    let deliverableIngredients: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty, description, highlighted, ingredients, rating
        case deliverableIngredients = "deliverable_ingredients"
        
    }
}
