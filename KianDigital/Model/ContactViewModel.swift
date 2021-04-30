//
//  ContactViewModel.swift
//  KianDigital
//
//  Created by mozhgan on 4/29/21.
//

import Foundation
struct ContactViewModel : Identifiable {
    private var contact : Contact
    var id: String {
        return contact.id ?? ""
    }
    
    var title: String {
      return contact.fullname
    }
    
    var image : String {
        return contact.avatar ?? ""
    }
    
    var phone: String {
      guard let description = contact.phoneNumber else { return "" }
      return description
    }
    
    init(item: Contact) {
      self.contact = item
    }
    
    
}
