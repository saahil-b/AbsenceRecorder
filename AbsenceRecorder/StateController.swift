//
//  StateController.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 11/03/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var divs : [Division] = []
    
    init() {
        divs = Division.examples
        loadFromFile()
    }
    
    func loadFromFile() {
        if let loaded: [Division] = FileManager.default.load(from: "division.json") {
            divs = loaded
        }
        
    }
    
    func saveToFile() {
        FileManager.default.save(to: "divisons.json", object: divs)
    }
    
}
