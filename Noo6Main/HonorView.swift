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
                
                // 전체 카테고리 수 만큼 반복문
                ForEach(0..<categorydata.count){ i in
                    VStack{
                        
                        // 현재 카테고리 제목 표시
                        Text("\(categorydata[i].categoryTitle) \(categorydata[i].completedNumber) / \(categorydata[i].allNumber)")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 10)
                        
                        HStack{ // 3개까지 하나의 HStack 안에 넣어 이미지 목록을 구성
                            ForEach(0..<categorydata[i].allNumber) { index in
                                
                                // 이미지 목록에서 id 값이 0~2인 이미지 한줄에 ZStackView로 구현
                                if (index <= 2){
                                    // i: 카테고리의 번호, index: 카테고리 안의 가이드 번호
                                    // cleardata[i].clearInfo[index]: 현재 카테고리의 가이드 넘버의 정보 넘겨줌(사진, 클리어 메시지)
                                    ZStackView(clearInfoData: cleardata[i].clearInfo[index], iscleared: [i, index])
                                }
                            }
                        }
                        .frame(width: 390, alignment: .center)
                        
                        HStack{
                            ForEach(0..<categorydata[i].allNumber) { index in
                                
                                // 이미지 목록에서 id 값이 3이상인 이미지 한줄에 ZStackView로 구현
                                if (index >= 3){
                                    ZStackView(clearInfoData: cleardata[i].clearInfo[index], iscleared: [i, index])
                                        .frame(alignment: .leading)
                                }
                            }
                            Spacer()    // 두번째 HStack에서 왼쪽 정렬을 하기 위해 공백 삽입
                        }
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
