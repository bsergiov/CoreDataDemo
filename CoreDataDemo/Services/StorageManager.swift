//
//  StorageManager.swift
//  CoreDataDemo
//
//  Created by BSergio on 25.01.2022.
//

import Foundation
import CoreData


class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    

    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func delete(context: NSManagedObjectContext, object: NSManagedObject) {
        context.delete(object)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
}
