//
//  generalAIView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var chatGPTService = ChatGPTService()
    @State private var userInput: String = ""
    
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
                                    .background(.black3)
                                    .foregroundStyle(.black5)
                                    .cornerRadius(18)
                                    .padding(.horizontal)
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            HStack { //ui 수정
                Button(action: {
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
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
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
            }
            .frame(width: 393, height: 62)
            .background(Color.priMain)
            .padding(.bottom)
        }
        .navigationTitle("ChatGPT")
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

