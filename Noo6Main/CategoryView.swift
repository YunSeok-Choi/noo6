//
//  categoryView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/07.
//

import Foundation
import SwiftUI

struct CategoryView : View {
    // Text()에 현재 카테고리를 나타내기 위한 변수
    var guideName: String
    var listInfos : CategoryStorage

    var body: some View{
        VStack {
                VStack{
                    Text("\(guideName)에서 \n어떤 가이드를 받아 볼까요?")
                        .frame(width: 342)
                        .font(.system(size: 30))
                        .padding(.bottom, 40)
                        .multilineTextAlignment(.center)
                    
                    // 받은 카테고리의 가이드 제목(listInfos)에 따라 List에 이동할 버튼 생성
                    List(listInfos.categoryInfo, id: \.id) {
                        info in
                        // 버튼 누를 시 GuideView로 이동, 가이드의 컨텐츠를 담은 뷰의 이름을 넘겨줌
                        // 컨텐츠를 담은 View가 일부만 만들어져서 현재는 guidedata[0]로 고정
                        NavigationLink(destination: GuideView(guideStorage: guidedata[0], guideInfos: guidedata[0].guideInfo[info.id], idDatas: [listInfos.id, info.id])){
                            ContentList(contentInfo: info)
                                .listRowBackground(Color.white)
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                    .listStyle(.plain)
                    .background(Color.white)
                    
                }
            
        }.padding([.leading, .trailing], 16)
    }
    
}


// List에 들어갈 카테고리별 가이드 목록 (버튼 + 체크아이콘)
struct ContentList : View {
    var contentInfo : CategoryInfo // CategoryInfo: id, guideName, isComplete
    
    var body: some View{
        Button(action: {}){
            HStack{
                // 버튼에 가이드 제목 표시
                Text("\(contentInfo.guideName)")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                Spacer()
                // 해당 컨텐츠를 이전에 끝까지 완료했는지 확인
                if contentInfo.isComplete{
                    // 완료했으면 체크 이미지 표시
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
        }.frame(width: 320, height: 78)
            .cornerRadius(10).background(Color.white).cornerRadius(10).shadow(color: Color.gray, radius: 3, x: 0, y: 0)
        
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(guideName: "아이폰 초보자 가이드", listInfos: categorydata[2])
    }
}
