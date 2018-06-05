//
//  PhoneListPhoneListPresenter.swift
//  Exhibitions
//
//  Created by Mirjalol on 05/06/2018.
//  Copyright © 2018 UranCompany. All rights reserved.
//

class PhoneListPresenter: PhoneListModuleInput, PhoneListViewOutput, PhoneListInteractorOutput {

    weak var view: PhoneListViewInput!
    var interactor: PhoneListInteractorInput!
    var router: PhoneListRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.showLoader()
        interactor.fetchPhoneList()
    }
    
    func handlePhoneList(items: [PhoneListItem]) {
        view.hideLoader()
        view.setListData(items: items)
    }
    
}
