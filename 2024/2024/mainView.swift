import Foundation
import SwiftUI

struct mainView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) { // Adjust the spacing as needed
                Image("baby")
                    .font(.subheadline)

                Text("Week 10")
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
