//
//  WorkshopViewModel.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI
import CoreData

final class WorkshopViewModel: ObservableObject {
    
    @Published var types: [String] = ["Progress", "Pending"]
    @Published var currentType: String = "Progress"
    @Published var typeForFilter: String = "Progress"
    
    @Published var categories: [String] = ["Art", "Needlework", "Sport", "Cooking"]
    @Published var currentCategory: String = ""
    @Published var catForFilter: String = ""
    @Published var plusCategory: String = ""
    
    @Published var tools: [String] = ["ruchka", "lin", "kar", "igla", "nitki", "nozh", "kraski"]
    @Published var currentImage1: String = ""
    @Published var currentImage2: String = ""
    @Published var currentImage3: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddCategory: Bool = false

    @Published var woType: String = ""
    @Published var woTitle: String = ""
    @Published var woDescr: String = ""
    @Published var woCat: String = ""
    @Published var woTool1: String = ""
    @Published var woTool2: String = ""
    @Published var woTool3: String = ""

    @Published var workshops: [WorkModel] = []
    @Published var selectedWork: WorkModel?

    func addWork() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "WorkModel", into: context) as! WorkModel

        loan.woType = woType
        loan.woTitle = woTitle
        loan.woDescr = woDescr
        loan.woCat = woCat
        loan.woTool1 = woTool1
        loan.woTool2 = woTool2
        loan.woTool3 = woTool3

        CoreDataStack.shared.saveContext()
    }

    func fetchWorks() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<WorkModel>(entityName: "WorkModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.workshops = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.workshops = []
        }
    }
}
