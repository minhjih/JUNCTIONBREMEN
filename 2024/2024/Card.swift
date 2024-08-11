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
            HStack(alignment: .top, spacing: 2) {
                Image(image1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 263, height: 156, alignment: .center)
                    .clipped()
                VStack(alignment: .leading, spacing: 2) {
                    Image(image2)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 77, alignment: .center)
                        .clipped()
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
                    .font(.system(size: 20))
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
                .padding(.bottom, 18)
        }
        .frame(width: 353)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.25), radius: 6.8, x: 0, y: 4)
    }
}

struct FoodCard: View {
    var image: String
    var name: String
    var description: String
    var keys: [String]
    var price: String
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 122, height: 175, alignment: .center)
                .clipped()
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 16))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .padding(.top, 14)
                    .padding(.bottom, 3)
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(.black3)
                    .fixedSize(horizontal: false, vertical: true)
                WrapView(keys: keys)
                Text("$\(price)")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 18)
                    .padding(.bottom, 14)
            }
        }
        .background(.white)
        .frame(width: 353, height: 175)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(color: Color.black.opacity(0.25), radius: 6.8, x: 0, y: 4)
    }
}



struct WrapView: View {
    let keys: [String]
    
    var body: some View {
        
        FlexibleView(data: keys, spacing: 0) { key in
            var color: Color = .black4
            var fontColor: Color = .black
            var weight: Font.Weight = .regular
            
            switch key {
            case "High Protein":
                color = Color.posMain
                fontColor = .white
                weight = .bold
            case "Low Fat":
                color = Color.posMain
                fontColor = .white
                weight = .bold
            case "High Vitamin":
                color = Color.posMain
                fontColor = .white
                weight = .bold
            case "High Fat":
                color = Color.negMain
                fontColor = .white
                weight = .bold
            case "Spicy":
                color = Color.negMain
                fontColor = .white
                weight = .bold
            case "Salty":
                color = Color.negMain
                fontColor = .white
                weight = .bold
            case "Very Spicy":
                color = Color.black2
                fontColor = .white
                weight = .bold
            case "Very Salty":
                color = Color.black2
                fontColor = .white
                weight = .bold
            default:
                break
            }
            return AnyView(
                Text(key)
                    .font(.system(size: 8))
                    .fontWeight(weight)
                    .foregroundColor(fontColor)
                    .frame(height: 22)
                    .padding(.horizontal, 6)
                    .background(color)
                    .cornerRadius(18)
            )
        }
    }
}

struct FlexibleView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    var data: Data
    var spacing: CGFloat
    var content: (Data.Element) -> Content

    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0

        return ZStack(alignment: .topLeading) {
            ForEach(Array(data), id: \.self) { item in
                self.content(item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading) { d in
                        if abs(width - d.width) > geometry.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == self.data.last {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == self.data.last {
                            height = 0
                        }
                        return result
                    }
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geo -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geo.frame(in: .local).size.height
            }
            return .clear
        }
    }
}

#Preview() {
    VStack() {
        RestaurantCard(image1: "rest1_1", image2: "rest1_2", image3: "rest1_3", name: "Chicken Table", rating: "4.5", time: "40-45", tip: "2-4", min: "10")
        FoodCard(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")
//        ReviewCard()
    }
}
