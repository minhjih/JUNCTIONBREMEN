//
//  CellView.swift
//  2024
//
//  Created by 임유리 on 8/10/24.
//

import Foundation
import SwiftUI

//struct CalendarView: View {
//  @State var month: Date
//  @State var offset: CGSize = CGSize()
//  @State var clickedDates: Set<Date> = []
//  var myModels: [MyModel]
//    
//  var body: some View {
//    VStack {
//      headerView
//      calendarGridView
//    }
//    .gesture(
//      DragGesture()
//        .onChanged { gesture in
//          self.offset = gesture.translation
//        }
//        .onEnded { gesture in
//          if gesture.translation.width < -100 {
//            changeMonth(by: 1)
//          } else if gesture.translation.width > 100 {
//            changeMonth(by: -1)
//          }
//          self.offset = CGSize()
//        }
//    )
//  }
//  
//  // MARK: - 헤더 뷰
//  private var headerView: some View {
//    VStack {
//      Text(month, formatter: Self.dateFormatter)
//        .font(.title)
//        .padding(.bottom)
//      
//      HStack {
//        ForEach(Self.weekdaySymbols, id: \.self) { symbol in
//          Text(symbol)
//            .frame(maxWidth: .infinity)
//        }
//      }
//      .padding(.bottom, 5)
//    }
//  }
//  
//  // MARK: - 날짜 그리드 뷰
//  private var calendarGridView: some View {
//    let daysInMonth: Int = numberOfDays(in: month)
//    let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
//
//    return VStack {
//      LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
//        ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
//          if index < firstWeekday {
//            RoundedRectangle(cornerRadius: 5)
//              .foregroundColor(Color.clear)
//          } else {
//            let date = getDate(for: index - firstWeekday)
//            let day = index - firstWeekday + 1
//            let clicked = clickedDates.contains(date)
//            
//              CellView(day: day, clicked: clicked, cellDate: date)
//              .onTapGesture {
//                if clicked {
//                  clickedDates.remove(date)
//                } else {
//                  clickedDates.insert(date)
//                }
//              }
//          }
//        }
//      }
//    }
//  }
//}
//
//// MARK: - 일자 셀 뷰
//private struct CellView: View {
//  var day: Int
//  var clicked: Bool = false
//  var cellDate: Date
//  var myModel: MyModel?
//    
//    init(day: Int, clicked: Bool, cellDate: Date) {
//    self.day = day
//    self.clicked = clicked
//        self.cellDate = cellDate
//  }
//  
//  var body: some View {
//    ZStack {
//        if cellDate.isSameDate(date: Date()) {
//          Circle()
//        }/////
//      RoundedRectangle(cornerRadius: 5)
//        .opacity(0)
//        .overlay(Text(String(day)))
//        .foregroundColor(.blue)
//      
//    }
//    .scaledToFit()
//  }
//}
//
//// MARK: - 내부 메서드
//private extension CalendarView {
//  /// 특정 해당 날짜
//  private func getDate(for day: Int) -> Date {
//    return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
//  }
//  
//  /// 해당 월의 시작 날짜
//  func startOfMonth() -> Date {
//    let components = Calendar.current.dateComponents([.year, .month], from: month)
//    return Calendar.current.date(from: components)!
//  }
//  
//  /// 해당 월에 존재하는 일자 수
//  func numberOfDays(in date: Date) -> Int {
//    return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
//  }
//  
//  /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
//  func firstWeekdayOfMonth(in date: Date) -> Int {
//    let components = Calendar.current.dateComponents([.year, .month], from: date)
//    let firstDayOfMonth = Calendar.current.date(from: components)!
//    
//    return Calendar.current.component(.weekday, from: firstDayOfMonth)
//  }
//  
//  /// 월 변경
//  func changeMonth(by value: Int) {
//    let calendar = Calendar.current
//    if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
//      self.month = newMonth
//    }
//  }
//}
//
//// MARK: - Static 프로퍼티
//extension CalendarView {
//  static let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MMMM yyyy"
//    return formatter
//  }()
//  
//  static let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
//}
//
////날짜 비교를 위한 extension Date 함수 추가
//extension Date {
//    private func startOfDay() -> Date {
//        Calendar.current.startOfDay(for: self)
//    }
//    
//    func isSameDate(date: Date) -> Bool {
//        self.startOfDay() == date.startOfDay()
//    }
//}

import SwiftUI

struct CalendarView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let dates = Array(1...30)
    let specialDates: [Int: String] = [5: "95kcal", 18: "299kcal", 12: "72kcal"]

    var body: some View {
        ScrollView {
            VStack {
                Text("September")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(days, id: \.self){ day in
                        Text(day)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                    }
                }
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 20) {
                    ForEach(dates, id: \.self) { date in
                        VStack {
                            if date == 18 {
                                Text("\(date)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .background(
                                        Circle()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.secMain)
                                    )
                                    .padding(3)
                                
                            } else {
                                Text("\(date)")
                                    .font(.title3)
                                    .padding(3)
                            }
                            
                            if let specialText = specialDates[date] {
                                if date == 18 {
                                    Text(specialText)
                                        .font(.system(size: 10))
                                        .foregroundColor(.red)
                                        .fontWeight(.bold)
                                } else {
                                    Text(specialText)
                                        .font(.system(size: 10))
                                        .foregroundColor(.red)
                                }
                            } else {
                                Text(" ")
                                    .font(.system(size: 10))
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                Rectangle()
                    .foregroundColor(.black3)
                    .frame(width: 350, height: 1)
                    .padding(.bottom, 6)
                
                Text("Nutrition Consumption")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 6)
                    .padding(.bottom, 6)
                HStack(alignment: .bottom, spacing: 0) {
                    Text("🔥")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .padding(.leading, 6)
                    Text("2894")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .padding(.leading, 6)
                    Text("kcal")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.leading, 6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Vitamin A")
                            .foregroundColor(.gray)
                            .frame(width: 95, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: 130 * 1.0, height: 10)
                        }
                        .cornerRadius(5)
                        Spacer()
                        Text("130 mg")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal, 8)
                    HStack {
                        Text("Salt")
                            .foregroundColor(.gray)
                            .frame(width: 95, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color.secMain)
                                .frame(height: 10)
                        }
                        .cornerRadius(5)
                        Spacer()
                        Text("180 mg")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal, 8)
                    HStack {
                        Text("Protein")
                            .foregroundColor(.gray)
                            .frame(width: 95, alignment: .leading)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                            Rectangle()
                                .fill(Color.posMain)
                                .frame(height: 10)
                        }
                        .cornerRadius(5)
                        Spacer()
                        Text("72 g")
                            .foregroundColor(.black)
                            .bold()
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding(.horizontal, 8)
                }
                .padding(.bottom, 8)
                
                FoodCard(image: "rest1_1", name: "Fried Chicken with Fries", description: "Delicious fried chicken with all-time best side dish, french fries.", keys: ["Carbohydrate", "High Protein", "High Fat", "Salty"], price: "11.99")
                    .padding(.bottom, 6)
                FoodCard(image: "rest1_2", name: "Chili Hot Wings", description: "Delicious hot wings with the best chili sauce.", keys: ["Carbohydrate", "Protein", "High Fat"], price: "9.99")
            }
            .padding()
        }
    }
}

#Preview {
    statsView()
}
