//
//  carouselView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//


import SwiftUI
//struct carouselView: View {
//    @State private var currentIndex: Int = 0
//    @GestureState private var dragOffset: CGFloat = 0
//    private let images: [String] = ["Timeline_Week3", "Timeline_Week4", "Timeline_Week3", "Timeline_Week4", "Timeline_Week3"]
//    
//    var body: some View {
//
//            
//                ZStack {
//                    ForEach(0..<images.count, id: \.self) { index in
//                        Image(images[index])
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 268, height: 700)
//                            .cornerRadius(20)
//                            .opacity(currentIndex == index ? 1.0 : 0.5)
//                            .scaleEffect(currentIndex == index ? 1.0 : 0.9)
//                            .offset(x: CGFloat(index - currentIndex) * 270 + dragOffset, y: 0)
//                    }
//                }
//                .padding(.bottom, 24)
//                .gesture(
//                    DragGesture()
//                        .onEnded { value in
//                            let threshold: CGFloat = 50
//                            if value.translation.width > threshold {
//                                withAnimation {
//                                    currentIndex = max(0, currentIndex - 1)
//                                }
//                            } else if value.translation.width < -threshold {
//                                withAnimation {
//                                    currentIndex = min(images.count - 1, currentIndex + 1)
//                                }
//                            }
//                        }
//                )
//            }
//            .padding(.bottom, 20)
//        }

//struct carouselView: View { //-> 이동
    //    @State private var currentIndex: Int = 0
    //    @GestureState private var dragOffset: CGFloat = 0
    //    private let images: [String] = ["Timeline_Week3", "Timeline_Week4", "Timeline_Week3", "Timeline_Week4", "Timeline_Week3"]
    //
    //    var body: some View {
    //
    //            VStack {
    //                Rectangle()
    //                    .fill(Color.blue)
    //                    .frame(width: 100, height: 100)
    //                Rectangle()
    //                    .fill(Color.blue)
    //                    .frame(width: 100, height: 100)
    //                Rectangle()
    //                    .fill(Color.blue)
    //                    .frame(width: 100, height: 100)
    //                Rectangle()
    //                    .fill(Color.blue)
    //                    .frame(width: 100, height: 100)
    //                Rectangle()
    //                    .fill(Color.blue)
    //                    .frame(width: 100, height: 100)
    //                ZStack {
    //                    ForEach(0..<images.count, id: \.self) { index in
    //                        Image(images[index])
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 268, height: 700)
    //                            .cornerRadius(20)
    //                            .opacity(currentIndex == index ? 1.0 : 0.5)
    //                            .scaleEffect(currentIndex == index ? 1.0 : 0.9)
    //                            .offset(x: CGFloat(index - currentIndex) * 270 + dragOffset, y: 0)
    //                    }
    //                }
    //                .padding(.bottom, 24)
    //                .gesture(
    //                    DragGesture()
    //                        .onEnded { value in
    //                            let threshold: CGFloat = 50
    //                            if value.translation.width > threshold {
    //                                withAnimation {
    //                                    currentIndex = max(0, currentIndex - 1)
    //                                }
    //                            } else if value.translation.width < -threshold {
    //                                withAnimation {
    //                                    currentIndex = min(images.count - 1, currentIndex + 1)
    //                                }
    //                            }
    //                        }
    //                )
    //            }
    //            .padding(.bottom, 20)
    //        }
    //
    //}: View { -> 이동


struct carouselView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["Month 1", "Month 3", "Month 4", "Month 5", "Month 6", "Month 7", "Month 8", "Month 9"]

    var body: some View {

            VStack {
                ZStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 268, height: 700)
                            .cornerRadius(20)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect(currentIndex == index ? 1.0 : 0.9)
                            .offset(x: CGFloat(index - currentIndex) * 270 + dragOffset, y: 0)
                    }
                }
                .padding(.bottom, 24)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            let threshold: CGFloat = 50
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(images.count - 1, currentIndex + 1)
                                }
                            }
                        }
                )
            }
            .padding(.bottom, 20)
        }

}
#Preview {
    carouselView()
}
