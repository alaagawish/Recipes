//
//  LocalSource.swift
//  Recipes
//
//  Created by Alaa on 04/08/2023.
//

import Foundation
import UIKit
import CoreData

class LocalSource: LocalSourceProtocol {
    
    var managedContext: NSManagedObjectContext
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
    }
    
    func insertRecipe(recipe: Recipe) {
        let entity = NSEntityDescription.entity(forEntityName: Constants.entityName, in: managedContext)
        let recipee = NSManagedObject(entity: entity!, insertInto: managedContext)
        recipee.setValue(recipe.name, forKey: Constants.name)
        recipee.setValue(recipe.id, forKey: Constants.id)
        recipee.setValue(recipe.image, forKey: Constants.image)
        recipee.setValue(recipe.country, forKey: Constants.country)
        recipee.setValue(recipe.calories, forKey: Constants.calories)
        recipee.setValue(recipe.headline, forKey: Constants.headline)
       
        saveChanges()
    }
    
    func getDataFromLocal() -> [Recipe] {
        var recipesLocal: [Recipe] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.entityName)
        do{
            let recipes = try managedContext.fetch(fetchRequest)
            for recipeItem in recipes{
                let recipe = Recipe(id: recipeItem.value(forKey: Constants.id) as! String,
                                    name: recipeItem.value(forKey: Constants.name) as! String,
                                    image: recipeItem.value(forKey: Constants.image) as! String,
                                    country: recipeItem.value(forKey: Constants.country) as! String,
                                    calories: recipeItem.value(forKey: Constants.calories) as! String,
                                    headline: recipeItem.value(forKey: Constants.headline) as! String)
                
                recipesLocal.append(recipe)
            }
            print("\nGetting all recipes done...\n")
        }catch let error as NSError{
            print("\nerror in fetching all recipes: \(error)\n")
        }
        
        return recipesLocal
    }
    
    func getRecipeFromLocal(id: String) -> Recipe? {
        var recipeLocal: Recipe?
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.entityName)
        
        let myPredicate = NSPredicate(format: Constants.iDFormat, id)
        fetchRequest.predicate = myPredicate
        do{
            let recipesFetched = try managedContext.fetch(fetchRequest)
            if recipesFetched.count > 0 {
                let recipeItem = recipesFetched[0]
                recipeLocal = Recipe(id: recipeItem.value(forKey: Constants.id) as! String,
                                     name: recipeItem.value(forKey: Constants.name) as! String,
                                     image: recipeItem.value(forKey: Constants.image) as! String,
                                     country: recipeItem.value(forKey: Constants.country) as! String,
                                     calories: recipeItem.value(forKey: Constants.calories) as! String,
                                     headline: recipeItem.value(forKey: Constants.headline) as! String)
                print("\nGetting recipe done...\n")
            }else{
                print("no such itemmmmmm")
            }
        }catch let error as NSError{
            print("\nerror in fetching all Recipes: \(error)\n")
        }
        
        return recipeLocal ?? nil
    }
    
    func deleteFromLocal(id: String) {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.entityName)
        
        let myPredicate = NSPredicate(format: Constants.iDFormat, id)
        
        fetchRequest.predicate = myPredicate
        do{
            let recipes = try managedContext.fetch(fetchRequest)
            print(recipes.count)
            if recipes.count > 0 {
                managedContext.delete(recipes[0])
                saveChanges()
            }
        }catch let error as NSError{
            print("\nerror in deleteting a recipe : \(error)\n")
        }
        
    }
    
    func saveChanges() {
        do{
            try managedContext.save()
            print("\nChanged saved...\n")
        }catch let error as NSError{
            print("\nerror in saving: \(error)\n")
        }
    }
    
}
