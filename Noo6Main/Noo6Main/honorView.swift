//
//  honorView.swift
//  Noo6Main
//
//  Created by Tempnixk on 2022/04/07.
//

import SwiftUI

//honor 변수는 임시로 생성했음. 가이드 완료시에 +1 되는 변수임.
let honorBasic = 5
let honorUseful = 1
let honorPhoto = 0
let honorCam = 0
let honorWidget = 0
let honorCalender = 0
let honorMemo = 0


struct honorView: View {
    var body: some View {
        VStack {
        ScrollView {
            Text("아이폰 기초 ( \(honorBasic) / 5 )")
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                        }
                HStack {
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0).hidden()//업적이 5개여서 여기서부터 hidden 시킴
                        }
            Text("유용한 기능 ( \(honorUseful) / 5 )")
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0)
                        }
                HStack {
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius: /*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0).hidden()//업적이 5개여서 여기서부터 hidden 시킴
                        }
                    }
            Text("사진 앱 ( \(honorPhoto) / 4 )")
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        }
                HStack {
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0).hidden()//업적이 4개까지여서 이 뒤로는 hidden 시킴
                    RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0).hidden()
                        }
                    }
                Text("카메라 앱 ( \(honorCam) / 4 )")
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                            }
                    HStack {
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0).hidden()//업적이 4개까지여서 이 뒤로는 hidden 시킴
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0).hidden()
                            }
                        }
                Text("캘린더 앱 ( \(honorCalender) / 4 )")
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                            }
                    HStack {
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0)
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=Corner Radius@*/10.0).frame(width: 100.0, height: 100.0).hidden()//업적이 4개까지여서 이 뒤로는 hidden 시킴
                        RoundedRectangle(cornerRadius:/*@PLACEHOLDER=CornerRadius@*/10.0).frame(width: 100.0, height: 100.0).hidden()
                            }
                        }
                

                
                }
            }
        }
    }
}

struct honorView_Previews: PreviewProvider {
    static var previews: some View {
        honorView()
    }
}

