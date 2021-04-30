//
//  LabelRegular.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI

struct LabelRegular: View {
    var text : String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}

struct LabelRegular_Previews: PreviewProvider {
    static var previews: some View {
        LabelRegular(text: "String")
    }
}
