//
//  deliveryMenuView.swift
//  2024
//
//  Created by minn on 8/10/24.
//

import SwiftUI

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()

        for edge in edges {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var w: CGFloat = rect.width
            var h: CGFloat = rect.height

            switch edge {
            case .top:
                h = width
            case .bottom:
                y = rect.height - width
                h = width
            case .leading:
                w = width
            case .trailing:
                x = rect.width - width
                w = width
            }

            path.addRect(CGRect(x: x, y: y, width: w, height: h))
        }

        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
struct deliveryMenuView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("rest1_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 262, alignment: .center)
                    .clipped()
                Text("Chicken Table")
                    .font(.system(size: 24))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 2)
                Text("★4.5")
                    .font(.system(size: 16))
                Rectangle()
                    .foregroundColor(.black4)
                    .frame(width: 350, height: 1)
                    .padding(.bottom, 6)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Time")
                        Text("Tip")
                        Text("Min")
                    }
                    .padding(.leading, 25)
                    VStack(alignment: .leading) {
                        Text("40-45min")
                        Text("$2-4")
                        Text("$9.99")
                    }
                    .padding(.leading, 34)
//                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.black4)
                    .frame(width: 393, height: 5)
                    .padding(0)
                HStack(spacing: 0){
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Text("Menu")
                            .font(.system(size: 14))
                            .foregroundColor(selectedTab == 0 ? .black : .black4)
                            .frame(width: 393/2, height: 40)
                            .border(width: selectedTab == 0 ? 2 : 1, edges: selectedTab == 0 ? [.top] : [.trailing, .bottom], color: selectedTab == 0 ? .black2 : .black4)
                    }
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Text("Review")
                            .font(.system(size: 14))
                            .foregroundColor(selectedTab == 1 ? .black : .black4)
                            .frame(width: 393/2, height: 40)
                            .border(width: selectedTab == 1 ? 2 : 1, edges: selectedTab == 1 ? [.top] : [.leading, .bottom], color: selectedTab == 1 ? .black2 : .black4)
                    }
                }
                .padding(.bottom, 13)
                if selectedTab == 0 {
                    VStack(spacing: 16){
                        NavigationLink(destination: deliveryMenuOptionView(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")) {
                            FoodCard(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")
                        }
                        FoodCard(image: "rest1_2", name: "Chili Hot Wings", description: "Delicious hot wings with the best chili sauce.", keys: ["Carbohydrate", "Protein", "High Fat"], price: "9.99")
                        FoodCard(image: "rest1_3", name: "Seasoned Chicken", description: "Famous seasoned chicken. Verified flavour.", keys: ["Carbohydrate", "Protein", "High Fat", "Salty"], price: "8.99")
                    }
                } else {
//                    Text("ReviewView()")
                    // PLACEHOLDER
                    VStack {
                        Image("Review")
                        Image("Review")
                        Image("Review")
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.priMain)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: cartView()) {
                    Image(systemName: "cart")
                        .foregroundColor(.priMain)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    deliveryMenuView()
}
