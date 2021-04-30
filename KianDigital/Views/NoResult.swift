//
//  NoResult.swift
//  KianDigital
//
//  Created by mozhgan on 4/29/21.
//

import SwiftUI

struct NoResult: View {
    var body: some View {
      Section {
        Text(Strings.Common.noResult)
          .foregroundColor(.gray)
      }
    }
}

struct NoResult_Previews: PreviewProvider {
    static var previews: some View {
        NoResult()
    }
}
