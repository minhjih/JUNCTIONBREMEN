import Foundation
import SwiftUI

struct mainView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) { // Adjust the spacing as needed
                Divider().opacity(0).padding(.top, 1)
                Text("Welcome, with ❤️ for \(sharedData.babyName)")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image("baby")
                    .font(.subheadline)
                Text("Now on Week 10")
                    .font(.system(size: 16))
                    .padding(.trailing, 12)
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
                    .padding(.leading, 12)
                    .font(.system(size: 20))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Carousel View
                carouselView()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
   mainView()
}
