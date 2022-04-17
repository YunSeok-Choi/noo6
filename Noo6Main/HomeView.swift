//
//  HomeView.swift
//  Noo6Main
//
//  Created by 이재웅 on 2022/04/08.
//

import SwiftUI

struct HomeView: View {
    
    // 2줄의 title을 편하게 구성하기 위함
    let title: String = """
안녕하세요,
어떤 도움이 필요하신가요?
"""
    // 홈뷰
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text(title)                                 // 안녕하세요, 어떤 도움이 필요하신가요?
                    .font(.system(size: 30.0, weight: .semibold))
                    .frame(width: 390, height: 75.0, alignment: .center)
                
                // 각 카테고리를 List로 표시하기 위한 View 호출
                CategoryList()
                    .frame(width: 390, height: 650, alignment: .center)
                    .padding()
            }
            .padding()
            .navigationBarItems(                            // 네비게이션 바 업적 뷰 이동
                trailing:
                    NavigationLink(
                        destination: HonorView(),
                        label:{
                            Image(systemName: "archivebox") // 업적 뷰 이미지
                                .resizable()
                                .frame(width: 30, height: 30)
                        })
            )
        }
        .edgesIgnoringSafeArea(.horizontal)
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
