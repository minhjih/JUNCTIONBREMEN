////
////  fourthView.swift
////  2024
////
////  Created by 임유리 on 8/11/24.
////
//
//import Foundation
//import SwiftUI
//struct fourthView :View {
//    @State var name: String = ""
//    @State private var selectedButton: Int? = nil
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image("first")
//                HStack{
//                    Image("Group 2_3")
//                    Text("Tell Us About Your Baby")
//                        .bold()
//                }
//                Text("Baby Name")
//                TextField("ex) Junior", text: $name)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 5)
//                            .stroke(Color.yellow, lineWidth: 2)  // 노란색 테두리
//                    )
//                Text("Stage")
//                
//                VStack(spacing: 10) {  // 버튼 간의 간격을 조정
//                    Button(action: {
//                        // 첫 번째 버튼 클릭 시 선택된 버튼의 인덱스를 0으로 설정
//                        selectedButton = 0
//                    }) {
//                        Text("Preparing for Pregnancy")
//                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
//                            .background(Color.white)  // 버튼 배경색
//                            .cornerRadius(5)  // 버튼 모서리 둥글게
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(selectedButton == 0 ? Color("PriMain") : Color.gray, lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
//                            )
//                    }
//                    .padding()  // 버튼 주변 여백
//                    
//                    Button(action: {
//                        // 두 번째 버튼 클릭 시 선택된 버튼의 인덱스를 1로 설정
//                        selectedButton = 1
//                    }) {
//                        Text("Early Stage")
//                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
//                            .background(Color.white)  // 버튼 배경색
//                            .cornerRadius(5)  // 버튼 모서리 둥글게
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(selectedButton == 1 ? Color("PriMain") : Color.gray, lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
//                            )
//                    }
//                    .padding()  // 버튼 주변 여백
//                    
//                    Button(action: {
//                        // 세 번째 버튼 클릭 시 선택된 버튼의 인덱스를 2로 설정
//                        selectedButton = 2
//                    }) {
//                        Text("Mid Stage")
//                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
//                            .background(Color.white)  // 버튼 배경색
//                            .cornerRadius(5)  // 버튼 모서리 둥글게
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(selectedButton == 2 ? Color("PriMain") : Color.gray, lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
//                            )
//                    }
//                    .padding()  // 버튼 주변 여백
//                    
//                    Button(action: {
//                        // 네 번째 버튼 클릭 시 선택된 버튼의 인덱스를 3으로 설정
//                        selectedButton = 3
//                    }) {
//                        Text("Late Stage")
//                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
//                            .background(Color.white)  // 버튼 배경색
//                            .cornerRadius(5)  // 버튼 모서리 둥글게
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(selectedButton == 3 ? Color("PriMain") : Color.gray, lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
//                            )
//                    }
//                    .padding()  // 버튼 주변 여백
//                    
//                    Button(action: {
//                        // 다섯 번째 버튼 클릭 시 선택된 버튼의 인덱스를 4로 설정
//                        selectedButton = 4
//                    }) {
//                        Text("Child")
//                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
//                            .background(Color.white)  // 버튼 배경색
//                            .cornerRadius(10)  // 버튼 모서리 둥글게
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(selectedButton == 4 ? Color("PriMain") : Color.gray, lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
//                            )
//                    }
//                    .padding()  // 버튼 주변 여백
//                }
//                
//                
//                NavigationLink(destination: ThirdView()) {
//                    Text("Next Step")
//                        .bold()
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.priMain)
//                        .cornerRadius(20)
//                }
//                .padding()
//                
//            }
//            
//        }
//    }
//}
//
//#Preview {
//    fourthView()
//}
//


//
//  secondView.swift
//  2024
//
//  Created by 임유리 on 8/11/24.
//
import SwiftUI

struct fourthView : View {
    @State var name: String = ""
    @State private var selectedButton: Int? = nil

    var body: some View {
        NavigationView {
            VStack {
               Image("third")
                HStack{
                    Image("Group 2_3")
                    Text("Last Question")
                        .bold()
                }

                    
                
                Text("Stage")
                    .padding(.trailing, 290)
                    .foregroundColor(.priMain)
                    .offset(y:13)
                    .padding()

                
                VStack(spacing: 10) {  // 버튼 간의 간격을 조정
                    Button(action: {
                         // 첫 번째 버튼 클릭 시 선택된 버튼의 인덱스를 0으로 설정
                         selectedButton = 0
                     }) {
                         Text("I want to eat good food for baby")
                             .foregroundColor(selectedButton == 0 ? Color("PriMain") : Color("Black4"))
                             .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                             .background(Color.white)  // 버튼 배경색
                             .cornerRadius(5)  // 버튼 모서리 둥글게
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedButton == 0 ? Color("PriMain") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                             )
                     }
//                     .padding()  // 버튼 주변 여백
                     .frame(maxWidth: 340, minHeight: 10)



                    Button(action: {
                        // 두 번째 버튼 클릭 시 선택된 버튼의 인덱스를 1로 설정
                        selectedButton = 1
                    }) {
                        Text("I am worried about delivery foods")
                            .foregroundColor(selectedButton == 1 ? Color("PriMain") : Color("Black4"))  // 선택 상태에 따라 텍스트 색상 변경
                            .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                            .background(Color.white)  // 버튼 배경색
                            .cornerRadius(5)  // 버튼 모서리 둥글게
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedButton == 1 ? Color("PriMain") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                            )
                    }
                    // .padding()  // 버튼 주변 여백
                    .frame(maxWidth: 340, minHeight: 10)

                     Button(action: {
                         // 세 번째 버튼 클릭 시 선택된 버튼의 인덱스를 2로 설정
                         selectedButton = 2
                     }) {
                         Text("I want to know ingredients of foods")
                             .foregroundColor(selectedButton == 2 ? Color("PriMain") : Color("Black4"))
                             .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                             .background(Color.white)  // 버튼 배경색
                             .cornerRadius(5)  // 버튼 모서리 둥글게
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(selectedButton == 2 ? Color("PriMain") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                             )
                     }
//                     .padding()  // 버튼 주변 여백
                     .frame(maxWidth: 340, minHeight: 10)


                     Button(action: {
                         // 네 번째 버튼 클릭 시 선택된 버튼의 인덱스를 3으로 설정
                         selectedButton = 3
                     }) {
                         Text("I don’t know what foods to avoid")
                             .foregroundColor(selectedButton == 3 ? Color("PriMain") : Color("Black4"))
                             .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                             .background(Color.white)  // 버튼 배경색
                             .cornerRadius(5)  // 버튼 모서리 둥글게
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(selectedButton == 3 ? Color("PriMain") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                             )
                     }
//                     .padding()  // 버튼 주변 여백
                     .frame(maxWidth: 340, minHeight: 10)


                     Button(action: {
                         // 다섯 번째 버튼 클릭 시 선택된 버튼의 인덱스를 4로 설정
                         selectedButton = 4
                     }) {
                         Text("etc")
                             .foregroundColor(selectedButton == 4 ? Color("PriMain") : Color("Black4"))
                             .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                             .background(Color.white)  // 버튼 배경색
                             .cornerRadius(10)  // 버튼 모서리 둥글게
                             .overlay(
                                 RoundedRectangle(cornerRadius: 10)
                                     .stroke(selectedButton == 4 ? Color("PriMain") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                             )
                     }
//                     .padding()   버튼 주변 여백
                     .frame(maxWidth: 340, minHeight: 10)

                 }
                
                Spacer()

                NavigationLink(destination: homeView()) {
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
    }
}

#Preview {
    fourthView()
}

