//
//  deliveryView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//
import SwiftUI

//struct deliveryView: View {
//    var body: some View {
//        ZStack {
//            Color.red
////                            .ignoresSafeArea()
//            
//            ScrollView(){
//                VStack {
//                    Text("2")
//                        .font(.system(size: 70))
//                        .foregroundColor(.blue)
//                        .fontWeight(.bold)
//                }
////                Text("\(2)")
////                    .font(.system(size: 70))
////                    .foregroundColor(.blue)
////                    .fontWeight(.bold)
//            }
//        }
//    }
//}

struct deliveryView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.red)
            
            Text("\(2)")
                .font(.system(size: 70))
                .foregroundColor(.blue)
                .fontWeight(.bold)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Delivery")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
        }
    }
}
