//
//  MemoMakingWidget5.swift
//  Test
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct MemoMakingWidget5: View {
    
    var videoName: String = "MemoMakingWidget5"
    
    @State private var isGestured: Bool = false
    
    var body: some View {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mov")!)
        
        VStack {
            ZStack {
                    PlayerView(player: player)
                        .frame(width: 220, height: 477, alignment: .center)
                        .onAppear()
                        .disabled(true)
                
                LongPressCircle(isLongPressed: $isGestured, player: player, width: 100, height: 100, opacity: 0.5).offset(x: -53, y: -150)
            }
        }
        
    }
}
struct MemoMakingWidget5_Previews: PreviewProvider {
    static var previews: some View {
        MemoMakingWidget5()
    }
}
