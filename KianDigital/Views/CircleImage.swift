//
//  CircleImage.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI

struct CircleImage: View {
    var url: URL
    @ObservedObject var imageProvider = ImageProvider(placeholder: UIImage(named: "avatar") ?? UIImage())

    var body: some View {
        Image(uiImage: imageProvider.image)
            .resizable()
            .clipShape(Circle())
            .shadow(color: Color.black, radius: 1, x: 0, y: 0)
        .onAppear {
            //imageProvider.loadImage(url: url)
        }
    }
    
    init(url : URL) {
        self.url = url
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(url: URL(string: "https://s3.amazonaws.com/uifaces/faces/twitter/doronmalki/128.jpg")!)
    }
}
