//
//  DataTestView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/11.
//

import SwiftUI

struct DataTestView: View {
    @ObservedObject var gradeStore: GradeStore = GradeStore(grades: gradeData)
    var body: some View {
        List(gradeStore.grades) { grade in
                    HStack {
                        Text(grade.id)
                        Text(grade.subject)
                            .font(.largeTitle)
                        Text(grade.grade)
                            .font(.headline)
                        
                    }
                }
    }
}



struct DataTestView_Previews: PreviewProvider {
    static var previews: some View {
        DataTestView()
    }
}
