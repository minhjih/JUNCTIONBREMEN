//
//  ContentView.swift
//  2024
//
//  Created by 임유리 on 7/31/24.
//

import SwiftUI

struct homeView: View {
    var body: some View {
        TabView {
            GreenTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            redTabView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Delivery")
                }
            
            blueTabView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Chatbot")
                }
            YellowTabView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis.ascending")
                    Text("Statistics")
                }
            
            
        }.accentColor(.secMain)
    }
}
    struct GreenTabView: View {
        var body: some View {
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                
                Text("\(1)")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
    
    struct redTabView: View {
        var body: some View {
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.red)
                
                Text("\(2)")
                    .font(.system(size: 70))
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
            }
        }
    }
    
    struct blueTabView: View {
        var body: some View {
            ZStack {
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                
                Text("\(3)")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
    
struct YellowTabView: View {
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

