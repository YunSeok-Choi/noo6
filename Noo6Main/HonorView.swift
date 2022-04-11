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

//****************** 잠금 해금 구현 파트 *******************//
struct Unlock{
    var value: Double  = 0
}



//****************** 업적뷰 구현 *******************//
struct HonorView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    
    //****************** 객체 생성(각 가이드 완료시 생성되는 객체임, 추후 위치 이동 필요) *******************//
    
    var unlockUsefulOne : Unlock = Unlock(value: 1)
    var unlockUsefulTwo : Unlock = Unlock(value: 0)
    var unlockUsefulThree : Unlock = Unlock(value: 0)
    var unlockUsefulFour : Unlock = Unlock(value: 0)
    var unlockUsefulFive : Unlock = Unlock(value: 1)
    var unlockUsefulSix : Unlock = Unlock(value: 0)
    
    var unlockBasicOne : Unlock = Unlock(value: 0)
    var unlockBasicTwo : Unlock = Unlock(value: 0)
    var unlockBasicThree : Unlock = Unlock(value: 0)
    var unlockBasicFour : Unlock = Unlock(value: 0)
    var unlockBasicFive : Unlock = Unlock(value: 0)
    var unlockBasicSix : Unlock = Unlock(value: 0)
    
    var unlockPhotoOne : Unlock = Unlock(value: 1)
    var unlockPhotoTwo : Unlock = Unlock(value: 0)
    var unlockPhotoThree : Unlock = Unlock(value: 0)
    var unlockPhotoFour : Unlock = Unlock(value: 0)
    var unlockPhotoFive : Unlock = Unlock(value: 0)
    var unlockPhotoSix : Unlock = Unlock(value: 0)
    
    var unlockCamOne : Unlock = Unlock(value: 1)
    var unlockCamTwo : Unlock = Unlock(value: 0)
    var unlockCamThree : Unlock = Unlock(value: 0)
    var unlockCamFour : Unlock = Unlock(value: 0)
    var unlockCamFive : Unlock = Unlock(value: 0)
    var unlockCamSix : Unlock = Unlock(value: 0)
    
    var unlockWidgetOne : Unlock = Unlock(value: 1)
    var unlockWidgetTwo : Unlock = Unlock(value: 0)
    var unlockWidgetThree : Unlock = Unlock(value: 0)
    var unlockWidgetFour : Unlock = Unlock(value: 0)
    var unlockWidgetFive : Unlock = Unlock(value: 0)
    var unlockWidgetSix : Unlock = Unlock(value: 0)
    
    var unlockMemoOne : Unlock = Unlock(value: 1)
    var unlockMemoTwo : Unlock = Unlock(value: 0)
    var unlockMemoThree : Unlock = Unlock(value: 0)
    var unlockMemoFour : Unlock = Unlock(value: 0)
    var unlockMemoFive : Unlock = Unlock(value: 0)
    var unlockMemoSix : Unlock = Unlock(value: 0)
    
    var unlockCalenderOne : Unlock = Unlock(value: 1)
    var unlockCalenderTwo : Unlock = Unlock(value: 0)
    var unlockCalenderThree : Unlock = Unlock(value: 0)
    var unlockCalenderFour : Unlock = Unlock(value: 0)
    var unlockCalenderFive : Unlock = Unlock(value: 0)
    var unlockCalenderSix : Unlock = Unlock(value: 0)
    
    
    
    //******************** 메인 뷰 *********************//
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center, // 가운데 정렬
                    spacing: 6,
                    pinnedViews: [.sectionHeaders], // 섹션 구현시 고정해준다.
                    content: {
                        
                        //****************** 유용한 기능 *******************//
                        Section(header:
                                    Text("유용한 기능 \(honorUseful) / 6")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                                
                        ) {
                            
                            
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockUsefulSix.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        
                        //****************** 아이폰 기초 *******************//
                        
                        Section(header:
                                    Text("아이폰 기초 \(honorBasic) / 4")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockBasicOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockBasicOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockBasicOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockBasicOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        
                        //****************** 사진 *******************//
                        
                        Section(header:
                                    Text("사진 앱 \(honorPhoto) / 5")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        
                        //****************** 카메라 *******************//
                        Section(header:
                                    Text("카메라 앱 \(honorCam) / 6")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockPhotoSix.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        
                        //****************** 메모 *******************//
                        Section(header:
                                    Text("메모 앱 \(honorMemo) / 6")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockMemoSix.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        //****************** 위젯 *******************//
                        Section(header:
                                    Text("위젯 앱 \(honorWidget) / 6")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockWidgetSix.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                        
                        //****************** 캘린더 *******************//
                        
                        Section(header:
                                    Text("캘린더 앱 \(honorCalender) / 6")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        ) {
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderOne.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderTwo.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderThree.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderFour.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderFive.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                            ZStack{
                                NavigationLink(destination: HonorDetailView()) {
                                    Image("Rectangle")
                                }.zIndex(unlockCalenderSix.value) // ZStack의 Depth 변경
                                Image("LockedRectangle")
                            }
                        }
                    })
            }
        }
    }
}


struct HonorView_Previews: PreviewProvider {
    static var previews: some View {
        HonorView()
    }
}

