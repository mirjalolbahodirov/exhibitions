//
//  PhoneListPhoneListInteractor.swift
//  Exhibitions
//
//  Created by Mirjalol on 05/06/2018.
//  Copyright © 2018 UranCompany. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

class PhoneListInteractor: PhoneListInteractorInput {

    weak var output: PhoneListInteractorOutput!
    
    func fetchPhoneList() {
        Alamofire.request("https://gist.githubusercontent.com/u-android/41ade05b6ae1133e7e86e9dfd55f1794/raw/fed956f9a30ff51a7b77a5b84c4047c09385954d/ios%2520challenge%2520json")
            .responseArray(keyPath: "list") { (response: DataResponse<[PhoneListItem]>) in
                if let items = response.result.value {
                    self.output.handlePhoneList(items: items)
                }
        }
    }

}
