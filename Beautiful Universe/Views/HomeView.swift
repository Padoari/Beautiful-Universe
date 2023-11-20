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
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 40.0) {
                    Text("Great Universe")
                        .foregroundStyle(.white)
                        .font(.custom("Montserrat-ExtraBold", size: 30))
                        .padding(.horizontal, 20)
                    VStack(spacing: 16) {
                        NavigationLink(destination: DailyView()) {
                            Text("→ Today's universe")
                                .foregroundStyle(.white)
                                .font(.custom("Montserrat-ExtraBold", size: 26))
                                .padding(.horizontal, 24)
                                .padding(.vertical, 24)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.green)
                                .cornerRadius(40)
                                .padding(.horizontal, 20)
                        }
                        NavigationLink(destination: TimeTravelView()) {
                            Text("→ Time travel")
                                .foregroundStyle(.white)
                                .font(.custom("Montserrat-ExtraBold", size: 26))
                                .padding(.horizontal, 24)
                                .padding(.vertical, 24)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.yellow)
                                .cornerRadius(40)
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
