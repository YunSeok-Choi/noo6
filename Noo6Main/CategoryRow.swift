//
//  CategoryRow.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/07.
//

import SwiftUI

struct CategoryRow: View {
    //var guideInfo: GuideInfo
    var categoryStorage : CategoryStorage
    
    var body: some View {
        HStack(spacing: 15.0) {
//          Category별 이미지 확정 시 데이터를 받아 이미지를 얻도록 변경 필요
            Image(categoryStorage.categoryIcon)
                .resizable()
                .frame(width: 75.0, height: 75.0)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text(categoryStorage.categoryTitle+"(\(categoryStorage.completedNumber)/\(categoryStorage.allNumber))")
                    //Text(" (\(categoryData.completedNumber)/\(categoryData.allNumber))")
                    // 가이드를 모두 완료했을 경우 왕관 이미지 생성됨
                    if (categoryStorage.isAllCleared) {
                        Image(systemName: "crown")
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.blue)
                    }
                }
                Text(categoryStorage.categorySubTitle)
                    .font(.system(size: 24, weight: .semibold))
            }
            
            Spacer()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(categoryStorage: categorydata[3])
            CategoryRow(categoryStorage : categorydata[4])
            CategoryRow(categoryStorage : categorydata[5])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
