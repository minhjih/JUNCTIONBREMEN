////
////  generalAIView.swift
////  2024
////
////  Created by 임유리 on 8/10/24.
////
//
//import SwiftUI
//
//struct ChatView: View {
//    @StateObject private var chatGPTService = ChatGPTService()
//    @State private var userInput: String = ""
//    
//    var body: some View {
//        VStack {
//            ScrollView {
//                VStack(alignment: .leading) {
//
//                    ForEach(chatGPTService.messages) { message in
//                        HStack {
//                            if message.isUser == "user" { //user일 때
//                                Spacer()
//                                Text(message.content)
//                                    .padding()
//                                    .background(.priMain)
//                                    .foregroundStyle(.black5)
//                                    .cornerRadius(18)
//                                    .padding(.horizontal)
//                            } else if message.isUser == "ai" { //ai일 때
//                                Text(message.content)
//                                    .padding()
//                                    .background(.black3)
//                                    .foregroundStyle(.black5)
//                                    .cornerRadius(18)
//                                    .padding(.horizontal)
//                                Spacer()
//                            }
//                        }
//                    }
//                }
//            }
//            
//            HStack { //ui 수정
//                Button(action: {
//                    //카메라 시작
//                    print("카메라 시작")
//                }) {
//                    Circle()
//                        .frame(width: 36, height: 36)
//                        .foregroundColor(.white)
//                        .overlay(
//                            Image(systemName: "photo.fill")
//                                .foregroundColor(.black1)
//                        )
//                }
//                TextField("Type your message...", text: $userInput)
//                    .frame(width: 278, height: 36)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//                Button(action: {
//                    sendMessage()
//                }) {
//                    Circle()
//                        .frame(width: 36, height: 36)
//                        .foregroundColor(.white)
//                        .overlay(
//                            Image(systemName: "paperplane.fill")
//                                .foregroundColor(.black1)
//                        )
//                }
//            }
//            .frame(width: 393, height: 62)
//            .background(Color.priMain)
//            .padding(.bottom)
//        }
//        .navigationTitle("ChatGPT")
//    }
//    
//    private func sendMessage() {
//        chatGPTService.sendMessage(userInput)
//        userInput = ""
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//

import SwiftUI

struct ChatView: View {
    @StateObject private var chatGPTService = ChatGPTService()
    @State private var userInput: String = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(chatGPTService.messages) { message in
                        HStack {
                            if message.isUser == "user" { //user일 때
                                Spacer()
                                Text(message.content)
                                    .padding()
                                    .background(.priMain)
                                    .foregroundStyle(.black5)
                                    .cornerRadius(18)
                                    .padding(.horizontal)
                            } else if message.isUser == "ai" { //ai일 때
                                Text(message.content)
                                    .padding()
                                    .background(.secMain)
                                    .foregroundStyle(.black5)
                                    .cornerRadius(18)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            HStack {
                Button(action: {
                    showImagePicker.toggle() // 사진 선택 모달을 표시
                }) {
                    Circle()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .overlay(
                            Image(systemName: "photo.fill")
                                .foregroundColor(.black1)
                        )
                }
                
                TextField("Type your message...", text: $userInput)
                    .frame(width: 278, height: 36)
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius:18)
                            .strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 0))
                    )
                Button(action: {
                    sendMessage()
                }) {
                    Circle()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .overlay(
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.black1)
                        )
                }
            }.onAppear (perform : UIApplication.shared.hideKeyboard)
            
            .frame(width: 393, height: 62)
            .background(Color.priMain)
            .padding(.bottom, 1)
        }
        .navigationTitle("ChatGPT")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage) // ImagePicker를 호출
        }
    }
    
    private func sendMessage() {
        chatGPTService.sendMessage(userInput)
        userInput = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
