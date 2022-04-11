//
//  GuideGesture.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/09.
//

import SwiftUI

// 제스쳐 사용 예시 View
struct LongPressTestView: View {
    @State private var isLongPressed: Bool = false
    
    var body: some View {
        VStack {
            
                // LongPressCircle 사용예시
            LongPressCircle(isLongPressed: $isLongPressed, width: 80, height: 80, opacity: 0.5)
                
                // LongPress 제스쳐 필요한 위치 및 애니메이션 위치
            Text(isLongPressed ? "다음버튼을 눌러주세요!" : "다음버튼 안내애니메이션 작동전...")
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
            }
    }
    
    var body: some View {
        Circle()
            .fill(self.isDetectingLongPress ?
                  Color.gray:
                    (self.isLongPressed ? Color.green : Color.blue))
            .frame(width: 50, height: 50, alignment: .center)
            .gesture(longPress)
            .padding(5.0)
            .overlay(Circle().stroke(isLongPressed ? Color.green : Color.blue, lineWidth: 2))
            .opacity(opacity)
        
                     }

}

