//
//  HonorDetailView.swift
//  Noo6Main
//
//  Created by Seyoung Choi on 2022/04/08.
//

import SwiftUI

//전체적인 업적 디테일 뷰입니다
struct HonorDetailView: View {
    var body: some View {
        VStack{
                Text("당신은 사진찍기 전문가!")
                .font(.largeTitle)
                .fontWeight(.semibold)
        ImageView()
        Text("어쩌구 저쩌구 설명 설명")
            .padding()
            .font(.system(size: 20))
            Spacer()
        ButtonView()
            Spacer()
        }
    }
}


//짤이 들어갈 이미지 뷰입니다
struct ImageView: View {
    var body: some View {
        Image("Test")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .padding()
                }
            }

//저장하기 버튼 뷰입니다
struct ButtonView: View {
    var body: some View {
            Button(action: {
            print("버튼 클릭")
        }){Text("이미지 저장하기")
                .frame(width: 352, height: 50)
                .font(.system(size:20, weight: .regular))
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(12)
        }
    }
}


struct HonorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HonorDetailView()
    }
}
