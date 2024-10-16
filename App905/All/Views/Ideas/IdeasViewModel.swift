//
//  IdeasViewModel.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI
import CoreData

final class IdeasViewModel: ObservableObject {
    
    @Published var types: [String] = ["Completed", "Pending"]
    @Published var currentType: String = "Completed"
    @Published var typeForFilter: String = "Completed"
    @Published var catForFilter: String = ""
    
    @Published var categories: [String] = ["Art", "Needlework", "Sport", "Cooking"]
    @Published var currentCategory: String = ""
    
    @Published var images: [String] = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10", "p11", "p12", "p13", "p14", "p15", "p16", "p17", "p19",]
    @Published var currentImage1: String = ""
    @Published var currentImage2: String = ""
    @Published var currentImage3: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var idType: String = ""
    @Published var idTitle: String = ""
    @Published var idDescr: String = ""
    @Published var idCat: String = ""
    @Published var idRef1: String = ""
    @Published var idRef2: String = ""
    @Published var idRef3: String = ""

    @Published var ideas: [IdeasModel] = []
    @Published var selectedIdea: IdeasModel?

    func addIdea() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IdeasModel", into: context) as! IdeasModel

        loan.idType = idType
        loan.idTitle = idTitle
        loan.idDescr = idDescr
        loan.idCat = idCat
        loan.idRef1 = idRef1
        loan.idRef2 = idRef2
        loan.idRef3 = idRef3

        CoreDataStack.shared.saveContext()
    }

    func fetchIdeas() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IdeasModel>(entityName: "IdeasModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.ideas = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.ideas = []
        }
    }
}
