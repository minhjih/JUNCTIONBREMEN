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
    @State var relationship: String = ""
    @State var age: String = ""
    @State var often: String = ""
    @State var allergy: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.priMain)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.priMain)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.black4)
                }
                .padding(.bottom, 12)
                HStack{
                    Image("Group 2_2")
                    Text("Tell Us About Yourself")
                        .bold()
            }
                
            ScrollView {
                Text("Relationship")
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                TextField("ex) Self", text: $relationship)
                    .frame(height: 40) // 높이
                    .padding(.horizontal, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.priAlt, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
                Text("Age")
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("ex) 27", text: $age)
                    .frame(height: 40) // 높이
                    .padding(.horizontal, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.priAlt, lineWidth: 2)  // 노란색 테두리
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
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("ex) 4-6 times a week", text: $often)
                    .frame(height: 40) // 높이
                    .padding(.horizontal, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.priAlt, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
                
                
                
                Text("Do you have any allergies?")
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()
                
                TextField("ex) apple", text: $allergy)
                    .frame(height: 40) // 높이
                    .padding(.horizontal, 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.priAlt, lineWidth: 2)  // 노란색 테두리
                    )
                    .frame(maxWidth: 340, minHeight: 10)
            }
                
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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.priMain)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ThirdView()
}
