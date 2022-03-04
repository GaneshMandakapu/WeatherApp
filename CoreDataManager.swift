//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by M_AMBIN05376 on 28/02/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init(){}
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "weatherdatacore")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    }

extension CoreDataManager {
    func saveWeatherData(temperature:Double,humidity:Double,feelslike:Double) {
        let loginEntity = NSEntityDescription.entity(forEntityName: "WeatherDetail", in: persistentContainer.viewContext)!
        let userDetails = NSManagedObject(entity: loginEntity, insertInto: persistentContainer.viewContext)
        
        
        userDetails.setValue(temperature, forKey: "temperature")
        userDetails.setValue(humidity, forKey: "humidity")
        userDetails.setValue(feelslike, forKey: "feelslike")
        
        do {
            try persistentContainer.viewContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func retrieveData() {
        do {
            let result = try persistentContainer.viewContext.fetch(WeatherDetail.fetchRequest())
            if result.count == 0 { print("No Record Found") }

            for data in result {
                print("temperature",data.temperature)
                print("feelslike",data.feelslike)
            }
        } catch {
            print("Failed")
        }
    }

    
}


    
    
    
    

