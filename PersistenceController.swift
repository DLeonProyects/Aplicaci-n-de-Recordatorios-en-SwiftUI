//
//  PersistenceController.swift
//  RecordatoriosApp
//
//  Created by Daniel Alejandro De Leon Ortega on 9/14/24.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Model") // Asegúrate de que coincida con el nombre de tu modelo
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error al cargar Core Data: \(error), \(error.userInfo)")
            }
        }
    }
}
