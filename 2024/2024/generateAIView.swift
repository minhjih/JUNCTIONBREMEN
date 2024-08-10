import SwiftUI

struct ChatView: View {
    @StateObject private var chatGPTService = ChatGPTService()
    @State private var userInput: String = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .center) {
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
                        .padding(.bottom, 3)
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
                    if userInput != "" {
                        sendMessage()
                    }
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
