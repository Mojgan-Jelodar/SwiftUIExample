//
//  ViewModel.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI
import Combine
final class ContactsViewModel: ObservableObject, Identifiable {
    private let dataFetcher: UserFetchable
    @Published var name: String = ""
    @Published var isLoading: Bool = false
    @Published var contacts: [ContactViewModel] = []
    @Published var error: NetworkError?
    private var disposables = Set<AnyCancellable>()
    
    init(dataFetcher: UserFetchable) {
        self.dataFetcher = dataFetcher
        $name
            .dropFirst(2)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: self.search(name:))
            .store(in: &disposables)
    }
    
    func getContacts(){
        if Reachability.isConnectedToNetwork() {
            self.callApi()
        }else {
            self.error = NetworkError.network(description: Strings.Common.networkConnection)
        }
    }
    
    private func callApi()  {
        self.isLoading = true
        self.dataFetcher.users().map{ response in
            response.map(ContactViewModel.init)
        }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (value) in
            guard let strongSelf = self else { return }
            strongSelf.isLoading = false
            switch value {
            case .failure(let error):
                strongSelf.error = error
            case .finished:
              break
            }
        } receiveValue: { [weak self](users) in
            guard let strongSelf = self else { return }
            strongSelf.contacts = users
        }.store(in: &disposables)
    }
    func search(name : String)  {
        self.contacts = self.contacts.filter({$0.title.contains(name)})
    }
}
