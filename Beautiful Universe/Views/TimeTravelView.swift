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
                Image(uiImage: multiNetworkManger.infos.last?.image ?? self.manager.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                   startPoint: .top, endPoint: .bottom)
                    .frame(height: 300)
                    Spacer()
                }
                
                VStack(alignment:.center,spacing: 8.0) {
                    Text(multiNetworkManger.infos.last?.date ?? manager.photoInfo.date)
                        .font(.custom("Montserrat-SemiBold", size: 14))
                    Text(multiNetworkManger.infos.last?.title ?? manager.photoInfo.title)
                        .font(.custom("Montserrat-Bold", size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                    
                    Spacer()

                    Button {
                        multiNetworkManger.timeTravel()
                        print("눌림")
                    } label: {
                        HStack {
                            Text("Traveling to space")
                            Image(systemName: "sparkles")
                                .foregroundColor(.accentColor)
                        }
                        .foregroundStyle(.white)
                        .font(.custom("Montserrat-ExtraBold", size: 20))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.top, 120)
            }
            .ignoresSafeArea()
        } else {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                Text("Loading...")
                    .foregroundStyle(.white)
                    .font(.custom("Montserrat-ExtraBold", size: 20))
            }
        }
    }
}

#Preview {
    DailyView()
}
