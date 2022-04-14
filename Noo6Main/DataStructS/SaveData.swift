//
//  SaveData.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/14.
//

import Foundation

class CategoryCheck: ObservableObject{
    @Published var categoryCheck = false
    @Published var category: CategoryInfo?
    
}

class HomeCheck: ObservableObject{
    @Published var homeCheck = false
    
    var home: CategoryStorage?
    
    init(){
        
    }
}
