//
//  deliveryView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//
import SwiftUI

struct deliveryView: View {
    var body: some View {
        NavigationStack {
            VStack {
//                Text("Location + Sort/Filter")
//                    .fontWeight(.bold)
//                    .foregroundColor(.priMain)
//                    .padding()
                ScrollView {
                    VStack(spacing: 19) {
                        NavigationLink(destination: deliveryMenuView()) {
                                RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "9.99")
                        }
                        RestaurantCard(image1: "rest3_1", image2: "rest3_2", image3: "rest3_3", name: "Donburi", rating: "3.9", time: "25-40", tip: "1-3", min: "8.99")
                        ZStack {
                            RestaurantCard(image1: "rest4_1", image2: "rest4_2", image3: "rest4_3", name: "Salad Bowls", rating: "4.8", time: "20-30", tip: "1-4", min: "8.99")
                            Image(systemName: "leaf.circle.fill")
                                .font(.system(size: 72))
                                .rotationEffect(.degrees(2))
                                .foregroundColor(.posMain)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(.bottom, 28)
                                .padding(.trailing, 16)
                                .shadow(color: Color.black.opacity(0.05), radius: 6.8, x: 4, y: 4)
                        }
                        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "9.99")
                        RestaurantCard(image1: "rest3_1", image2: "rest3_2", image3: "rest3_3", name: "Donburi", rating: "3.9", time: "25-40", tip: "1-3", min: "8.99")
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    deliveryView()
}
