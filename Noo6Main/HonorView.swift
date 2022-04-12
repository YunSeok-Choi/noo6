//  honorView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/07.
//

import SwiftUI

//****************** 진행도 카운트하는 변수 ******************//
var honorBasic = 0
var honorUseful = 2
var honorPhoto = 0
var honorCam = 0
var honorWidget = 0
var honorCalender = 0
var honorMemo = 0

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
                                Text("유용한 기능 \(honorUseful) / 6")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<6) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("아이폰 기초 \(honorBasic) / 4")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<4) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("사진 앱 \(honorPhoto) / 5")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<5) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("카메라 앱 \(honorCam) / 6")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<6) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("메모 앱 \(honorMemo) / 4")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<4) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("위젯 앱 \(honorWidget) / 6")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<6) { index in
                            ZStackView()
                        }
                    }
                    Section(header:
                                Text("캘린더 앱 \(honorCalender) / 6")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    ) {
                        ForEach(0..<6) { index in
                            ZStackView()
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
