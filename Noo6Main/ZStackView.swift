//
//  ZStackView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/12.
//

import SwiftUI

struct ZStackView: View {
    var clearInfoData : ClearInfo
    var iscleared = [Int]()
    var body: some View {
        ZStack{
            
            
            NavigationLink(destination: HonorDetailView(clearInfo: clearInfoData).toolbar{
                Button(action: {
                    //공유하기 기능
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                    
                })
            }) {
                if(categorydata[iscleared[0]].categoryInfo[iscleared[1]].isComplete){
                    Image(clearInfoData.clearImage)
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: 100, height: 100)
                        .shadow(color: .gray, radius: 3)
                        .padding(7)
                }
                else{
                    Image("LockedRectangle")
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: 100, height: 100)
                        .shadow(color: .gray, radius: 3)
                        .padding(7)
                }
                
            }.zIndex(1) // ZStack의 Depth 변경 임시로 1로 만들어 두었으나, Double형 인수를 CategoryData의 Bool형 인수인 isComplete로부터 가져와야함 형변환을 하던, 함수를 만들어서 새로운 인수를 반환하던 해야함.
            
        }
    }
    
}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView(clearInfoData: cleardata[0].clearInfo[1], iscleared: [0,0])
    }
}

