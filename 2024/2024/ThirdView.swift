//
//  ThirdView.swift
//  2024
//
//  Created by 임유리 on 8/11/24.
//

import Foundation
import SwiftUI
struct ThirdView :View {
    
    @State var selectedColor = ""
    var colors = ["Select your relationship ", "green", "blue"]
    @State var name: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Image("second")
                HStack{
                    Image("Group 2_2")
                    Text("Tell Us About Yourself")
                        .bold()
                }
                
                Text("Relationship")
                    .padding(.trailing, 250)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
//                Picker("Choose a color", selection: $selectedColor) {
//                  ForEach(colors, id: \.self) {
//                    Text($0)
//                  }
//                }
//                .cornerRadius(15)
//                .padding()
                TextField("   ex) Self", text: $name)
                    .frame(height: 40) // 높이
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.yellow, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
                Text("Age")
                    .padding(.trailing, 300)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("   ex) 27", text: $name)
                    .frame(height: 40) // 높이
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.yellow, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
//                Picker("Select your year of birth", selection: $selectedColor) {
//                  ForEach(colors, id: \.self) {
//                    Text($0)
//                  }
//                }
//                .cornerRadius(15)
//                .padding()
                
                
                Text("How often do you eat delivery food?              ")
                    .padding(.trailing,-10)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("   ex) 4-6 times a week", text: $name)
                    .frame(height: 40) // 높이
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.yellow, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
                
                
                Text("Do you have any allergies?")
                    .padding(.trailing,120)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("   ex) apple", text: $name)
                    .frame(height: 40) // 높이
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.yellow, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
            }
        }
        NavigationLink(destination: fourthView()) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.priMain) // .priMain 대신 사용
                .frame(height: 60) // 버튼 높이 설정
                .overlay(
                    Text("Next Step")
                        .bold()
                        .foregroundColor(.white)
                )
                .frame(maxWidth: .infinity) // 버튼의 너비를 가능한 한 최대화
                .padding(.horizontal) // 좌우 여백 추가
        }
    }
}


#Preview {
    ThirdView()
}
