//
//  FQDatePickerView.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/17.
//

import SwiftUI
import Combine
struct FQDatePickerView: View {
    
    @State private var date_1 = Date()
    @State private var date_2 = Date()
    @State private var date_3 = Date()
    @State private var date_4 = Date()
    @State private var date_5 = Date()
    @State private var date_6 = Date()
    @State private var date_7 = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!...calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        ScrollView {
            DatePicker("默认", selection: $date_1)
            DatePicker("date", selection: $date_2, displayedComponents: .date)
            DatePicker("hourAndMinute", selection: $date_3, displayedComponents: .hourAndMinute)
            DatePicker("只能选择2021年：", selection: $date_4, in: dateRange, displayedComponents: .date)
            DatePicker("graphical：", selection: $date_5, in: dateRange, displayedComponents: .date).datePickerStyle(.graphical)
            DatePicker("wheel：", selection: $date_6, in: dateRange, displayedComponents: .date).datePickerStyle(.wheel)
            DatePicker("compact：", selection: $date_7, in: dateRange, displayedComponents: .date).datePickerStyle(.compact)
            
        }.padding()
            .navigationTitle("DatePicker")
    }
}


struct FQDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        FQDatePickerView()
    }
}
