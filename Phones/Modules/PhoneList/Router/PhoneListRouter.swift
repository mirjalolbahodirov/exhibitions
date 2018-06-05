//
//  PhoneListPhoneListRouter.swift
//  Exhibitions
//
//  Created by Mirjalol on 05/06/2018.
//  Copyright © 2018 UranCompany. All rights reserved.
//

import UIKit

class PhoneListRouter: BaseRouter, PhoneListRouterInput {

    func configure() -> PhoneListRouter {
        let viewController = PhoneListViewController()

        self.viewController = viewController

        let presenter = PhoneListPresenter()
        presenter.view = viewController
        presenter.router = self

        let interactor = PhoneListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return self
    }

}
