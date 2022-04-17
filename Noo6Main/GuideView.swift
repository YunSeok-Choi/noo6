//
//  GuideView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI
import AVKit

var player: AVAudioPlayer?
var voice = [String]()

func playSound(sound: String){                  //          음악 변환 함수
    
    guard let url = Bundle.main.url(forResource: sound, withExtension: ".wav") else {
        return
    }
    
    do{
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
        
    }catch let error {
        print("재생 오류 \(error.localizedDescription)")
    }
}

struct GuideView: View {
    var guideStorage : GuideStorage
    @State var guideInfos: GuideInfo
    var idDatas = [Int]()
    
    
    @State private var currentPage: Int = 0
    @State var isSound: Bool = true
    
    // progressUp: progressView 게이지 상태
    // isGuideComplete : 가이드 끝 단계인지 알려주는 변수
    @State var progressUp : Double = 1
    @State var isGuideComplete : Bool = false
    
    var body: some View {                                   //가이드 설명, 제스쳐 뷰
        VStack{
            VStack{ //guideView
                TabView(selection: $currentPage){
                    ForEach(0..<Int(guideInfos.totalPage)){i in
                        VStack(){
                            Text("\(guideInfos.guideMessage[i])")
                                .font(.system(size: 30))
                                .frame(width: 358, height: 120)
                                .multilineTextAlignment(.center)
                                                                                // 168 라인 참조
                            category[guideInfos.id]![guideInfos.guideView[i]]!
                                .frame(height: 480)
                                .cornerRadius(24)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                        }
                    }
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  //page처럼 구현 + ...을 안보이게함
                .animation(.easeInOut)
        }.onAppear(){
            progressUp = 1/Double(guideInfos.totalPage)
        }
        
        VStack {
            HStack{
                Button(action: {                                    // 소리 상태 버튼
                    if isSound { player?.stop() }
                    isSound.toggle()
                }){
                    Image(systemName: isSound ? "speaker.wave.1.fill" : "speaker.slash.fill")
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(350)
                        .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                        .imageScale(.large)
                        .font(.title)
                }.onAppear(){
                    isSound = guideStorage.isSound
                    isSound ? playSound(sound: voice[currentPage]) : player?.stop()
                }
                
                Spacer()
                
                Button(action: {                                     // 소리 반복 버튼
                    isSound ? playSound(sound: voice[currentPage]) : player?.stop()
                }){
                    Image(systemName: "repeat")
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(350)
                        .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                        .imageScale(.large)
                        .font(.title)
                }
            }.padding(.horizontal)
            
            ProgressView(value: progressUp)                           // 진행 상태 바
            
            HStack {
                // 현재 단계가 1 이상일 때만 이전 단계 작동
                Button("< 이전 단계") {                                 // 단계 변경 버튼
                    if (currentPage > 0) {
                        progressUp -= 1/Double(guideInfos.totalPage)
                        currentPage -= 1
                        isSound ? playSound(sound: voice[currentPage]) : player?.stop()
                    }
                }
                .padding(.leading, 20.0)
                
                Spacer()
                Text("\(currentPage+1)")
                Text("/")
                Text("\(Int(guideInfos.totalPage))")
                Spacer()
                
                // 다음단계 및 ClearView로 가는 Button
                NavigationLink(destination: ClearView(clear: cleardata[idDatas[0]].clearInfo[idDatas[1]], idData: idDatas), isActive: $isGuideComplete){
                    // 현재 가이드의 끝일 때에만 ClearView로 이동하도록 isActive
                    Button("다음 단계 >") {
                        if(progressUp >= 0.95){
                            isGuideComplete = true
                        }
                        else{
                            progressUp += 1/Double(guideInfos.totalPage)
                            currentPage += 1
                            isSound ? playSound(sound: voice[currentPage]) : player?.stop()
                        }
                    }
                    .padding(.trailing, 20.0)
                }
            }
        }
        NavigationLink(destination: EmptyView()){               //가이끝 뷰로 넘기기
            //Text("맨 마지막에서 버튼")
            
        }.navigationBarTitle("\(guideStorage.guideTitle)",displayMode: .inline)
        // 데이터 받아옴
            .toolbar{
                Button(action: {
                    shareButton()
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                })
                
            }
            .onAppear(){
                voice = guideInfos.voice
            }
    }
    
    
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(guideStorage: guidedata[0], guideInfos: guidedata[0].guideInfo[0])
    }
}

// 포기하면 편해,,,
// 딕셔너리 2번 참조, 가이드의 id 를 받고, 받은 id에 맞는 카테고리를 참조,
// 그 후, 175 라인 참조
//----------------------- Guide Category ----------------------
let category: [Int: [String: AnyView]] = [0 : memoWriting, 1 : memoFolder, 2 : memoMove, 3: memoWidget, 4 : memoPicture]


// 가이드 뷰의 이름(String)을 받아와 무슨 뷰인지 찾은 후, AnyView 타입으로 변환시켜 반환
//----------------------- SimulationViews ---------------------------


let memoWriting: [String: AnyView] = ["MemoWriting1": AnyView(MemoWriting1()), "MemoWriting2": AnyView(MemoWriting2()), "MemoWriting3": AnyView(MemoWriting3())]

let memoFolder: [String: AnyView] = ["MemoFolder1": AnyView(MemoFolder1()), "MemoFolder2": AnyView(MemoFolder2()), "MemoFolder3": AnyView(MemoFolder3()), "MemoFolder4": AnyView(MemoFolder4()), "MemoFolder5": AnyView(MemoFolder5()), "MemoFolder6": AnyView(MemoFolder6())]

let memoMove: [String: AnyView] = ["MemoMove1": AnyView(MemoMove1()), "MemoMove2": AnyView(MemoMove2()), "MemoMove3": AnyView(MemoMove3()), "MemoMove4": AnyView(MemoMove4())]

let memoWidget: [String: AnyView] = ["MemoMakingWidget1": AnyView(MemoMakingWidget1()), "MemoMakingWidget2": AnyView(MemoMakingWidget2()), "MemoMakingWidget3": AnyView(MemoMakingWidget3()), "MemoMakingWidget4": AnyView(MemoMakingWidget4()), "MemoMakingWidget5": AnyView(MemoMakingWidget5())]

let memoPicture: [String: AnyView] = ["MemoAddPicture1" : AnyView(MemoAddPicture1()), "MemoAddPicture2" : AnyView(MemoAddPicture2()), "MemoAddPicture3" : AnyView(MemoAddPicture3()), "MemoAddPicture4" : AnyView(MemoAddPicture4()), "MemoAddPicture5" : AnyView(MemoAddPicture5())]

