//
//  Card.swift
//  2024
//
//  Created by minn on 8/10/24.
//

import SwiftUI

struct RestaurantCard: View {
    var image1: String
    var image2: String
    var image3: String
    var name: String
    var rating: String
    var time: String
    var tip: String
    var min: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(image1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 263, height: 156, alignment: .center)
                    .clipped()
                    .padding(0)
                    .padding(.trailing, 2)
//                Spacer()
                VStack(alignment: .leading)  {
                    Image(image2)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 77, alignment: .center)
                        .clipped()
                        .padding(.bottom, 2)
//                    Spacer()
                    Image(image3)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 77, alignment: .center)
                        .clipped()
                }
                .frame(width: 88, height: 156)
            }
            .frame(width: 353, height: 156)
            HStack {
                Text(name)
                    .fontWeight(.bold)
                Text("★\(rating)")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 15)
            .padding(.top, 8)
            .padding(.bottom, 5)
            Text("Time \(time)min · Tip $\(tip) · Min $\(min)")
                .font(.system(size: 12))
                .foregroundColor(.black)
                .padding(.horizontal, 15)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.25), radius: 6.8, x: 0, y: 4)
    }
}

#Preview() {
    VStack() {
        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
//        FoodCard()
//        ReviewCard()
    }
}
