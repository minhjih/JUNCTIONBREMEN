//
//  ContentView.swift
//  2024
//
//  Created by 임유리 on 7/31/24.
//

import SwiftUI
import SwiftData

enum tabs: Hashable {
    case home
    case delivery
    case chat
    case stats
}

struct homeView: View {
    @State private var sel = tabs.home
    var body: some View {
        NavigationStack {
            TabView(selection: $sel) {
                mainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(tabs.home)
                deliveryView()
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Delivery")
                    }
                    .tag(tabs.delivery)
                ChatView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Chatbot")
                    }
                    .tag(tabs.chat)
                statsView()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis.ascending")
                        Text("Statistics")
                    }
                    .tag(tabs.stats)
            }
            .accentColor(.priMain)
            .toolbar {
                switch sel {
                case .home:
                    ToolbarItem(placement: .principal) {
                        Text("Home")
                            .foregroundColor(.priMain)
                            .fontWeight(.black)
                            .italic()
                            .underline()
        //                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
                    }
                case .delivery:
                    ToolbarItem(placement: .principal) {
                        Text("Delivery")
                            .foregroundColor(.priMain)
                            .fontWeight(.black)
                            .italic()
                            .underline()
        //                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: cartView()) {
                            Image(systemName: "cart")
                                .foregroundColor(.priMain)
                        }
                    }
                case .chat:
                    ToolbarItem(placement: .principal) {
                        Text("Chatbot")
                            .foregroundColor(.priMain)
                            .fontWeight(.black)
                            .italic()
                            .underline()
        //                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
                    }
                case .stats:
                    ToolbarItem(placement: .principal) {
                        Text("Statistics")
                            .foregroundColor(.priMain)
                            .fontWeight(.black)
                            .italic()
                            .underline()
        //                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct statsView: View {
    var body: some View {
        VStack {
            CalendarView()
            Spacer()
        }
    }
}

    #Preview {
        homeView()
    }

