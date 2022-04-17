//
//  GuideView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI
import AVKit        //플랫폼의 기본 재생 환경과 일치하는 앱용 플레이어 인터페이스를 쉽게 제공

var player: AVAudioPlayer?
var voice = [String]()  //정식문법: Array<String> = ["정식", "문법"] ,단축문법: [String]()

func playSound(sound: String){     //음악 변환 함수
    //guard let 은 else와 return이 꼭 와야함, 값이 올지 안올지 정확히 알 수 없을 때 Optional 타입의 변수 사용 (변수명?), unwrap하기 -> 1. (변수!)로 강제로 2. if let or guard let
    //bundle은 실행 가능한 코드와 그 코드가 사용하는 자원을 포함하고 있는 디렉토리(전체, main은 현재,url을 통해 파일 이름과 확장자를 받아옴,(이름이 틀리면 확장자가 같은 첫번째 파일, 확장자가 다르면 이름이 같은 첫번째를 가져옴)
    
    
    guard let url = Bundle.main.url(forResource: sound, withExtension: ".wav") else {
        return
    }
    //try = 오류 발생할 수 있어도 실행해봄, do-catch로 감싸서 error발생시 catch에서 print함
    do{
        player = try AVAudioPlayer(contentsOf: url) //player에 url을 넣어줌
        player?.play()          // 플레이어 실행
        
    }catch let error {
        print("재생 오류 \(error.localizedDescription)")    //지역에 맞게 에러를 표시해줌
    }
}

struct GuideView: View {
    var guideStorage : GuideStorage //GuideStorage구조체를 가져옴
    @State var guideInfos: GuideInfo    //GuideInfo구조체를 가져옴
    var idDatas = [Int]()           //Int형 배열 idDatas
    
    @State private var currentPage: Int = 0 //현재 페이지 변수 currentPage
    @State var isSound: Bool = true //소리 판단 변수 isSound
    
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

                            
                            category[guideInfos.id]![guideInfos.guideView[i]]!  //카테고리 이중 dictionary [][]로 들어감 
                                .frame(height: 480)
                                .cornerRadius(24)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                        }
                    }
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  //page처럼 구현 + ...을 안보이게함
                .animation(.easeInOut)  //천천히 슬라이드 애니메이션
        }.onAppear(){   //onAppear(){action: } 위 화면이 로드되면 action을 진행함
            progressUp = 1/Double(guideInfos.totalPage) // 1을 총 페이지로 나눠서 1틱을 설정
        }
        
        VStack {
            HStack{
                Button(action: {                                    // 소리 상태 버튼
                    if isSound { player?.stop() }   //isSound(소리가 켜져있을 때) 누르면 소리 멈춤
                    isSound.toggle()        //isSound 소리 상태 바꾸기
                }){
                    Image(systemName: isSound ? "speaker.wave.1.fill" : "speaker.slash.fill")   //아이콘 이미지
                        .clipShape(Circle())
                        .padding(5)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(350)
                        .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
                        .imageScale(.large)
                        .font(.title)
                }.onAppear(){
                    isSound = guideStorage.isSound  //isSound를 받아오기,true를 받아옴.. 굳이..?
                    //isSound가 true면 현재 페이지에 맞춰 playSound에 url넘겨줌, false면 멈춤
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
                        if(progressUp >= 0.95){ //충분히 높은값 0.95를 넘으면
                            isGuideComplete = true  //단계 완료!
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
            
        }.navigationBarTitle("\(guideStorage.guideTitle)",displayMode: .inline) //inline형식: 최상단 중간에 작게 제목
        // 데이터 받아옴
            .toolbar{
                Button(action: {
                    shareButton()
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                })
                
            }
            .onAppear(){
                voice = guideInfos.voice    //voice에 GuideDate의 guideinfo의 voice 배열을 넣어줌
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

