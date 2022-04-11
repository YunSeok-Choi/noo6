//
//  GuideView.swift
//  Noo6Main
//
//  Created by hurdasol on 2022/04/08.
//

import SwiftUI
import AVKit

var player: AVAudioPlayer?
var voice = ["Cow-moo-sound"]

func playSound(sound: String){
    
    guard let url = Bundle.main.url(forResource: sound, withExtension: ".mp3") else {
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
    @State private var currentPage: Int = 0
    @State var now: Bool = true
    
    // progressUp: progressView 게이지 상태
    // isGuideComplete : 가이드 끝 단계인지 알려주는 변수
    @State var progressUp : Double = 1/Double(guidelists.count)
    @State var isGuideComplete : Bool = false
    
    private let pages = guidelists.count
    
    var body: some View {
            VStack{
                VStack{ //guideView
                    TabView(selection: $currentPage){
                        ForEach(guidelists){i in
                            VStack{
                                Text(i.explain)
                                Image(i.image)
                                    .resizable()
                            }
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  //page처럼 구현 + ...을 안보이게함
                    
                }
                
                VStack {    //BottomView
                    HStack{
                        Button(action: {
                            if now { player?.stop() }
                            now.toggle()
                        }){
                            Image(systemName: now ? "speaker.wave.1.fill" : "speaker.slash.fill")
                                .clipShape(Circle())
                                .padding(5)
                                .overlay(Circle().stroke(Color.blue,lineWidth: 2))
                                .frame(height: 60)
                                .imageScale(.large)
                                .font(.title)
                        }.onAppear(){
                            now ? playSound(sound: voice[0]) : player?.stop()
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            now ? playSound(sound: voice[0]) : player?.stop()
                        }){
                            Image(systemName: "repeat")
                                .clipShape(Circle())
                                .padding(5)
                                .frame(height: 60)
                                .overlay(Circle().stroke(Color.blue, lineWidth:  2))
                                .imageScale(.large)
                                .font(.title)
                        }
                    }.padding(.horizontal)
                    
                    ProgressView(value: progressUp)
                    
                    HStack {
                        // 현재 단계가 1 이상일 때만 이전 단계 작동
                        Button("< 이전 단계") {
                            if (currentPage > 0) {
                                progressUp -= 1/Double(guidelists.count)
                                currentPage -= 1
                            }
                        }
                        
                        Spacer()
                        Text("\(currentPage+1)")
                        Text("/")
                        Text("\(pages)")
                        Spacer()
                        
                        // 다음단계 및 ClearView로 가는 Button
                        NavigationLink(destination: ClearView(), isActive: $isGuideComplete){
                            // 현재 가이드의 끝일 때에만 ClearView로 이동하도록 isActive
                            Button("다음 단계 >") {
                                if(progressUp >= 0.95){
                                    isGuideComplete = true
                                }
                                else{
                                    progressUp += 1/Double(guidelists.count)
                                    currentPage += 1
                                }
                            }
                        }
                    }
                }
                NavigationLink(destination: EmptyView()){//가이끝 뷰로 넘기기
                    //Text("맨 마지막에서 버튼")
                    
                }.navigationBarTitle("가이드 제목",displayMode: .inline)
                    .toolbar{
                        Button(action: {
                            shareButton()
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                        })
                        
                    }
            }
        
        
    }
}

struct GuideList: Identifiable, Hashable{//가이드리스트 구조체, 이미지와 설명넣기
    let id: Int
    let image: String
    let explain: String
}

let guidelists = [
    GuideList(id: 0,image: "image1",explain: "explain1." ),
    GuideList(id: 1,image: "image2",explain: "explain2." ),
    GuideList(id: 2,image: "image3",explain: "explain3." ),
    GuideList(id: 3,image: "dog",explain: "explain4." )
    //똑같이 리스트로 추가
]
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
