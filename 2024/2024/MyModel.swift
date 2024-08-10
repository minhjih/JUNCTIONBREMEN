//
//  MyModel.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

// MyModel.swift
import SwiftUI
import SwiftData

@Model
class MyModel {
    var date: Date
    var content: String
    
    init(date: Date, content: String) {
        self.date = date
        self.content = content
    }
}

