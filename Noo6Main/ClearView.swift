//
//  ClearView.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/08.
//

import SwiftUI

func shareButton() {                                             //공유 버튼 함수

        let url = URL(string: "https://developer.apple.com/kr/")    // 공유 할 링크, 꼭 링크가 아니여도 [Any] 타입으로
        // 공유 기능 컨트롤러
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        // 공유 기능이 나오는 부분
    

        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
}

struct ClearView: View {
    var clear: ClearInfo
    var idData = [Int]()
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("\(clear.clearMessage)")               // 클리어 메세지
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
                
                Image("\(clear.clearImage)")                    // 클리어 이미지
                    .resizable()
                    .padding()
                    
                    
                
                Button(action: {                                // 가이드 카테고리로 넘어가는 버튼
                    print("가이드 카테고리로 갑니다.")
                }, label: {
                    NavigationLink(destination:CategoryView(guideName: categorydata[idData[0]].categoryTitle, listInfos: categorydata[idData[0]])){
                        Text("다른 가이드 배우기")
                            .foregroundColor(Color.white)
                    }
                })
                .frame(width: 300, height: 18, alignment: .center)
                .padding()
                .background(Color(red: 0, green: 0.5, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                
                Button(action: shareButton){                        // 공유하는 버튼
                    Text("이미지를 다른 사람에게 공유하기")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300, height: 18, alignment: .center)
                .padding()
                .background(Color(red: 0, green: 0.5, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
     
                Button(action: {                                    // 홈으로 가는 버튼
                    print("홈으로 갑니다.")
                }, label: {
                    NavigationLink(destination: HomeView()){
                        Text("홈으로 돌아가기")
                            .foregroundColor(Color.blue)
                    }
                })
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        ClearView(clear: cleardata[0].clearInfo[1] )
    }
}
