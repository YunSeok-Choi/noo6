//
//  Data.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/11.
//

import Foundation
                                                            // 디코딩한 데이터 값을 저장하는 struct
                                                            // CategoryData.json 은  Home, Category 데이터를 저장
                                                            // Guide와 Clear는 각각 json파일 존재
struct HomeData : Codable, Identifiable {         // 홈에 들어가는 데이터
    let id : Int
    let title : String
    let isAllCleared : Bool
}

                                                            // HomeView와 CategoryView에서 사용
struct CategoryStorage : Codable, Identifiable {            // 카테고리 뷰에 들어가는 데이터
    let id : Int                                            // ex) 카테고리 제목, 서비 제목, 아이콘, 카테고리 완료 여부....
    let categoryTitle : String
    let categorySubTitle : String
    let categoryIcon : String
    let isAllCleared : Bool
    let categoryInfo : Array<CategoryInfo>
    let completedNumber : Int
    let allNumber : Int
}
struct CategoryInfo : Codable, Identifiable {       // Category.siwft 에 들어가는 데이터    ex) 가이드 이름, 가이드 완료 여부
    let id : Int
    let guideName : String
    let isComplete : Bool
}


struct GuideStorage : Codable, Identifiable{        // 가이드 뷰에 들어가는 데이터            ex) 가이드 타이틀, 소리 발생 유무
    var id : Int
    var guideTitle : String
    var isSound : Bool
    var guideInfo : [GuideInfo]
}

struct GuideInfo: Codable, Identifiable{            // 가이드 상세 페이지마다 들어가는 데이터    ex) 가이드 뷰, 가이드 메세지, 페이지, 음성 안내
    var id : Int
    var guideView : [String]
    var guideMessage : [String]
    var totalPage : Double
    var voice : [String]
}


struct ClearStorage : Codable, Identifiable {       // 클리어 뷰 에 들어가는 데이터
    let id : Int
    let clearInfo : Array<ClearInfo>
}

struct ClearInfo : Codable, Identifiable {          // 클리어 뷰에 들어가는 상세 데이터   ex) 이미지, 클리어 메세지
    let id : Int
    let clearImage : String
    let clearMessage : String
}
