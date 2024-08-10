//
//  chatView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import Foundation
import SwiftUI


struct mainView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("baby")
                Text("Timeline")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .offset(x:-70)
                carouselView()
                    .frame(maxWidth: .infinity)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Home")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
        }
    }
}

#Preview {
    mainView()
}

