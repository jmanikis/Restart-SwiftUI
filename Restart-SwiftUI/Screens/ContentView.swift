//
//  ContentView.swift
//  Restart-SwiftUI
//
//  Created by JC Manikis on 2021-12-27.
//

import SwiftUI


struct ContentView: View {
    
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    
    
    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

