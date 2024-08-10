//
//  ContentView.swift
//  2024
//
//  Created by 임유리 on 7/31/24.
//

import SwiftUI
import SwiftData

struct homeView: View {
    @Query var myModels: [MyModel]
    var body: some View {
        TabView {
            mainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
           deliveryView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Delivery")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Chatbot")
                }
//            CalendarView(month: Date(), myModels: myModels).modelContainer(for: MyModel.self)
            CalendarView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis.ascending")
                    Text("Statistics")
                }
            
            
        }.accentColor(.secMain)
    }
}

struct statsView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
            
            Text("\(4)")
                .font(.system(size: 70))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

    #Preview {
        homeView()
    }

