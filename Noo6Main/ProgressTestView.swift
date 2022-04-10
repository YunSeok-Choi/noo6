//
//  ProgressTestView.swift
//  Noo6Main
//
//  Created by Eunbi Han on 2022/04/10.
//

import SwiftUI



struct ProgressTestView: View {
    @State var progressUp : Float = 0
    var body: some View {
        VStack{
            ProgressView(value: progressUp)
            NavigationView{
                Button("Next Stage"){
                    progressUp += 1/guideStageInfos.totalStage
                    if (progressUp>=1){
                        // 1 이상일 때만 ClearView로 이동하도록 코딩하기
                    }
                }
            }
            
        }
        
    }
}

// CategoryView에서 받아올 Guide정보 구조 (테스트용)
struct GuideStageInfo: Identifiable {
    let id = UUID()
    let title: String
    let totalStage: Float

}
 
// CategoryView에서 받아올 Guide정보 (테스트용)
let guideStageInfos = GuideStageInfo(title: "잠금화면 제스처", totalStage: 7)

struct ProgressTestView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTestView()
    }
}
