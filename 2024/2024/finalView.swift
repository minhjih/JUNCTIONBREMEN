//
//  finalView.swift
//  2024
//
//  Created by 임유리 on 8/11/24.
//

//import Foundation
//import SwiftUI
//
//struct finalView : View {
//    var body: some View {
//        Image("cong")
//        Text("congratuations!")
//            .bold()
//            .font(.largeTitle)
//
//        
//        NavigationLink(destination: mainView()) {
//            Text("Let's get started!")
//                .bold()
//                .foregroundColor(.white)
//                .padding()
//                .background(.priMain)
//                .cornerRadius(20)
//        }
//        .padding()
//        
//        
//    }
//}
//
//#Preview {
//    finalView()
//}

import SwiftUI

struct FinalView: View {
    var body: some View {
        VStack {
            // 상단의 이미지와 텍스트
            Image("cong")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)  // 이미지의 크기를 조정할 수 있습니다.

            Text("Congratulations!")
                .bold()
                .font(.title)  // 폰트 크기를 조정할 수 있습니다.
                .padding(.top, 20)  // 이미지와 텍스트 사이에 여백을 추가합니다.

//            Spacer()  // 상단의 내용과 버튼 사이에 공간을 추가

            // 하단의 버튼
            NavigationLink(destination: mainView()) {
                Text("Let’s get started!")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(.priMain)
                    .cornerRadius(20)
            }
            .padding()
        }
        .padding()  // VStack의 전체 여백
    }
}

#Preview {
    FinalView()
}

