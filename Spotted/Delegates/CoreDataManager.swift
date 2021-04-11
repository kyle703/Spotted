//
//  CoreDataManager.swift
//  Spotted
//
//  Created by Kyle Thompson on 2/8/21.
//  Copyright © 2021 Kyle Thompson. All rights reserved.
//
import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    // MARK: - Core Data stack
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Spotted")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let nserror = error as NSError? {
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        })
        return container
    }()
    
    public var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    
    // MARK: - Core Data Saving support
    public func save() {
        if self.context.hasChanges {
            do {
                try self.context.save()
                print("In CoreData.stack.save()")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
