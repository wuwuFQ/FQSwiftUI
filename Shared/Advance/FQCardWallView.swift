//
//  FQCardWallView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/31.
//

import SwiftUI

struct FQCardWallView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0..<30) {i in
                   let item = Course(
                        title: "wuwuFQ May world peace",
                        backgroundColor: .randomColor(),
                        shadowColor: .randomColor()
                    )
                    GeometryReader { geometry in
                        CourseView(
                            title: item.title,
                            backgroundColor: item.backgroundColor,
                            shadowColor: item.shadowColor
                        )
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / 30), axis: (x: 0, y: 0, z: 20))
                    }
                    .frame(width: 246, height: 360)
                }
            .padding(.leading, 30)
            .padding(.top, 30)
            .padding(.bottom, 70)
            Spacer()
        }
        }.navigationTitle("卡片墙")
    }
    
}

struct CourseView: View {
    var title : String = ""
    var backgroundColor: Color = .red
    var shadowColor : Color = .red
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
        }
        .frame(width: 246, height: 360)
        .background(backgroundColor)
        .cornerRadius(30)
        .shadow(color: shadowColor, radius: 20, x: 10, y: 10)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title : String
    var backgroundColor: Color
    var shadowColor : Color
}


struct FQCardWallView_Previews: PreviewProvider {
    static var previews: some View {
        FQCardWallView()
    }
}
