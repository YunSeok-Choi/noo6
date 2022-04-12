//
//  DragCircle.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/10.
//

import SwiftUI

struct DragTestView: View {
    @State private var isMovedOnPoint = false
    
    var body: some View {
        VStack {
            DragCircle(isMovedOnPoint: $isMovedOnPoint, xPoint: 100.0, yPoint: 100.0, startOpacity: 0.8, endOpacity: 0.4)
            Text(isMovedOnPoint ? "드래그 성공!" : "올바른 위치로 드래그해주세요.")
        }
    }
}

struct DragCircle_Previews: PreviewProvider {
    static var previews: some View {
        DragTestView()
    }
}

// 반드시 드래그위치를 테스트 한 후 사용
struct DragCircle: View {
    @State private var isDragging = false
    @State private var offset: CGSize = .zero
    @Binding var isMovedOnPoint: Bool   // 상위 View에서 사용할 Bool타입 변수를 바인딩 시켜 사용
    @State private var animationAmount: CGFloat = 1
    
    
    var xPoint: CGFloat         // 드래그 시킬 offset xPoint (왼쪽 - / 오른쪽 +)
    var yPoint: CGFloat         // 드래그 시킬 offset yPoint (위 - / 아래 +)
    var gap: CGFloat = 30.0     // x, yPoint와의 오차범위 / 기본설정 권장 (변경가능)
    
    var startOpacity: CGFloat = 0.01   // 드래그 시작점 Circle의 Opacity (드래그테스트하는 경우에만 임의 값 설정)
    var endOpacity: CGFloat = 0.01     // 드래그 끝점 Circle의 Opacity  (드래그테스트하는 경우에만 임의 값 설정)
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                offset = value.translation
            }
            .onEnded { value in
                self.isDragging = false
                print(offset)
                
                if offset.width > xPoint - gap, offset.width < xPoint + gap, offset.height > yPoint - gap, offset.height < yPoint + gap{
                    isMovedOnPoint = true
                } else {
                    isMovedOnPoint = false
                }
                offset = .zero
            }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(self.isMovedOnPoint ? Color.gray : Color.blue)
                    .frame(width: 50, height: 50)
                    .offset(x: offset.width, y: offset.height)
                    .opacity(startOpacity)
                    .gesture(drag)
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .scaleEffect(animationAmount)
                        //animationAmount가 1이면 불투명이 1이고, 2이면 불투명도가 0이다
                            .opacity(Double(2 - animationAmount))
                            .animation(Animation.easeInOut(duration: 1.2)
                                .repeatForever(autoreverses: false))
                        //제스쳐를 따라하고나서는 애니메이션이 사라짐
                            .opacity(self.isMovedOnPoint ? 0 : 1)
                    )
                    .onAppear {
                        self.animationAmount = 2

                    }
                Circle()
                    .fill(self.isMovedOnPoint ? Color.gray : Color.blue)
                    .frame(width: 50, height: 50)
                    .opacity(endOpacity)
                    .offset(x: xPoint, y: yPoint)
            }
        }
    }
}
