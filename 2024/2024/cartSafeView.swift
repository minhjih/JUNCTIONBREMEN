//
//  CartView.swift
//  2024
//
//  Created by minn on 8/11/24.
//

import SwiftUI

struct cartSafeView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack() {
                Divider().opacity(0).padding(.top, 6)
                FoodCard(image: "rest2_1", name: "Premium Salad Bowl", description: "All the healthy ingredients ready for you! Dressing options available.", keys: ["Carbohydrate", "High Protein", "Low Fat", "High Vitamin"], price: "13.99")
                VStack {
                    HStack(alignment: .center) {
                        Image(systemName: "hand.thumbsup.fill")
                        Text("SAFE!")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 20))
                }
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(width: 353, height: 60)
                .background(.posMain)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: Color.black.opacity(0.25), radius: 6.8, x: 0, y: 4)
                .padding(.bottom, 6)
                //            Rectangle()
                //                .foregroundColor(.black3)
                //                .frame(width: 350, height: 1)
                //                .padding(.bottom, 6)
            }
        }
        Spacer()
        Rectangle()
            .foregroundColor(.black4)
            .frame(width: 393, height: 5)
            .padding(.bottom, 12)
        HStack {
            VStack(alignment: .leading) {
                Text("Minimum Order")
                    .font(.system(size: 10))
                Text("$8.99")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
            }
            .padding(.leading, 20)
            Spacer()
            Text("Order for $21.98")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 53)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundColor(.posMain)
                )
                .padding(.trailing, 20)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Cart")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.priMain)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    cartSafeView()
}
