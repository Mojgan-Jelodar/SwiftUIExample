//
//  ContactList.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI

struct ContactList: View {
    @ObservedObject var viewModel: ContactsViewModel

    init(viewModel: ContactsViewModel) {
      self.viewModel = viewModel
    }
    var body: some View {
       LoadingView(isShowing: $viewModel.isLoading){
            NavigationView {
              List {
                if viewModel.error != nil {
                    ErrorView(error: $viewModel.error)
                }
                else if viewModel.contacts.isEmpty {
                  NoResult()
                } else {
                    SectionView(header: Strings.Contacts.quickView, viewModel: Array(viewModel.contacts[0..<5]))
                    SectionView(header: Strings.Contacts.contactView, viewModel: Array(viewModel.contacts[5...]))
                }
              }.listStyle(GroupedListStyle())
            }.navigationBarTitle(Strings.Contacts.title)
        }
   
      .onAppear(){
        viewModel.getContacts()
      }
    }
    
}

extension ContactList {
    static func createModule(fetcher : UserFetchable) -> ContactList {
        let viewModel = ContactsViewModel(dataFetcher: fetcher)
        let view = ContactList(viewModel: viewModel)
        return view
    }
}

#if DEBUG
struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(viewModel: ContactsViewModel(dataFetcher: CachedData()))
    }
}
#endif



