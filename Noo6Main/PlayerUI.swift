//
//  PlayerUI.swift
//  Test
//
//  Created by 이재웅 on 2022/04/11.
//

import SwiftUI
import AVKit


// AVPlayer의 Controller를 숨기기 위한 코드
struct PlayerView: UIViewRepresentable {
    let player: AVPlayer
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<PlayerView>) {

    }

    func makeUIView(context: Context) -> UIView {
        return PlayerUIVIew(player: player)
    }
}

class PlayerUIVIew: UIView {
    private let playerLayer = AVPlayerLayer()
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer.frame = bounds
        }
}


