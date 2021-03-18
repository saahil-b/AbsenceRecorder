//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 01/03/2021.
//

import Foundation

class Division: Codable {
    let code: String
    
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        
        return absences.first {
            let comparison = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparison == .orderedSame
        }
        
    }
    
    func createAbsenceOrExistingIfAvailable(for date: Date) -> Absence {
        
        if let existingAbsence = getAbsence(for: date) {
            return existingAbsence
        } else {
            let absence = Absence(date: date, students: students)
            absences.append(absence)
            
            return absence
        }
        
    }
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func displayStudents() -> String{
        var final = ""
        
        for item in students {
            final += item.forename + " " + item.surname + "\n"
            
        }
        
        return final
    }
    
    #if DEBUG
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        
        // loop through no. students- adding students
        
        for i in 1...size {
            division.addStudent(student: Student(forename: "S\(i)", surname: "Halpert", birthday: Date() ))
        }
        
        return division
    }
    
    static let examples = [Division.createDivision(code: "VCX-1", of: 7),
                           Division.createDivision(code: "MCW-2", of: 10),
                           Division.createDivision(code: "PCV-1", of: 8),
                           Division.createDivision(code: "ECX-1", of: 14)]
    
    #endif
}
