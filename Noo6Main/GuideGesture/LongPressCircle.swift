//
//  GuideGesture.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/09.
//

import SwiftUI
import AVFoundation

// 제스쳐 사용 예시 View
struct LongPressTestView: View {
    @State private var isLongPressed: Bool = false
    
    var body: some View {
        VStack {
            
            // LongPressCircle 사용예시
            LongPressCircle(isLongPressed: $isLongPressed, player: AVPlayer() ,width: 80, height: 80, opacity: 0.6)
            // LongPress 제스쳐 필요한 위치 및 애니메이션 위치
        }
    }
}

struct GuideGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressTestView()
    }
}

// '1초 이상 눌러주세요' Gesture
struct LongPressCircle: View {
    @GestureState private var isDetectingLongPress = false
    @Binding var isLongPressed: Bool
    @State private var animationAmount: CGFloat = 1
    
    let player: AVPlayer?
    let width: CGFloat
    let height: CGFloat
    let opacity: Double // opacity 0 으로 설정시 터치작동 x (권장 opcaity = 0.01)
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                isLongPressed = true
                if let player = player {
                    player.play()
                }
            }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                  Color.green:
                    (self.isLongPressed ? Color.gray.opacity(0) : Color.blue))
            .frame(width: 50, height: 50, alignment: .center)
            .gesture(longPress)
            .padding(5.0)
        
        //원이 깜빡이는 애니메이션
            .overlay(
                Circle()
                    .stroke(Color.blue, lineWidth: 2)
                    .scaleEffect(animationAmount)
                //animationAmount가 1이면 불투명이 1이고, 2이면 불투명도가 0이다
                    .opacity(Double(2 - animationAmount))
                    .animation(Animation.easeInOut(duration: 1.2)
                        .repeatForever(autoreverses: false))
                //제스쳐를 따라하고나서는 애니메이션이 사라짐
                    .opacity(self.isLongPressed ? 0 : 1)
            )
            .onAppear {
                self.animationAmount = 2
            }
            .opacity(opacity)
    }
    
}

