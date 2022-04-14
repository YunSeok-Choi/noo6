//  honorView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/07.
//

import SwiftUI

//****************** 진행도 카운트하는 변수 ******************//
var honorUseful = 0
var honorBasic = 0
var honorPhoto = 0
var honorCam = 0
var honorMemo = 0
var honorWidget = 0
var honorCalender = 0
//CategoryData의 completedNumber를 이용하면 될듯 함.
//****************** 업적뷰 구현 *******************//

struct HonorView: View {
    

    //******************** 메인 뷰 *********************//
    var body: some View {
        
        ScrollView {
            VStack{
                ForEach(0..<categorydata.count){ i in
                    VStack{
                        Text("\(categorydata[i].categoryTitle) \(categorydata[i].completedNumber) / \(categorydata[i].allNumber)")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 10)
                        
                        HStack{
                            ForEach(0..<categorydata[i].allNumber) { index in
                                if (index <= 2){
                                    ZStackView(clearInfoData: cleardata[i].clearInfo[index], iscleared: [i, index])
                                }
                            }
                        }
                        .frame(width: 390, alignment: .center)
                        
                        HStack{
                            ForEach(0..<categorydata[i].allNumber) { index in
                                if (index >= 3){
                                    ZStackView(clearInfoData: cleardata[i].clearInfo[index], iscleared: [i, index])
                                        .frame(alignment: .leading)
                                }
                            }
                            Spacer()
                        }
                        .frame(alignment: .leading)
                        .padding()
                        
                        
                    }.padding(.bottom, 30)
                    
                }
            }
        }
    }
}

struct HonorView_Previews: PreviewProvider {
    static var previews: some View {
        HonorView()
    }
}
