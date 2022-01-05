//
//  TableViewCell.swift
//  FQSwiftUI
//
//  Created by TKiOS on 2021/12/15.
//

import SwiftUI

struct FQTableViewCell: View {
    
    private let title: String
    private let subTitle: String?
    
    init(title: String, subTitle: String? = nil) {
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title).bold()
            if let sub = subTitle, sub.count > 0 {
                Text(sub).font(.subheadline).opacity(0.5).lineLimit(nil)
            }
        }
    }
}

struct TableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FQTableViewCell(title: "")
    }
}
