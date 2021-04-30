//
//  ViewModel.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI
import Combine
final class ContactssViewModel: ObservableObject, Identifiable {
    private let dataFetcher: UserFetchable
    @Published var name: String = ""
    @Published var contacts: [ContactViewModel] = []
    private var disposables = Set<AnyCancellable>()
    
    init(dataFetcher: UserFetchable) {
        self.dataFetcher = dataFetcher
    }
    
    func getContacts(){
        self.dataFetcher.users().map{ response in
            response.map(ContactViewModel.init)
        }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
            guard let strongSelf = self else { return }
            switch value {
            case .failure:
                strongSelf.contacts = []
            case .finished:
              break
            }
        } receiveValue: { [weak self](users) in
            guard let strongSelf = self else { return }
            strongSelf.contacts = users
        }.store(in: &disposables)
    }
}
