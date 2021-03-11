//
//  StateController.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 11/03/2021.
//

import Foundation

class StateController: ObservableObject {
    @Published var divs : [Division]
    
    init() {
        divs = Division.examples
    }
}
