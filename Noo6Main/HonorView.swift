//  honorView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/07.
//

import SwiftUI
let honorBasic = 0
let honorUseful = 1
let honorPhoto = 0
let honorCam = 0
let honorWidget = 0
let honorCalender = 0
let honorMemo = 0

struct RR{
    
}

struct HonorView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
    
                
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
             
                    Section(header:
                                Text("아이폰 기초 \(honorBasic) / 4")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                               
                    ) {
                        ForEach(0..<4) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }                        }
                    }
                    Section(header:
                                Text("사진 앱 \(honorPhoto) / 5")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                
                               
                    ) {
                        ForEach(0..<5) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }
                        }
                    }
                    
                    Section(header:
                                Text("카메라 앱 \(honorCam) / 6")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                               
                    ) {
                        ForEach(0..<6) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }
                        }
                    }
                    
                    Section(header:
                                Text("메모 앱 \(honorMemo) / 6")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                               
                    ) {
                        ForEach(0..<6) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }
                        }
                    }
                    Section(header:
                                Text("위젯 앱 \(honorWidget) / 6")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                               
                    ) {
                        ForEach(0..<6) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }
                        }
                    }
                    Section(header:
                                Text("캘린더 앱 \(honorCalender) / 6")
                                .font(.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                               
                    ) {
                        ForEach(0..<6) { index in
                            Button(action: {}) {
                                            Image("Rectangle")
                            }
                        }
                    }

                    
                    
                })
        }
    }
}


struct HonorView_Previews: PreviewProvider {
    static var previews: some View {
        HonorView()
    }
}
