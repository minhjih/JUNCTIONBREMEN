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
            }
            .frame(width: 393, height: 62)
            .background(Color.priMain)
            .padding(.bottom, 1)
        }
        .navigationTitle("ChatGPT")
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Chatbot")
                    .foregroundColor(.priMain)
                    .fontWeight(.black)
                    .italic()
                    .underline()
//                    .shadow(color: Color.priMain.opacity(0.5), radius: 15, x: 0, y: 0)
            }
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

