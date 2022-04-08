//
//  LinkView.swift
//  Noo6Main
//
//  Created by Seyoung Choi on 2022/04/08.
//


//HonorDetailView를 링크해주는 뷰입니다
//HonorView가 대체합니다

import SwiftUI

struct LinkView: View {
    var body: some View {
                NavigationView{
                NavigationLink(destination: HonorDetailView()){
                    Text("Hello")
                    .navigationTitle("업적 모음집")
                    
                        }
                    }
                }
    }


struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
