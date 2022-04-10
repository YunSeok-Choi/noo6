//
//  GuideView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI

struct GuideView: View {
    @State private var currentPage: Int = 0
    private let pages = guidelists.count
    var body: some View {
        NavigationView{
            VStack{
                VStack{ //guideView
                    TabView(selection: $currentPage){
                        ForEach(guidelists){i in
                            VStack{
                                Text(i.explain)
                                Image(i.image)
                                    .resizable()
                            }
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  //page처럼 구현 + ...을 안보이게함
                    
                }
                
                VStack {    //BottomView
                    HStack{
                        Button(action:{
                            
                        },label:{
                            Image(systemName: "speaker.wave.2.fill")
                                .clipShape(Circle())
                                .padding(5.0)
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1)) //아이콘 주변 원 ver.1
                            
                        })
                        .foregroundColor(.gray)
                        
                        Spacer()
                        ZStack{//아이콘 주변 원 ver.2
                            Circle()
                                .strokeBorder(.gray,lineWidth: 1)
                                .frame(width: 30, height: 30)
                            Button(action:{
                                
                            },label:{
                                Image(systemName: "repeat")
                            })
                            .foregroundColor(.gray)
                        }
                    }.padding(.horizontal)
                    ProgressView(value: 0.2)
                    HStack {
                        Button("< 이전 단계") {
                            if currentPage == 0 {
                                currentPage = guidelists.count-1
                                //return
                            }else{
                                currentPage -= 1
                            }
                        }
                        
                        Spacer()
                        
                        Text("\(currentPage+1)")
                        Text("/")
                        Text("\(pages)")
                        Spacer()
                        Button("다음 단계 >") {
                            if (currentPage == guidelists.count-1) {
                                currentPage = 0
                                //return
                            }else{
                                currentPage += 1
                            }
                        }
                        
                        
                    }
                }
                NavigationLink(destination: EmptyView()){//가이끝 뷰로 넘기기
                    //Text("맨 마지막에서 버튼")
                    
                }.navigationBarTitle("가이드 제목",displayMode: .inline)
                    .toolbar{
                        Button(action: {
                            //공유하기 기능 넣기
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                        })
                        
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
    GuideList(id: 0,image: "image1",explain: "explain1." ),
    GuideList(id: 1,image: "image2",explain: "explain2." ),
    GuideList(id: 2,image: "image3",explain: "explain3." ),
    GuideList(id: 3,image: "dog",explain: "explain4." )
    //똑같이 리스트로 추가
]
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
