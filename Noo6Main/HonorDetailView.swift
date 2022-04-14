//
//  HonorDetailView.swift
//  Noo6Main
//
//  Created by Seyoung Choi on 2022/04/08.
//


import SwiftUI

struct HonorDetailView : View {
    var clearInfo : ClearInfo
    var body: some View{
        VStack{
            Text("\(clearInfo.clearMessage)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 300)
            Image("\(clearInfo.clearImage)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding()
            Spacer()
            ButtonView()
            Spacer()
        }
    }
}

//저장하기 버튼 뷰입니다
struct ButtonView: View {
    var body: some View {
            Button(action: {//사진 저장
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
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
        HonorDetailView(clearInfo: cleardata[5].clearInfo[4])
    }
}
