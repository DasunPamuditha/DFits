//
//  WelcomeView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("item2")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width:393 ,height:852,alignment: .center)
                
                
                RoundedRectangle(cornerRadius: 100)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.78)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 400, height: 390)
                    .blur(radius: 10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                    ).offset(y:267)
                
                VStack
                {
                    Text("D'Fits")
                        .font(.custom("AmericanTypewriter", size: 50))
                        .foregroundColor(Color.black)
                        .frame(width: 308, height: 132)
                        .offset(y: 210)
                    
                    Text("The best place you can match your personality to the latest Fashions!")
                        .font(Font.custom("Skranji", size: 19))
                        .foregroundColor(Color(red: 136/255, green: 136/255, blue: 136/255))
                        .frame(width: 388)
                        .offset(y: 190)
                    
                    
                    NavigationLink(destination: DashboardView())
                    {
                        Text("EXPLORE")
    
                    }.font(.custom("Mongolian Baiti", size: 17))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.color)
                        .cornerRadius(30)
                        .padding(15)
                        .shadow(radius: 5)
                        .offset(y: 210)
                }
                
            }.padding(.horizontal, 15)
        }
    }
}

#Preview {
    WelcomeView()
}
