//
//  DataStruct2.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/11.
//

import Foundation
import SwiftUI

//guideViw
struct dataStruct2 <T: Codable>: Codable, Identifiable{
    var id : Int
    var guideTitle : String
    var isSound : Bool
    var gideInfo : [GideInfo<T>]
}

struct GideInfo <T: Codable>: Codable, Identifiable{
    var id : Int
    var guideImage : [T]
    var guideMessage : [String]
    var totalPage : Int
    var voice : [String]
}
