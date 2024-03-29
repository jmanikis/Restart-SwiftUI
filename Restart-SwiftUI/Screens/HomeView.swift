//
//  HomeView.swift
//  Restart-SwiftUI
//
//  Created by JC Manikis on 2021-12-27.
//

import SwiftUI

struct HomeView: View {

    //    MARK: - PROPERTY
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
    @State private var isAnimating : Bool = false

    //    MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
//            MARK: - HEADER
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                           value: isAnimating
                )
            }
            
//            MARK: - CENTER
            Text("The Time That Leads To Mastery Is Dependent On the Intensity Of Our Focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
//            MARK: - FOOTER
            Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnBoardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
