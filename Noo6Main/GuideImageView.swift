//
//  ImageView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI

struct GuideImageView: View {
    @State var currentPage: Int = 0
    var body: some View {
        VStack {
                    TabView(selection: $currentPage) {
                        ForEach(0..<5) { i in
                            ZStack {
                                [Color.yellow, .red, .blue].randomElement()
                                Text("\(i)")
                            }.clipShape(Rectangle())
                        }
                    }.tabViewStyle(PageTabViewStyle())

                    Button("Next") {
                        if currentPage == 4 {
                            currentPage = 0
                            //return
                        }else{
                            currentPage += 1
                        }

                    }
        }
    }
}
struct GuideList: Identifiable, Hashable{//가이드리스트 구조체, 이미지와 설명넣기
    let id = UUID() //UUID = 고유식별자
    let title : String // 현재 가이드의 제목
    let image: String
    let totalStage : Float // 현재 가이드의 총 단계
    let explain: String
}

let guidelists = [
    GuideList(title: "잠금화면", image: "image1", totalStage : 7, explain: "설명란입니다1." ),
    GuideList(title : "test2", image: "image2", totalStage : 5, explain: "설명란입니다2." ),
    GuideList(title : "test2", image: "image3", totalStage : 4, explain: "설명란입니다3." )
    //똑같이 리스트로 추가
]
struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        GuideImageView()
    }
}
