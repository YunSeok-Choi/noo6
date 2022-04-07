//
//  CategoryRow.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/07.
//

import SwiftUI

struct CategoryRow: View {
    var description: String
    var largeTitle: String
    var compledtedNumber: Int
    var allNumber: Int
    var isAllCleared: Bool
    
    var body: some View {
        HStack(spacing: 15.0) {
            Image("dog")
                .resizable()
                .frame(width: 75.0, height: 75.0)
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("\(description) (\(compledtedNumber)/\(allNumber))")
                    if isAllCleared {
                        Image(systemName: "crown")
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.blue)
                    }
                }
                Text(largeTitle)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(description: "아이폰 초보자 가이드", largeTitle: "아이폰이 처음이신가요?", compledtedNumber: 0, allNumber: 4, isAllCleared: false)
            CategoryRow(description: "알면 유용한 기능", largeTitle: "알림을 없애볼까요?",compledtedNumber: 4, allNumber: 4, isAllCleared: true)
        }
        .previewLayout(.fixed(width: 500, height: 100))
    }
}
