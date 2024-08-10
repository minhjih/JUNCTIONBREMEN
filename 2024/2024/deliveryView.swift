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
                Text("Location + Sort/Filter")
                    .fontWeight(.bold)
                    .foregroundColor(.priMain)
                    .padding()
                ScrollView {
                    VStack(spacing: 19) {
                        NavigationLink(destination: deliveryMenuView()) {
                                RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
                        }
                        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
                        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
                        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
                        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
//                        RestaurantCard()
//                        RestaurantCard()
//                        RestaurantCard()
//                        RestaurantCard()
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Delivery")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
//                    cartView()
                }) {
                    Image(systemName: "cart")
                        .foregroundColor(.priMain)
                }
            }
        }
    }
}

#Preview {
    deliveryView()
}
