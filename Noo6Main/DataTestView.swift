//
//  DataTestView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/11.
//

import SwiftUI

struct DataTestView: View {
    //@ObservedObject var gradeStore: GradeStore = GradeStore(grades: gradeData)
    //@ObservedObject var category: Category = Category()
    @ObservedObject var testStore: TestStore = TestStore(tests: testData)
    
    var body: some View {
        VStack{
            Text("Hello")
            List(testStore.tests){ test in
                HStack{
                    Text("\(test.id)")
                    Text(test.age[0])
                    Text(test.age[1])
                }
                
            }
        }
        
        
//        List(gradeStore.grades) { grade in
//                    HStack {
//                        Text(grade.id)
//                        Text(grade.subject)
//                            .font(.largeTitle)
//                        Text(grade.grade)
//                            .font(.headline)
//                    }
//                }
//        VStack {
//            Button("눌러라", action: {
//
//            })
//
//            List(category.categories) { i in
//                Text(i.categoryTitle)
//
//            }
//        }
    }
    
    private func printMockParser(category: [CategoryStorage]) {
        print(category)
    }
}



struct DataTestView_Previews: PreviewProvider {
    static var previews: some View {
        DataTestView()
    }
}
