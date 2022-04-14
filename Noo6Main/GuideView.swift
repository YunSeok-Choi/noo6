//
//  GuideView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI
import AVKit

var player: AVAudioPlayer?
var voice = [""]

func playSound(sound: String){
    
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
    
    @State private var currentPage: Int = 0
    @State var isSound: Bool = true
    
    // progressUp: progressView 게이지 상태
    // isGuideComplete : 가이드 끝 단계인지 알려주는 변수
    @State var progressUp : Double = 1
    @State var isGuideComplete : Bool = false
    
    var body: some View {
        VStack{
            VStack{ //guideView
                TabView(selection: $currentPage){
                    ForEach(0..<Int(guideInfos.totalPage)){i in
                        VStack(){
                            Text("\(guideInfos.guideMessage[i])")
                                .font(.system(size: 30))
                                .frame(width: 358, height: 120)
                                .multilineTextAlignment(.center)
                          
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
            voice = guideInfos.voice
            progressUp = 1/Double(guideInfos.totalPage)
        }
        
        VStack {    //BottomView
            HStack{
                Button(action: {
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
                
                Button(action: {
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
            
            ProgressView(value: progressUp)
            
            HStack {
                // 현재 단계가 1 이상일 때만 이전 단계 작동
                Button("< 이전 단계") {
                    if (currentPage > 0) {
                        progressUp -= 1/Double(guideInfos.totalPage)
                        currentPage -= 1
                    }
                }
                .padding(.leading, 20.0)
                
                Spacer()
                Text("\(currentPage+1)")
                Text("/")
                //TODO: 가이드 전체 페이지수 필요
                Text("\(Int(guideInfos.totalPage))")
                Spacer()
                
                // 다음단계 및 ClearView로 가는 Button
                NavigationLink(destination: ClearView(clear: cleardata[0].clearInfo[2]), isActive: $isGuideComplete){
                    // 현재 가이드의 끝일 때에만 ClearView로 이동하도록 isActive
                    Button("다음 단계 >") {
                        if(progressUp >= 0.95){
                            isGuideComplete = true
                        }
                        else{
                            progressUp += 1/Double(guideInfos.totalPage)
                            currentPage += 1
                        }
                    }
                    .padding(.trailing, 20.0)
                }
            }
        }
        NavigationLink(destination: EmptyView()){//가이끝 뷰로 넘기기
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
    }
    
    
}


/*
struct GuideList: Identifiable, Hashable{//가이드리스트 구조체, 이미지와 설명넣기
    let id: Int
    let image: String
    let explain: String
}

let guidelists = [
    GuideList(id: 0,image: "Test2",explain: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest." ),
    GuideList(id: 1,image: "image2",explain: "explain2." ),
    GuideList(id: 2,image: "image3",explain: "explain3." ),
    GuideList(id: 3,image: "dog",explain: "explain4." )
    //똑같이 리스트로 추가
]
*/
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(guideStorage: guidedata[0], guideInfos: guidedata[0].guideInfo[0])
    }
}

// ---------------------- MemoGuide --------------------
/*
let guidelist = [memoList0, memoList1, memoList2, memoList3, memoList4]

let memoList0 = [
    GuideList(id: 0,image: "MemoWriting1", explain: "홈 화면에 있는 메모앱을 터치하세요." ),
    GuideList(id: 1,image: "MemoWriting2", explain: "우측 하단의 작성버튼을 터치하세요." ),
    GuideList(id: 2,image: "MemoWriting3", explain: "메모의 제목을 적은 다음 메모할 내용을 작성하세요." ),
]

let memoList1 = [
    GuideList(id: 0,image: "MemoFolder1",explain: "메모앱 좌측 상단의 '<폴더'를 터치하세요" ),
    GuideList(id: 1,image: "MemoFolder2",explain: "좌측 하단의 아이콘을 터치하세요." ),
    GuideList(id: 2,image: "MemoFolder3",explain: "'새로운 폴더'를 터치하세요." ),
    GuideList(id: 3,image: "MemoFolder4",explain: "폴더 이름을 입력하신 후 저장을 눌러주세요" ),
    GuideList(id: 4,image: "MemoFolder5",explain: "새로운 폴더를 터치하세면 해당 폴더로 이동합니다." ),
    GuideList(id: 5,image: "MemoFolder6",explain: "새로운 폴더가 완성되었습니다. 메모를 작성해보세요!" )
]

let memoList2 = [
    GuideList(id: 0,image: "MemoMove1",explain: "다른 폴더로 이동시킬 메모에서 우측 상단의 􀍡를 터치하세요." ),
    GuideList(id: 1,image: "MemoMove2",explain: "하단 메뉴의 '메모 이동'을 터치하세요." ),
    GuideList(id: 2,image: "MemoMove3",explain: "이동시킬 폴더를 터치하세요."),
    GuideList(id: 3,image: "MemoMove4",explain: "폴더를 확인하면 메모가 이동한 것을 확인할 수 있습니다.")
]

let memoList3 = [
    GuideList(id: 0,image: "MemoMakingWidget1",explain: "배경화면의 빈공간을 1초 이상 눌러주세요." ),
    GuideList(id: 1,image: "MemoMakingWidget2",explain: "좌측 상단의 +버튼을 터치하세요." ),
    GuideList(id: 2,image: "MemoMakingWidget3",explain: "메모앱 위젯을 터치해주세요." ),
    GuideList(id: 3,image: "MemoMakingWidget4",explain: "사용에 맞게 메모 또는 폴더를 선택하고 위젯추가를 눌러주세요." ),
    GuideList(id: 4,image: "MemoMakingWidget5",explain: "위젯을 원하는 위치로 옮긴 후 우측상단의 ‘완료’버튼을 터치하세요." )
]

let memoList4 = [
    GuideList(id: 0,image: "MemoAddPicture1",explain: "키보드 위에 있는 􀌞버튼을 터치해주세요" ),
    GuideList(id: 1,image: "MemoAddPicture2",explain: "'사진 또는 비디오 선택'을 터치하세요'." ),
    GuideList(id: 2,image: "MemoAddPicture3",explain: "원하는 사진 또는 비디오를 선택하세요." ),
    GuideList(id: 3,image: "MemoAddPicture4",explain: "선택 후 '추가'를 눌러주세요." ),
    GuideList(id: 4,image: "MemoAddPicture5", explain: "다음과 같이 사진이 추가되었습니다." )
]*/

//----------------------- SimulationViews ---------------------------

let memoWriting: [String: AnyView] = ["MemoWriting1": AnyView(MemoWriting1()), "MemoWriting2": AnyView(MemoWriting2()), "MemoWriting3": AnyView(MemoWriting3())]

let memoFolder: [String: AnyView] = ["MemoFolder1": AnyView(MemoFolder1()), "MemoFolder2": AnyView(MemoFolder2()), "MemoFolder3": AnyView(MemoFolder3()), "MemoFolder4": AnyView(MemoFolder4()), "MemoFolder5": AnyView(MemoFolder5()), "MemoFolder6": AnyView(MemoFolder6())]

let memoMove: [String: AnyView] = ["MemoMove1": AnyView(MemoMove1()), "MemoMove2": AnyView(MemoMove2()), "MemoMove3": AnyView(MemoMove3()), "MemoMove4": AnyView(MemoMove4())]

let memoWidget: [String: AnyView] = ["MemoMakingWidget1": AnyView(MemoMakingWidget1()), "MemoMakingWidget2": AnyView(MemoMakingWidget2()), "MemoMakingWidget3": AnyView(MemoMakingWidget3()), "MemoMakingWidget4": AnyView(MemoMakingWidget4()), "MemoMakingWidget5": AnyView(MemoMakingWidget5())]

let memoPicture: [String: AnyView] = ["MemoAddPicture1" : AnyView(MemoAddPicture1()), "MemoAddPicture2" : AnyView(MemoAddPicture2()), "MemoAddPicture3" : AnyView(MemoAddPicture3()), "MemoAddPicture4" : AnyView(MemoAddPicture4()), "MemoAddPicture5" : AnyView(MemoAddPicture5())]

//----------------------- Guide Category ----------------------
let category: [Int: [String: AnyView]] = [0 : memoWriting, 1 : memoFolder, 2 : memoMove, 3: memoWidget, 4 : memoPicture]
