//
//  SampleDate.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import SwiftData
import SwiftUI

@MainActor
let sampleData: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: MyModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<MyModel>()).isEmpty {
            mockData.forEach { container.mainContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

var mockData = [
    MyModel(date: Date().addingTimeInterval(-1233), content: "아침에 달리기 좋았음"),
    MyModel(date: Date().addingTimeInterval(-252200), content: "오늘은 좀 피곤했음"),
    MyModel(date: Date().addingTimeInterval(-482000), content: "괜찮은 운동이었음"),
    MyModel(date: Date().addingTimeInterval(-614800), content: "끝까지 하기 힘들었음"),
    MyModel(date: Date().addingTimeInterval(-834000), content: "평범한 하루"),
    MyModel(date: Date().addingTimeInterval(-1396000), content: "개인 기록 경신"),
    MyModel(date: Date().addingTimeInterval(-1792730), content: "일정한 속도 유지")
]

#Preview {
    homeView()
        .modelContainer(sampleData)
}
