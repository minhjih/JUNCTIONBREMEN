//
//  CartView.swift
//  2024
//
//  Created by minn on 8/11/24.
//

import SwiftUI

struct cartView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack() {
                Divider().opacity(0).padding(.top, 6)
                FoodCard(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")
                VStack {
                    HStack(alignment: .center) {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("UNSAFE!")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 20))
                    Text("This food contains 180mg of salt!")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                .foregroundColor(.white)
                .frame(width: 353, height: 60)
                .background(.negMain)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: Color.black.opacity(0.25), radius: 6.8, x: 0, y: 4)
                .padding(.bottom, 6)
                Rectangle()
                    .foregroundColor(.black3)
                    .frame(width: 350, height: 1)
                    .padding(.bottom, 6)
                FoodCard(image: "rest1_2", name: "Chili Hot Wings", description: "Delicious hot wings with the best chili sauce.", keys: ["Carbohydrate", "Protein", "High Fat"], price: "9.99")
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
                Text("$9.99")
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
                        .foregroundColor(.negMain)
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
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: cartSafeView()) {
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(.posMain)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    cartView()
}
