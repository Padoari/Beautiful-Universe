//
//  DailyView.swift
//  Beautiful Universe
//
//  Created by jeongyun on 11/11/23.
//

import SwiftUI

struct DailyView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    var body: some View {
        if manager.image != nil {
            ZStack(alignment: .center) {
                Image(uiImage: self.manager.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                   startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                    Spacer()
                }
                
                VStack(alignment:.center,spacing: 12) {
                    Text(manager.photoInfo.date)
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundStyle(Color.white.opacity(0.6))
                    Text(manager.photoInfo.title)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                
                    Spacer()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.top, 120)
            }
            .ignoresSafeArea()
        } else {
            Text("로딩중임둥")
        }
    }
}

#Preview {
    DailyView()
}
