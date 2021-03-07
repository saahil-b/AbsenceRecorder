//
//  Student.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 01/03/2021.
//

import Foundation

class Student {
    let forename: String
    let surname:String
    let birthday: Date
    
    init(forename: String, surname: String, birthday: Date) {
        self.forename = forename
        self.surname = surname
        self.birthday = birthday
    }
}
