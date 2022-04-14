//
//  MemoFolder2.swift
//  Test
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct MemoFolder2: View {
    
    var videoName: String = "MemoFolder2"
    
    @State private var isGestured: Bool = false
    
    var body: some View {
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: "mov")!)
        
        VStack {
            ZStack {
                PlayerView(player: player)
                    .frame(width: 220, height: 477, alignment: .center)
                    .onAppear()
                    .disabled(true)
                
                TouchCircle(isGestured: $isGestured, player: player, xOffset: -90, yOffset: 205, opacity: 0.5)
            }
        }
        
    }
}

struct MemoFolder2_Previews: PreviewProvider {
    static var previews: some View {
        MemoFolder2()
    }
}
