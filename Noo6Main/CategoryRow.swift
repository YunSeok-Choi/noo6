//
//  CategoryRow.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/07.
//

import SwiftUI

struct CategoryRow: View {
    var guideInfo: GuideInfo
    
    var body: some View {
        HStack(spacing: 15.0) {
            Image("dog")
                .resizable()
                .frame(width: 75.0, height: 75.0)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("\(guideInfo.description) (\(guideInfo.compledtedNumber)/\(guideInfo.allNumber))")
                    if guideInfo.isAllCleared {
                        Image(systemName: "crown")
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.blue)
                    }
                }
                Text(guideInfo.largeTitle)
                    .font(.system(size: 24, weight: .semibold))
            }
            
            Spacer()
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(guideInfo: guideInfos[0])
            CategoryRow(guideInfo: guideInfos[1])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
