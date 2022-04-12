//
//  ClearView.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/08.
//

import SwiftUI

func shareButton() {
        let url = URL(string: "https://developer.apple.com/kr/")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
}

struct ClearView: View {
    var clear: ClearStorage
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("\(clear.clearInfo[0].clearMessage)")
                        .font(.title)
                }
                
                Image("\(clear.clearInfo[0].clearImage)")
                    .padding()
                
                Button(action: {
                    print("가이드 카테고리로 갑니다.")
                }, label: {
                    NavigationLink(destination: CategoryView(guideName: "아이폰 초보자 가이드", listInfos: categorydata[5].categoryInfo)){
                        Text("다른 가이드 배우기")
                            .foregroundColor(Color.white)
                    }
                })
                .frame(width: 300, height: 18, alignment: .center)
                .padding()
                .background(Color(red: 0, green: 0.5, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                
                Button(action: shareButton){
                    Text("이미지를 다른 사람에게 공유하기")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300, height: 18, alignment: .center)
                .padding()
                .background(Color(red: 0, green: 0.5, blue: 1))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
     
                Button(action: {
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
        ClearView(clear: cleardata[0] )
    }
}
