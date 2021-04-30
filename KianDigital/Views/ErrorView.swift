//
//  ErrorView.swift
//  KianDigital
//
//  Created by mozhgan on 4/30/21.
//

import SwiftUI

struct ErrorView: View {
    @Binding var error : NetworkError!

    var body: some View {
        Section(header : Text(Strings.Common.error).font(.subheadline)) {
            Text(error.debugDescription)
            .foregroundColor(.red)
        }
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView(message: $"")
//    }
//}
