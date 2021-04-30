//
//  ContactCell.swift
//  KianDigital
//
//  Created by mozhgan on 4/28/21.
//

import SwiftUI

struct ContactCell: View {
    private var viewModel : ContactViewModel;
    var body: some View {
        HStack {
            CircleImage(url: URL(string: viewModel.image)!)
                .frame(width: CGFloat(Layout.thumbnailSize),
                       height: CGFloat(Layout.thumbnailSize),
                       alignment: .center)
            VStack {
                LabelBold(text: viewModel.title)
                LabelRegular(text: viewModel.phone)
            }
            
            Spacer()
            //CustomButton()
        }
        .onAppear(){
            
        }
        
    }
    
    init(viewModel : ContactViewModel) {
        self.viewModel = viewModel
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell( viewModel: ContactViewModel(item:
                                                            Contact(id: "123", name: "Mozhgan",family: "Jelodar",phoneNumber: "09124251907",avatar: "avatar")))
    }
}
