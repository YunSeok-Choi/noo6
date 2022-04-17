//
//  ModelData.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/12.
//

import Foundation

var guidedata : [GuideStorage] = load("GuideData.json")                 // load 함수를 호출하여 GuideData.json 파일의 데이터를 가져옴, 자료형이 GuideStorage인 이유는
var categorydata : [CategoryStorage] = load("CategoryData.json")        // DataStruct.swift (참조하세요) 파일의 구조체를 생성할 때 구조체 이름을 GuideStorage라고 지었기 때문
var cleardata : [ClearStorage] = load("ClearData.json")                 //  --> Swift에서 제공하는 라이브러리가 아님


            // json 파일의 데이터를 가져올 수 있는 함수
func load <T: Decodable> (_ filename: String) -> T {
    let data: Data
    
            // 파일 이름 불러오는 부분, 일치하는 파일이 없을 시 에러 메시지 호출
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
            // 불러온 파일의 데이터를 가져오는 부분,
    do{
        data = try Data(contentsOf: file)           // 불러온 파일을 Data 형으로 변경, swift는 Data로 받을 시, 저장, 로드, 변환이 쉬움
    }catch{                                         // 오류시 에러 메시지 호출
        fatalError("Couldn't find  \(filename) from main bundle:\n\(error)")
    }
    
    
            // 데이터 (Json) 형식을 디코딩해주는 부분, json 파일을 struct로 사용할 수 있게 변환해주는 부분
    do{                                     // json 파일의 내용이 이상하다면 (오타 등) 에러 메시지 호출
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
                   //완료시 데이터 저장 // 10, 11, 12 라인 참고
}
