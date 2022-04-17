//
//  categoryView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/07.
//

import Foundation
import SwiftUI

struct CategoryView : View {
    var guideName: String               // 현재 카테고리 이름을 넘겨받는 변수
    var listInfos : CategoryStorage     // 하나의 카테고리 안에 있는 모든 가이드의 정보를 가져옴
    
    var body: some View{
        VStack {
            VStack{
                
                // 현재 카테고리의 이름을 guideName으로 화면에 표시
                Text("\(guideName)에서 \n어떤 가이드를 받아 볼까요?")
                    .frame(width: 342)
                    .font(.system(size: 30))
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)    // 텍스트 중앙 정렬
                
                // 받은 카테고리의 가이드 제목(listInfos)에 따라 List에 이동할 버튼 생성
                List(listInfos.categoryInfo, id: \.id) {
                    info in
                    // 버튼 누를 시 GuideView로 이동, 가이드의 컨텐츠를 담은 뷰의 이름을 넘겨줌
                    // 컨텐츠를 담은 View가 일부만 만들어져서 현재는 guidedata[0]로 고정
                    NavigationLink(destination: GuideView(guideStorage: guidedata[0], guideInfos: guidedata[0].guideInfo[info.id], idDatas: [listInfos.id, info.id])){
                        ContentList(contentInfo: info)
                            .listRowBackground(Color.white)
                    }
                    .listRowSeparator(.hidden)  // 리스트의 요소를 나누는 줄 제거
                    
                }
                .listStyle(.plain)
                .background(Color.white)
                
            }
            
        }.padding([.leading, .trailing], 16)    // 화면에서 중앙정렬처럼 보이게 하기 위해 padding으로 임시조치
    }
    
}


// List에 들어갈 카테고리별 가이드 목록 (버튼 + 체크아이콘)
struct ContentList : View {
    var contentInfo : CategoryInfo // CategoryInfo: id, guideName, isComplete
    
    var body: some View{
        
        // 가이드 뷰로 넘어가기 위한 버튼
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
