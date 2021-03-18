//
//  AbsenceItem.swift
//  AbsenceRecorder
//
//  Created by Rakesh Bahadur on 14/03/2021.
//

import SwiftUI

struct AbsenceItem: View {
    @ObservedObject var studentAbsence: StudentAbsence = StudentAbsence.example
    
    var body: some View {
        HStack {
            Text(studentAbsence.student.forename)
            Spacer()
            
            if studentAbsence.isAbsent {
                Button("❌", action: {toggleAbsent()})
            } else {
                Button("✔️", action: {toggleAbsent()})
            }

        }
    }
    
    func toggleAbsent() {
        studentAbsence.isAbsent.toggle()
    }
}

struct AbsenceItem_Previews: PreviewProvider {
    static var previews: some View {
        AbsenceItem(studentAbsence: StudentAbsence.example)
    }
}
