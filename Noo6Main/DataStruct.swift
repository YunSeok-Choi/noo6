//
//  Data.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/11.
//

import Foundation

struct HomeData : Codable, Identifiable {
    var id : Int
    let title : String
    let isAllCleared : Bool
}
