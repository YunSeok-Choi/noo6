//
//  ModelData.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/12.
//

import Foundation

var guidedata : [GuideStorage] = load("GuideData.json")
var categorydata : [CategoryStorage] = load("CategoryData.json")
var cleardata : [ClearStorage] = load("ClearData.json")

func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    // 파일 이름 불러오는 부분
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    // 불러온 파일의 데이터를 가져오는 부분
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't find  \(filename) from main bundle:\n\(error)")
    }
    // 데이터 (Json) 형식을 디코딩해주는 부분
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
                   
}
