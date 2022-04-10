//
//  ImageView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI

struct GuideImageView: View {
    @State private var currentPage: Int = 0
    var body: some View {
        
        VStack{
            TabView(selection: $currentPage){
                ForEach(guidelists){i in
                    VStack{
                        Text(i.explain)
                        Image(i.image)
                            .resizable()
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  //page처럼 구현 + ...을 안보이게함
            
            Button("Next") {
                if currentPage == guidelists.count {
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
    let id: Int
    let image: String
    let explain: String
}

let guidelists = [
    GuideList(id: 0, image: "image1",explain: "explain1." ),
    GuideList(id: 1, image: "image2",explain: "explain2." ),
    GuideList(id: 2, image: "image3",explain: "explain3." )
    //똑같이 리스트로 추가
]

struct ImageView_Previews: PreviewProvider   {
    static var previews: some View {
        GuideImageView()
    }
}
