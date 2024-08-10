////
////  chatView.swift
////  2024
////
////  Created by 임유리 on 8/10/24.
////
//
//import Foundation
//import SwiftUI
//
//
//struct mainView: View {
//    var body: some View {
//        ScrollView{
//            VStack {
//                Image("baby")
//                    .font(.subheadline)
//
//                Text("Week 10 / Month 7")
//                    .multilineTextAlignment(.trailing)
//                    .offset(x:100)
//        
//                Text("Timeline")
//                    .bold()
//                    .font(.title)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:-70)
//                
//                Path { path in
//                    path.move(to: CGPoint(x: 20, y:50))  // 시작 점
//                    path.addLine(to: CGPoint(x: 400, y: 50)) // 끝 점
//                }
//                .stroke(Color.gray, lineWidth: 2) // 선 색상과 두께 설정
//                
//                carouselView()
//                    .frame(maxWidth: .infinity)
//            
//            }
//        }.padding(.horizontal, 16)
//        
//    }
//}
//
//#Preview {
//    mainView()
//}
//

//import Foundation
//import SwiftUI
//
//struct mainView: View {
//    var body: some View {
//        ScrollView {
//            VStack{
//                Image("baby")
////                    .resizable()
////                    .scaledToFit()
////                    .frame(height: 200) // Adjust the height as needed
//                
//                Text("Week 10 / Month 7")
//                    .font(.subheadline)
//                    .multilineTextAlignment(.trailing)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                
//                Text("Timeline")
//                    .bold()
//                    .font(.title)
//                    .multilineTextAlignment(.leading)
//                    .offset(x:-70)
//                
//                // Path Line
//                Path { path in
//                    let width = UIScreen.main.bounds.width - 40 // Adjusting for padding
//                    path.move(to: CGPoint(x: 0, y: 0))
//                    path.addLine(to: CGPoint(x: width, y: 0))
//                }
//                .stroke(Color.gray, lineWidth: 2)
//                .frame(height: 2) // Setting the frame height to match the line width
//                
//                // Carousel View
//                carouselView()
//                    .frame(maxWidth: .infinity)
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 20)
//        }
//    }
//}
//
//#Preview {
//    mainView()
//}

import Foundation
import SwiftUI

struct mainView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) { // Adjust the spacing as needed
                Image("baby")
                    .font(.subheadline)

                Text("Week 10 / Month 7")
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
        
                // Path Line
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))  // 시작 점
                    path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 40, y: 0)) // Adjust for padding
                }
                .stroke(Color.gray, lineWidth: 2) // 선 색상과 두께 설정
                .frame(height: 2) // Setting the frame height to match the line width
                
                // Timeline Text
                Text("Timeline")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Carousel View
                carouselView()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 16)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
   mainView()
}
