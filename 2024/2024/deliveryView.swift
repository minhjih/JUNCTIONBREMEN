//
//  deliveryView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//
import SwiftUI

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
    }
}
