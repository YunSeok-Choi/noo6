//
//  DataLoadModel.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/11.
//
import UIKit
import SwiftUI

var gradeData: [Grade] = loadJson("gradeData.json")

struct Grade: Codable, Identifiable {
    var id: String
    var subject: String
    var grade: String
}

class GradeStore : ObservableObject {
    
    @Published var grades: [Grade]
    
    init (grades: [Grade] = []) {
        self.grades = grades
    }
    
}


func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Bundle 에서 파일이름을 통하여 파일의 주소를 가져온다.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        // 위에서 가져온 주소를 활용하여 Data structure 의 객체를 생성한다.
        // 이는 데이터를 Json decoding 에 활용할 수 있도록 하는 작업이라고 볼 수 있다.
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): (error)")
    }
    
    do {
        // parse the data
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): (error)")
    }
    
}
