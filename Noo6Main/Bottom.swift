//
//  Bottom.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI

struct Bottom: View {
    private let pages = guidelists.count
    var body: some View {
        VStack {
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
                Button("< 이전 단계"){
                
                }
                Spacer()
                Text("1")//--> Text("\(page)")
                Text("/")
                Text("\(pages)")
                Spacer()
                Button("다음 단계 >"){
                
                }
                
                
        }
    }

    }
}

struct Bottom_Previews: PreviewProvider {
    static var previews: some View {
        Bottom()
    }
}
