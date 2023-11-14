//
//  HomeView.swift
//  Beautiful Universe
//
//  Created by jeongyun on 11/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                NavigationLink(destination: DailyView()) {
                    Text("오늘의 우주보기")
                }
                NavigationLink(destination: DailyView()) {
                    Text("시간여행 우주보기")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
