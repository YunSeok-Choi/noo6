//
//  MemoMakingWidget1.swift
//  Test
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct MemoMakingWidget1: View {
    
    var videoName: String = "MemoMakingWidget1"
    
    @State private var isGestured: Bool = false
    
    var body: some View {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mov")!)
        
        VStack {
            ZStack {
                PlayerView(player: player)
                    .frame(width: 220, height: 477, alignment: .center)
                    .onAppear()
                    .disabled(true)
                
                LongPressCircle(isLongPressed: $isGestured, player: player, width: 120, height: 120, opacity: 0.5).offset(x: 65, y: 150)
            }
        }
        
    }
}


struct MemoMakingWidget1_Previews: PreviewProvider {
    static var previews: some View {
        MemoMakingWidget1()
    }
}
