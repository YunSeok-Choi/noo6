//
//  MemoMove2.swift
//  Test
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct MemoMove2: View {
    
    var videoName: String = "MemoMove2"
    
    @State private var isGestured: Bool = false
    
    var body: some View {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mov")!)
        
        VStack {
            ZStack {
                PlayerView(player: player)
                    .frame(width: 220, height: 477, alignment: .center)
                    .onAppear()
                    .disabled(true)
                
                TouchCircle(isGestured: $isGestured, player: player, xOffset: -74, yOffset: 170, opacity: 0.5)
            }
        }
        
    }
}

struct MemoMove2_Previews: PreviewProvider {
    static var previews: some View {
        MemoMove2()
    }
}
