//
//  FirstView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 240, height: 240)
                    .padding()
                Text("Momma")
                    .font(.system(size: 40))
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
                    .padding(.bottom, 12)
                VStack {
                    Text("For your happy, healthier diet")
                    Text("with your baby 🧡")
                }
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(.priMain)
                Divider().opacity(0).frame(height: 48*2)
                NavigationLink(destination: SecondView()) {
                    Text("Let’s create your lovely profile!")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(.priMain)
                        .cornerRadius(20)
                    
                }
                .padding(.bottom, 12)
                .padding()
            }
        }
    }
}

#Preview {
    FirstView()
}
