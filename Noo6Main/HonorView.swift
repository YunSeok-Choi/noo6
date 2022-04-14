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
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    //******************** 메인 뷰 *********************//
    var body: some View {
        
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center, // 가운데 정렬
                spacing: 6,
                pinnedViews: [.sectionHeaders], // 섹션 구현시 고정해준다.
                content: {
                    Section(header:
                                Text("아이폰 초보자 가이드 \(categorydata[0].completedNumber) / \(categorydata[0].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[0].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[0].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("유용한 기능 \(categorydata[1].completedNumber) / \(categorydata[1].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[1].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[1].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("캘린더 \(categorydata[2].completedNumber) / \(categorydata[2].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[2].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[2].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("사진 \(categorydata[3].completedNumber) / \(categorydata[3].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[3].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[3].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("카메라 \(categorydata[4].completedNumber) / \(categorydata[4].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[4].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[4].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("메모 \(categorydata[5].completedNumber) / \(categorydata[5].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[5].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[5].clearInfo[index])
                        }
                    }
                    Section(header:
                                Text("위젯 \(categorydata[6].completedNumber) / \(categorydata[6].allNumber)")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<categorydata[6].allNumber) { index in
                            ZStackView(clearInfoData: cleardata[6].clearInfo[index])
                        }
                    }
                }
            )
        }
    }
}

struct HonorView_Previews: PreviewProvider {
    static var previews: some View {
        HonorView()
    }
}
