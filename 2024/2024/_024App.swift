//
//  _024App.swift
//  2024
//
//  Created by 임유리 on 7/31/24.
//

import SwiftUI

@main

struct _024App: App {
    @StateObject var sharedData = SharedData() // for sharing babyName
    
    var body: some Scene {
        WindowGroup {
            FisrtView()
                .environmentObject(sharedData)
//            homeView()
//            ContentView()
        }
    }
}

