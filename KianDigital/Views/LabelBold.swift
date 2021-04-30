//
//  LabelBold.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI

struct LabelBold: View {
    var text : String;
    var body: some View {
        Text(text)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.primary)
    }
}

struct LabelBold_Previews: PreviewProvider {
    static var previews: some View {
        LabelBold(text: "")
    }
}
