//
//  ContentView.swift
//  Noo6Main
//
//  Created by 최윤석 on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    let title: String = """
안녕하세요,
어떤 도움이 필요하신가요?
"""
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 30.0, weight: .semibold))
                CategoryList()
                    .padding(.trailing, -10)
                
            }
            .padding()

            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination:HonorView(),
                        label:{
                            Image(systemName: "archivebox")
                                .resizable()
                                .frame(width: 30, height: 30)
                        })
            )     
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HonorView: View {
    var body: some View {
       Text("HonorView")
    }
}
