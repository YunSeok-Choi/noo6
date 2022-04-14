//
//  TouchCircle.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/12.
//

import SwiftUI
import AVKit

struct TouchCircle: View {
    @Binding var isGestured: Bool
    
    let player: AVPlayer?
    let xOffset: CGFloat
    let yOffset: CGFloat
    let opacity: Double
    
    var body: some View {
        if !isGestured {
            Button {
                isGestured = true
                if let player = player {
                    player.play()
                }
            } label: {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50, alignment: .center)
            }
            .offset(x: xOffset, y: yOffset)
            .opacity(isGestured ? 0 : opacity)
        }
    }
}

