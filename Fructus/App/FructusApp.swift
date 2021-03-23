//
//  FructusApp.swift
//  Fructus
//
//  Created by Vladimir Sukanica on 5.2.21..
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
            OnboardingView()
            } else {
            ContentView()
            }
        }
    }
}
