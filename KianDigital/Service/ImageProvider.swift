//
//  ImageProvider.swift
//  KianDigital
//
//  Created by mozhgan on 4/29/21.
//

import Foundation
import Combine
import UIKit
final class ImageProvider: ObservableObject {
    @Published var image = UIImage(named: "avatar")!
    private var cancellable: AnyCancellable?
    private let imageLoader = ImageLoader()
    
    init(placeholder: UIImage = UIImage()){
        self.image = placeholder
    }

    func loadImage(url: URL) {
        self.cancellable = imageLoader.publisher(for: url)
            .sink(receiveCompletion: { failure in
            print(failure)
        }, receiveValue: { image in
            self.image = image
        })
    }
}
