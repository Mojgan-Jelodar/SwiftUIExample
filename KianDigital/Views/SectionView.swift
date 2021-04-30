//
//  SectionView.swift
//  KianDigital
//
//  Created by mozhgan on 4/29/21.
//

import Foundation
import SwiftUI
import Combine

struct SectionView : View {
    var header : String
    var viewModel : [ContactViewModel] = []
    var body: some View {
        Section(header : Text(header)) {
            ForEach(viewModel, content: ContactCell.init(viewModel:))
        }
        .padding(EdgeInsets(top: 0,
                              leading: CGFloat(Layout.Section.leftRightPadding),
                              bottom: 0,
                              trailing: CGFloat(Layout.Section.leftRightPadding)))
        .shadow(color: Color.black.opacity(Layout.Shadow.opacity),
                radius: CGFloat(Layout.Shadow.radius),
                x: 0,
                y: 4)
        .cornerRadius(CGFloat(Layout.Section.cornersRounded))
    }
    init(header : String,
         viewModel : [ContactViewModel]) {
        self.viewModel = viewModel
        self.header = header
    }
}
