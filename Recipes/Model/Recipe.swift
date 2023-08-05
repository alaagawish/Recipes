//
//  Recipe.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation

struct Recipe: Decodable {
    let id: String
    let fats: String?
    let name: String
    let time: String?
    let image: String
    let weeks: [String]?
    let carbos: String?
    let fibers: String?
    let rating: Double?
    let country: String
    let ratings: Double?
    let calories: String
    let headline: String
    let keywords: [String]?
    let products: [String]?
    let proteins: String?
    let favorites: Int?
    let difficulty: Int?
    let description: String?
    let highlighted: Bool?
    let ingredients: [String]?
    let deliverableIngredients: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty, description, highlighted, ingredients, rating
        case deliverableIngredients = "deliverable_ingredients"
        
    }
    init(id: String, fats: String?, name: String, time: String?, image: String, weeks: [String]?, carbos: String?, fibers: String?, rating: Double?, country: String, ratings: Double?, calories: String, headline: String, keywords: [String]?, products: [String]?, proteins: String?, favorites: Int?, difficulty: Int?, description: String?, highlighted: Bool?, ingredients: [String]?, deliverableIngredients: [String]?) {
        self.id = id
        self.fats = fats
        self.name = name
        self.time = time
        self.image = image
        self.weeks = weeks
        self.carbos = carbos
        self.fibers = fibers
        self.rating = rating
        self.country = country
        self.ratings = ratings
        self.calories = calories
        self.headline = headline
        self.keywords = keywords
        self.products = products
        self.proteins = proteins
        self.favorites = favorites
        self.difficulty = difficulty
        self.description = description
        self.highlighted = highlighted
        self.ingredients = ingredients
        self.deliverableIngredients = deliverableIngredients
    }
    
    init(id: String, name: String, image: String, country: String, calories: String, headline: String) {
        self.id = id
        self.fats = ""
        self.name = name
        self.time = ""
        self.image = image
        self.weeks = []
        self.carbos = ""
        self.fibers = ""
        self.rating = 0
        self.country = country
        self.ratings = 0
        self.calories = calories
        self.headline = headline
        self.keywords = []
        self.products = []
        self.proteins = ""
        self.favorites = 0
        self.difficulty = 0
        self.description = ""
        self.highlighted = false
        self.ingredients = []
        self.deliverableIngredients = []
    }
}
