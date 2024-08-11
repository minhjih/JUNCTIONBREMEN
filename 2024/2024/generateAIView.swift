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
                                    .padding(.vertical, 12)
                                    .padding(.horizontal)
                                    .background(.priMain)
                                    .foregroundStyle(.black5)
                                    .cornerRadius(18)
                                    .padding(.horizontal)
                            } else if message.isUser == "ai" { //ai일 때
                                Text(message.content)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal)
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
            
            HStack(alignment: .center) {
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
                
                TextField("Type message...", text: $userInput)
                    .font(.system(size: 12))
                    .padding(.horizontal, 10)
                    .frame(width: 278, height: 30)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius:18)
                            .strokeBorder(Color.black4, style: StrokeStyle(lineWidth: 1))
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
            .frame(width: 393, height: 36)
            .padding(.bottom, 6)
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
