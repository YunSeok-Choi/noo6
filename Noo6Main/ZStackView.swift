//
//  ZStackView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/12.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        ZStack{
            NavigationLink(destination: HonorDetailView().toolbar{
                Button(action: {
                //공유하기 기능
            }, label: {
                Image(systemName: "square.and.arrow.up")
            })
            }) {
                Image("Rectangle")
            }.zIndex(1) // ZStack의 Depth 변경 임시로 1로 만들어 두었으나, Double형 인수를 CategoryData의 Bool형 인수인 isComplete로부터 가져와야함 형변환을 하던, 함수를 만들어서 새로운 인수를 반환하던 해야함.
            Image("LockedRectangle")
        }
    }

}

struct ZStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
    }
}
