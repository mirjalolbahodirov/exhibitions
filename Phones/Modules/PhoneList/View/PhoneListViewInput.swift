//
//  PhoneListPhoneListViewInput.swift
//  Exhibitions
//
//  Created by Mirjalol on 05/06/2018.
//  Copyright © 2018 UranCompany. All rights reserved.
//

protocol PhoneListViewInput: class {

    /**
        @author Mirjalol
        Setup initial state of the view
    */

    func setupInitialState()
    
    func showLoader()
    
    func hideLoader()
    
    func setListData(items: [PhoneListItem])
    
}
