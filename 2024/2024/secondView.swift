//
//  secondView.swift
//  2024
//
//  Created by 임유리 on 8/11/24.
//
import SwiftUI
import Combine

class SharedData: ObservableObject {
    @Published var babyName: String = ""
}

struct SecondView: View {
    @EnvironmentObject var babyName: SharedData
    @State private var selectedButton: Int? = nil
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.priMain)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.black4)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 80, height: 3)
                        .foregroundColor(.black4)
                }
                .padding(.top, 6)
                .padding(.bottom, 12)
                HStack{
                    Text("1")
                        .font(.system(size: 16))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .foregroundColor(.priMain)
                                .frame(width: 28, height: 28)
                        )
                        .padding(.trailing, 8)
                    Text("Tell Us About Your Baby")
                        .font(.system(size: 20))
                        .bold()
                }
                ScrollView {
                    VStack{
                        Text("Baby Name")
                            .padding(.trailing, 250)
                            .foregroundColor(.priMain)
                        TextField("ex) Junior", text: $babyName.babyName)
                            .frame(height: 40) // 높이
                            .padding(.horizontal, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.priAlt, lineWidth: 2)  // 노란색 테두리
                            )
                            .frame(maxWidth: 340, minHeight: 10)
                    }.offset(y:15)
                        
                    
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
                             Text("Preparing for Pregnancy")
                                 .foregroundColor(selectedButton == 0 ? Color("PriAlt") : Color("Black4"))
                                 .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                                 .background(Color.white)  // 버튼 배경색
                                 .cornerRadius(5)  // 버튼 모서리 둥글게
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedButton == 0 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                                 )
                         }
    //                     .padding()  // 버튼 주변 여백
                         .frame(maxWidth: 340, minHeight: 10)

    //                     Button(action: {
    //                         // 두 번째 버튼 클릭 시 선택된 버튼의 인덱스를 1로 설정
    //                         selectedButton = 1
    //                     }) {
    //                         Text("Early Stage")
    //                             .foregroundStyle(.black4)
    //                             .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
    //                             .background(Color.white)  // 버튼 배경색
    //                             .cornerRadius(5)  // 버튼 모서리 둥글게
    //                             .overlay(
    //                                 RoundedRectangle(cornerRadius: 10)
    //                                     .stroke(selectedButton == 1 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
    //                             )
    //                     }
    ////                     .padding()  // 버튼 주변 여백
    //                     .frame(maxWidth: 340, minHeight: 10)

                        Button(action: {
                            // 두 번째 버튼 클릭 시 선택된 버튼의 인덱스를 1로 설정
                            selectedButton = 1
                        }) {
                            Text("Early Stage")
                                .foregroundColor(selectedButton == 1 ? Color("PriAlt") : Color("Black4"))  // 선택 상태에 따라 텍스트 색상 변경
                                .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                                .background(Color.white)  // 버튼 배경색
                                .cornerRadius(5)  // 버튼 모서리 둥글게
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedButton == 1 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                                )
                        }
                        // .padding()  // 버튼 주변 여백
                        .frame(maxWidth: 340, minHeight: 10)

                         Button(action: {
                             // 세 번째 버튼 클릭 시 선택된 버튼의 인덱스를 2로 설정
                             selectedButton = 2
                         }) {
                             Text("Mid Stage")
                                 .foregroundColor(selectedButton == 2 ? Color("PriAlt") : Color("Black4"))
                                 .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                                 .background(Color.white)  // 버튼 배경색
                                 .cornerRadius(5)  // 버튼 모서리 둥글게
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                         .stroke(selectedButton == 2 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                                 )
                         }
    //                     .padding()  // 버튼 주변 여백
                         .frame(maxWidth: 340, minHeight: 10)


                         Button(action: {
                             // 네 번째 버튼 클릭 시 선택된 버튼의 인덱스를 3으로 설정
                             selectedButton = 3
                         }) {
                             Text("Late Stage")
                                 .foregroundColor(selectedButton == 3 ? Color("PriAlt") : Color("Black4"))
                                 .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                                 .background(Color.white)  // 버튼 배경색
                                 .cornerRadius(5)  // 버튼 모서리 둥글게
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                         .stroke(selectedButton == 3 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                                 )
                         }
    //                     .padding()  // 버튼 주변 여백
                         .frame(maxWidth: 340, minHeight: 10)


                         Button(action: {
                             // 다섯 번째 버튼 클릭 시 선택된 버튼의 인덱스를 4로 설정
                             selectedButton = 4
                         }) {
                             Text("Child")
                                 .foregroundColor(selectedButton == 4 ? Color("PriAlt") : Color("Black4"))
                                 .frame(maxWidth: .infinity, minHeight: 50)  // 버튼의 크기 설정
                                 .background(Color.white)  // 버튼 배경색
                                 .cornerRadius(10)  // 버튼 모서리 둥글게
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                         .stroke(selectedButton == 4 ? Color("PriAlt") : Color("Black4"), lineWidth: 2)  // 선택 상태에 따라 테두리 색상 변경
                                 )
                         }
    //                     .padding()   버튼 주변 여백
                         .frame(maxWidth: 340, minHeight: 10)

                     }
                }
                
                Spacer()

                NavigationLink(destination: ThirdView()) {
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
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Welcome")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
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
    SecondView()
}

