//
//  LinkView.swift
//  Noo6Main
//
//  Created by Seyoung Choi on 2022/04/08.
//


//HonorDetailView를 연결하기 위한 임시 뷰

import SwiftUI

struct LinkView: View {
    var body: some View {
                NavigationView{
                    NavigationLink(destination: HonorDetailView().toolbar{
                        Button(action: {
                        //공유하기 기능
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                    }){
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
