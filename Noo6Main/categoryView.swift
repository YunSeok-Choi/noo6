//
//  categoryView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/07.
//

import Foundation
import SwiftUI

struct categoryView : View {

    var body: some View{
        VStack {
            NavigationView{
                VStack{
                    Text("아이폰 초보자 가이드에서 \n어떤 가이드를 받아 볼까요?")
                        .frame(width: 342)
                        .font(.system(size: 30))
                        .padding(.bottom, 40)
                        .multilineTextAlignment(.center)
                    
                    List(contentInfos, id: \.id) {
                        info in
                        NavigationLink(destination: EmptyView()){
                            ContentList(contentInfo: info)
                                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                                .listRowBackground(Color.white)
                                .listRowSeparator(.hidden)
                                .padding(.trailing, 100)
                        }
                        .listRowSeparator(.hidden)
                            .frame(width: 405, height: 78, alignment: .center)
                        
                    }
                    .listStyle(.plain)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.all)
                    .padding()
                    
                    Spacer() // 화면 상단에 List를 보여주기 위해 공백 삽입
                }
                
            }
            
        }.padding([.leading, .trailing], 16)
    }
    
}

// List에 들어갈 Array의 구조
struct ContentInfo: Identifiable {
    let id = UUID()
    let title: String
    let isComplete: Bool

}

// List에 들어갈 Array에 데이터 넣기
let contentInfos = [
    ContentInfo(title: "잠금화면 제스처", isComplete: false),
    ContentInfo(title: "앱 페이지의 기본 제스처", isComplete: true),
    ContentInfo(title: "홈 화면의 기본 제스처", isComplete: false),
    ContentInfo(title: "홈 화면을 편집하는 방법", isComplete: false)
]

// List에 들어갈 카테고리별 컨텐츠 목록 (버튼 + 체크아이콘)
struct ContentList : View {
    var contentInfo : ContentInfo
    var body: some View{
        Button(action: {}){
            HStack{
                Text("\(contentInfo.title)")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                    //.background(Color.white).cornerRadius(15)
                Spacer()
                if contentInfo.isComplete{
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


struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        categoryView()
    }
}
