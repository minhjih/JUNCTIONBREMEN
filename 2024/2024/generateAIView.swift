import SwiftUI

struct ChatView: View {
    @StateObject private var chatGPTService = ChatGPTService()
    @Environment(\.dismiss) var dismiss
    @State private var userInput: String = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chatGPTService.messages) { message in
                            HStack {
                                if message.isUser == "user" {
                                    Spacer()
                                    Text(message.content)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal)
                                        .background(Color.priMain)
                                        .foregroundColor(.black5)
                                        .cornerRadius(18)
                                        .padding(.horizontal)
                                } else if message.isUser == "ai" {
                                    Text(message.content)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal)
                                        .background(Color.secMain)
                                        .foregroundColor(.black5)
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
                        showImagePicker.toggle()
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
                }
                .onAppear {
                    UIApplication.shared.hideKeyboard()
                }
                .frame(width: 393, height: 36)
                .padding(.bottom, 6)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .background(
                NavigationLink(
                    destination: ImageView(image: selectedImage ?? UIImage(), onUpload: {
                        if let image = selectedImage {
                            uploadImageToServer(image)
                        }
                    }),
                    isActive: Binding(
                        get: { selectedImage != nil },
                        set: { if !$0 { selectedImage = nil } }
                    )
                ) {
                    EmptyView()
                }
                    .hidden()
            )
            .onChange(of: selectedImage) { _ in
                if selectedImage != nil {
                    // 자동으로 ImageView로 이동
                }
            }
        }
    }
    
    private func sendMessage() {
        chatGPTService.sendMessage(userInput)
        userInput = ""
    }
    
    private func uploadImageToServer(_ image: UIImage) {
        guard let url = URL(string: "http://192.168.101.110:5000/YOLO") else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print("Response: \(jsonResponse)")
            }
        }.resume()
    }
}



struct ImageView: View {
    @Environment(\.dismiss) var dismiss
    var image: UIImage
    var onUpload: () -> Void
    
    @StateObject private var viewModel = NutritionViewModel()
    @State private var isLoading = false
    
    var body: some View {
            VStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(Rectangle())
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 16)

                Spacer()
                
                // JSON 키와 값을 표시
                List(viewModel.nutritionData) { item in
                    HStack {
                        Text(item.key)
                        Spacer()
                        Text("\(item.value, specifier: "%.2f")")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("AI-based Nutrition Information")
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
                
                .onAppear {
                    viewModel.fetchData()
                }
                
                if isLoading {
                    ProgressView()  // Show loading indicator
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding(.bottom, 20)
                } else {
                    HStack {
                        Button(action: {
                            uploadAndDetectNutrition()
                        }) {
                            Text("Upload & Detect Nutrition")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
            .background(Color.white.opacity(0.8))
        }
        
        private func uploadAndDetectNutrition() {
            isLoading = true  // Start loading
            
            uploadImageToServer(image) { responseData in
                isLoading = false  // Stop loading when response is received
                
                if let data = responseData as? [String: Double] {
                    viewModel.updateWithResponseData(data)
                }
            }
        }
    
    private func uploadImageToServer(_ image: UIImage, completion: @escaping (Any?) -> Void) {
        guard let url = URL(string: "http://192.168.101.110:5000/YOLO") else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Double] {
                DispatchQueue.main.async {
                    completion(jsonResponse)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
