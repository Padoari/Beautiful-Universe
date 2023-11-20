//
//  TimeTravelView.swift
//  Beautiful Universe
//
//  Created by 김다빈 on 11/15/23.
//

import SwiftUI

struct TimeTravelView: View {
    
    @ObservedObject var manager = NetworkManager()
    @ObservedObject var multiNetworkManger = MultiNetworkManager()
    
    var body: some View {
        if manager.image != nil {
            ZStack(alignment: .center) {
                Image(uiImage: self.multiNetworkManger.infos.last?.image ?? self.manager.image!)
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
                    Text(multiNetworkManger.infos.last?.date ?? manager.photoInfo.date)
                        .font(.custom("Montserrat-Medium", size: 14))
                    Text(multiNetworkManger.infos.last?.title ?? manager.photoInfo.title)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    Button {
                        multiNetworkManger.timeTravel()
                        print("눌림")
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
