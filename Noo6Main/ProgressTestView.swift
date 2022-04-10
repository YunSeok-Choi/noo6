//
//  ProgressTestView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/10.
//

import SwiftUI



struct ProgressTestView: View {
    @State var progressUp : Double = 1/guideStageInfos.totalStage;
    @State var isGuideComplete : Bool = false
    @State var currentStage : Double = 1
    @State var totalStage : Double = guideStageInfos.totalStage
    
    var body: some View {
        NavigationView{
            VStack{
                
                ProgressView(value: progressUp)
                HStack{
                    // 이전단계로 가는 Button
                    Button("이전 단계"){ // 1단계 이전으로 돌아갈 수 없도록 조건 부여
//                        if((progressUp - (1/guideStageInfos.totalStage)) > 1/guideStageInfos.totalStage){
                        if(currentStage > 1){
                            progressUp -= 1/guideStageInfos.totalStage
                            currentStage -= 1
                        }
                    }
                    Spacer()
                    Text("\(Int(currentStage))")
                    Text("/")
                    Text("\(Int(guideStageInfos.totalStage))")
                    Spacer()
                    // 다음단계 및 ClearView로 가는 Button
                    NavigationLink(destination: ClearView(), isActive: $isGuideComplete){
                        // 현재 가이드의 끝일 때에만 ClearView로 이동하도록 isActive
                        Button("다음 단계"){
                            if(progressUp >= 0.98){
                                isGuideComplete = true
                            }
                            else{
                                progressUp += 1/totalStage
                                currentStage += 1
                            }
                        }
                    }
                }
                
                
            }
            
        }
        
    }
}

// CategoryView에서 받아올 Guide정보 구조 (테스트용)
struct GuideStageInfo: Identifiable {
    let id = UUID()
    let title: String   // 현재 가이드 타이틀 이름
    let totalStage: Double // 현재 가이드 총 스테이지
    // 현재 음소거/소리 모드 상태 변수 : Bool-> 이 경우 데이터베이스에 정보 업데이트 필요

}
 
// CategoryView에서 받아올 Guide정보 (테스트용)
let guideStageInfos = GuideStageInfo(title: "잠금화면 제스처", totalStage: 7)

struct ProgressTestView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTestView()
    }
}
