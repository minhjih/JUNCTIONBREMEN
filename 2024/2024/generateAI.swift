//
//  generateAI.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isUser: String
}

class ChatGPTService: ObservableObject {
    @Published var messages: [ChatMessage] = []
    let apiKey = Storage().APIKEY
    
    func sendMessage(_ text: String) {
        let userMessage = ChatMessage(content: text, isUser: "user")
        messages.append(ChatMessage(content: "너는 임산부를 위한 챗봇이야. 친절하게 대답해줘 그리고 임산부에게 음식을 추천할 경우 사진까지 보여줘.", isUser: "robot")) //기본 message를 robot으로 처리
        messages.append(userMessage)
        
        //print(messages)
        
        let request = createRequest(with: text)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                if let decodedResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let choices = decodedResponse["choices"] as? [[String: Any]],
                   let message = choices.first?["message"] as? [String: Any],
                   let content = message["content"] as? String {
                    
                    DispatchQueue.main.async {
                        let chatResponse = ChatMessage(content: content.trimmingCharacters(in: .whitespacesAndNewlines), isUser: "ai")
                        self.messages.append(chatResponse)
                    }
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func createRequest(with text: String) -> URLRequest {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                ["role": "user", "content": text]
            ]
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        return request
    }
}

