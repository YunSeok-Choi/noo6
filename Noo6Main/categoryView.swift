//
//  categoryView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/07.
//

import Foundation
import SwiftUI

struct categoryView : View {
    var titleList : [String] = ["첫번째 제목", "두번째 제목", "세번째 제목", "네번째 제목"]
    var body: some View{
        VStack {
            
            HStack {
                NavigationView{
                    VStack{
                        Text("아이폰 초보자 가이드에서 \n어떤 가이드를 받아 볼까요?")
                            .frame(width: 342)
                            .font(.system(size: 30))
                            .padding(.bottom, 40)
                            .multilineTextAlignment(.center)
          
                        //NavigationLink
                        ForEach(titleList.identified(by: \.id)){
                            
                        }
                        ContentButton(title: "잠금화면 제스처", checkValue : true)
                        List{
                            Text("1")
                        }


                        
                        Spacer()
                    }
                    
                    
                }

            }
            
            
            
        }.padding([.leading, .trailing], 16)
    }
    
    
}


struct ContentButton : View{
    var title : String = ""
    var checkValue : Bool

    var body: some View{
        Button(action : {}){
            HStack{
                Text("\(title)")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
                    .padding(.leading, 20)
                    //.background(Color.white).cornerRadius(15)
                Spacer()
                if checkValue{
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
            
        }.frame(width: 342, height: 78)
            .cornerRadius(10).background(Color.white).cornerRadius(10).shadow(color: Color.gray, radius: 3, x: 0, y: 0)


        
    }
}

struct categoryView_Previews: PreviewProvider {
    static var previews: some View {
        categoryView()
    }
}
