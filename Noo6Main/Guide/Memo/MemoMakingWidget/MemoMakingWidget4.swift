//
//  MemoMakingWidget4.swift
//  Test
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct MemoMakingWidget4: View {
    
    var videoName: String = "MemoMakingWidget4"
    
    @State private var isMovedOnPoint: Bool = false
    
    var body: some View {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mov")!)
        
        
        VStack {
            ZStack {
                    PlayerView(player: player)
                        .frame(width: 220, height: 477, alignment: .center)
                        .onAppear()
                        .disabled(true)
                
                DragCircle(isMovedOnPoint: $isMovedOnPoint, player: player, xPoint: -100, yPoint: -0, gap: 50, startOpacity: 1, endOpacity: 1)
            }
        }
        
    }
}

struct MemoMakingWidget4_Previews: PreviewProvider {
    static var previews: some View {
        MemoMakingWidget4()
    }
}
