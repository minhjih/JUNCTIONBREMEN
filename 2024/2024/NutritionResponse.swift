//
//  NutritionResponse.swift
//  2024
//
//  Created by 임유리 on 8/11/24.
//

import SwiftUI

// JSON 응답을 처리할 모델
struct NutritionResponse: Identifiable {
    let id = UUID()
    let key: String
    let value: Double
}
