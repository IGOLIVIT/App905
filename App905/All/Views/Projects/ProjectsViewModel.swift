//
//  ProjectsViewModel.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI
import CoreData

final class ProjectsViewModel: ObservableObject {
    
    @Published var welpap: [String] = ["berries", "flowers"]
    @Published var currentWel: String = ""
    
    @Published var categories: [String] = ["Art", "Needlework", "Sport", "Cooking"]
    @Published var currentCategory: String = ""
    @Published var catForFilter: String = ""
    
    @Published var tools: [String] = ["klub", "pech", "ico", "stakan", "ruchka", "lin", "kar", "igla", "nitki", "nozh", "kraski"]
    @Published var currentImage1: String = ""
    @Published var currentImage2: String = ""
    @Published var currentImage3: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var prPhoto: String = ""
    @Published var prTitle: String = ""
    @Published var prDescr: String = ""
    @Published var prCat: String = ""
    @Published var prTool1: String = ""
    @Published var prTool2: String = ""
    @Published var prTool3: String = ""

    @Published var projects: [ProjModel] = []
    @Published var selectedProj: ProjModel?

    func addProj() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjModel", into: context) as! ProjModel

        loan.prPhoto = prPhoto
        loan.prTitle = prTitle
        loan.prDescr = prDescr
        loan.prCat = prCat
        loan.prTool1 = prTool1
        loan.prTool2 = prTool2
        loan.prTool3 = prTool3

        CoreDataStack.shared.saveContext()
    }

    func fetchProjs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjModel>(entityName: "ProjModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.projects = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.projects = []
        }
    }
}

