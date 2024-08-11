import SwiftUI
import Combine

class NutritionViewModel: ObservableObject {
    @Published var nutritionData: [NutritionResponse] = []
    
    func fetchData() {
        // 서버에서 데이터를 가져올 URL
        guard let url = URL(string: "http://192.168.101.110:5000/YOLO") else { return } // 실제 URL로 변경
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // JSON 데이터를 Dictionary로 변환
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Double] {
                    // Dictionary를 NutritionResponse 배열로 변환
                    DispatchQueue.main.async {
                        self.nutritionData = json.map { NutritionResponse(key: $0.key, value: $0.value) }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
    func updateWithResponseData(_ data: [String: Double]) {
        DispatchQueue.main.async {
            self.nutritionData = data.map { NutritionResponse(key: $0.key, value: $0.value) }
        }
    }
}
