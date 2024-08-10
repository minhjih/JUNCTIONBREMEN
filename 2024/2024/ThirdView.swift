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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Image("Group 2_2")
                    Text("Tell Us About Yourself")
                        .bold()
                }
                
                Text("Relationship")
                Picker("Choose a color", selection: $selectedColor) {
                  ForEach(colors, id: \.self) {
                    Text($0)
                  }
                }
                .cornerRadius(15)
                .padding()
                
                
                Text("Age")
                Picker("Select your year of birth", selection: $selectedColor) {
                  ForEach(colors, id: \.self) {
                    Text($0)
                  }
                }
                .cornerRadius(15)
                .padding()
                
                Text("How often do you eat delivery food?")
                Picker("Choose a color", selection: $selectedColor) {
                  ForEach(colors, id: \.self) {
                    Text($0)
                  }
                }
                .cornerRadius(15)
                .padding()
                
                Text("Do you have any allergies?")
                Picker("Select", selection: $selectedColor) {
                  ForEach(colors, id: \.self) {
                    Text($0)
                  }
                }
                .cornerRadius(15)
                .padding()
                
                
                
            }
        }
        NavigationLink(destination: ThirdView()) {
            Text("Next Step")
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(.priMain)
                .cornerRadius(20)
        }
        .padding()
    }
}


#Preview {
    ThirdView()
}
