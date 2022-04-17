//
//  ZStackView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/12.
//

import SwiftUI

struct ZStackView: View {
    var clearInfoData : ClearInfo   // 각 가이드 별 이미지(짤방)와 클리어메시지를 담은 ClearInfo 받아옴
    var iscleared = [Int]()         // 이미지를 가져오고 HonorDetailView로 카테고리,가이드 번호를 넘겨주기 위한
                                    // id 정보를 담은 Array 생성 iscleared-> [카테고리id값, 가이드id값]
    
    var body: some View {
        
        // HonorView에서 이미지를 썸네일처럼 보여주기 위해
        // 일정한 크기로 잠금/해금 이미지를 ZStack으로 표현
        ZStack{
            
            // 이미지를 누르면 HonorDetailView로 이동
            NavigationLink(destination: HonorDetailView(clearInfo: clearInfoData).toolbar{
                Button(action: {
                    shareButton()
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                    
                })
            }) {
                // categorydata에서 현재 가이드의 완료여부를 가져옴
                // 완료되었다면 짤방 이미지 표시
                if(categorydata[iscleared[0]].categoryInfo[iscleared[1]].isComplete){
                    Image(clearInfoData.clearImage)
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: 100, height: 100)
                        .shadow(color: .gray, radius: 3)
                        .padding(7)
                }
            }.zIndex(1) // ZStack의 Depth 변경 임시로 1로 만들어 두었으나, Double형 인수를 CategoryData의 Bool형 인수인 isComplete로부터 가져와야함 형변환을 하던, 함수를 만들어서 새로운 인수를 반환하던 해야함.
            
            // 조건문에서 가이드가 완료되지 않았다면 잠금 이미지 표시
            if(!categorydata[iscleared[0]].categoryInfo[iscleared[1]].isComplete){
                Image("LockedRectangle")
                .resizable()
                .cornerRadius(12)
                .frame(width: 100, height: 100)
                .shadow(color: .gray, radius: 3)
                .padding(7)
            }
            
            
        }
        
    }
    
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView(clearInfoData: cleardata[0].clearInfo[0], iscleared: [0,0])
    }
}

