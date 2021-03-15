//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 15/03/2021.
//

import Foundation

class Absence {
    
    var takenOn: Date
    var studentAbsences: [StudentAbsence]
    
    
    init(date: Date, students: [Student]) {
        takenOn = date
        studentAbsences = students.map { StudentAbsence(student: $0) }
        
    }
    
    #if DEBUG
    
    static let example = Absence(date: Date(), students: Student.examples)
    
    #endif
    
}
