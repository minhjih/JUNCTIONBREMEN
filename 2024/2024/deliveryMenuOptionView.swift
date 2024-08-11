//
//  deliveryMenuOptionView.swift
//  2024
//
//  Created by minn on 8/10/24.
//

import SwiftUI

struct deliveryMenuOptionView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var showCartView = false
    var image: String
    var name: String
    var description: String
    var keys: [String]
    var price: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("rest1_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 262, alignment: .center)
                    .clipped()
                Text(name)
                    .font(.system(size: 24))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 2)
                Rectangle()
                    .foregroundColor(.black4)
                    .frame(width: 350, height: 1)
                    .padding(.bottom, 6)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(.black3)
                WrapView(keys: keys)
                    .padding(.leading, 20)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Vitamin A")
                            .foregroundColor(.gray)
                            .frame(width: 95, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: 130 * 1.0, height: 10)
                        }
                        .cornerRadius(5)
                        Spacer()
                        Text("130 mg")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal, 20)
                    HStack {
                        Text("Salt")
                            .foregroundColor(.gray)
                            .frame(width: 95, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color.secMain)
                                .frame(height: 10)
                        }
                        .cornerRadius(5)
                        Spacer()
                        Text("180 mg")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 8)
                HStack {
                    Text("Price")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    Spacer()
                    Text("$\(price)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.trailing, 20)
                }
                Rectangle()
                    .foregroundColor(.black4)
                    .frame(width: 393, height: 5)
                    .padding(.bottom, 12)
                HStack {
                    Text("Option 1")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    Spacer()
                    Text("Required")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .foregroundColor(.tintMain).opacity(0.3)
                        )
                        .foregroundColor(.tintMain)
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 24)
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.tintMain)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 2)
                    Text("No side menu")
                        .font(.system(size: 16))
                    Spacer()
                    Text("+ $0")
                        .font(.system(size: 16))
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 18)
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black4)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black4)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 2)
                    Text("Potato Chips")
                        .font(.system(size: 16))
                    Spacer()
                    Text("+ $1.99")
                        .font(.system(size: 16))
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 18)
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black4)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black4)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 2)
                    Text("Cheese balls")
                        .font(.system(size: 16))
                    Spacer()
                    Text("+ $3.99")
                        .font(.system(size: 16))
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 18)
                Rectangle()
                    .foregroundColor(.black4)
                    .frame(width: 393, height: 5)
                    .padding(.bottom, 12)
                }
                HStack {
                    Text("Option 2")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    Spacer()
                }
                .padding(.bottom, 24)
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.tintMain)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 2)
                    Text("No sauce")
                        .font(.system(size: 16))
                    Spacer()
                    Text("+ $0")
                        .font(.system(size: 16))
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 18)
                HStack(alignment: .center) {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black4)
                        .padding(.leading, 20)
                        .padding(.trailing, 2)
                    Text("2x Seasoning")
                        .font(.system(size: 16))
                    Spacer()
                    Text("+ $0")
                        .font(.system(size: 16))
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 18)
                .background(
                    NavigationLink(destination: cartView(), isActive: $showCartView) {
                        EmptyView()
                    }
                )
        }
        .edgesIgnoringSafeArea(.top)
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
            Text("Add to Cart")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 53)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundColor(.priMain)
                )
                .padding(.trailing, 20)
                .onTapGesture {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Are you sure?"),
                        message: Text("This food contains 180mg of salt. Recommended amount is 100mg a day."),
                        primaryButton: .destructive(Text("Proceed")) {
                            showCartView = true
                        },
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
        }
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

struct ProgressBar: View {
    var progress: CGFloat
    var color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .frame(height: 10)
                .foregroundColor(Color.gray.opacity(0.3))
            Capsule()
                .frame(width: progress * 150, height: 10)
                .foregroundColor(color)
        }
        .padding(.horizontal)
    }
}

#Preview {
    deliveryMenuOptionView(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")
}
