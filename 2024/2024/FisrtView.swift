//
//  FisrtView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import SwiftUI

struct FisrtView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 240, height: 240)
                    .padding()
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
    FisrtView()
}
