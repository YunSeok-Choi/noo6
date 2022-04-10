//
//  Bottom.swift
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

struct Bottom: View {
    private let pages = guidelists.count
    @State var now: Bool = true
    var body: some View {
        VStack {
            HStack{
                
                Button(action: {
                    if now { player?.stop() }
                    now.toggle()
                }){
                    Image(systemName: now ? "speaker.wave.2" : "speaker.slash")
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
                        .imageScale(.large)
                        .font(.title)
                }
            }.padding(.horizontal)
            
            ProgressView(value: 0.2)
            HStack {
                Button("< 이전 단계"){
                
                }
                Spacer()
                Text("1")//--> Text("\(page)")
                Text("/")
                Text("\(pages)")
                Spacer()
                ScrollViewReader{ proxy in
                    Button("다음 단계 >") {withAnimation(.spring()){
                        proxy.scrollTo(3,anchor: .top)
                    }
                }
                }
                
        }
    }

    }
}

struct Bottom_Previews: PreviewProvider {
    static var previews: some View {
        Bottom()
    }
}
