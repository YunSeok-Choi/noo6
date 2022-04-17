//
//  CategoryRow.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/07.
//

import SwiftUI

struct CategoryRow: View {                                  // 카테고리 UI 구성
    //var guideInfo: GuideInfo
    @State var categoryStorage : CategoryStorage                   // 데이터 불러오는 변수
    
    var body: some View {
        HStack(spacing: 15.0) {
            Image(categoryStorage.categoryIcon)
                .resizable()
                .frame(width: 75.0, height: 75.0)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    // (현재 완료한 가이드 수 / 전체 가이드 수) 표시
                    Text(categoryStorage.categoryTitle+"(\(categoryStorage.completedNumber)/\(categoryStorage.allNumber))")
                    
                    // 가이드를 모두 완료했을 경우 왕관 이미지 생성됨
                    if (categoryStorage.completedNumber == categoryStorage.allNumber) {
                        Image(systemName: "crown")
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.blue)
                    }
                }
                // 각 카테고리 별 부연 설명 표시
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
