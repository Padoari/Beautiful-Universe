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
                    Spacer()
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                   startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                }
                
                VStack(alignment:.center,spacing: 8.0) {
                    Text(manager.photoInfo.date)
                        .font(.custom("Montserrat-Medium", size: 14))
                    Text(manager.photoInfo.title)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("우주여행")
                            .foregroundColor(.primary)
                            .padding()
                            .background()
                            .cornerRadius(12)
                    }
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
