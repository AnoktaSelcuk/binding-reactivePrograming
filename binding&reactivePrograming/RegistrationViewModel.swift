//
//  RegistrationViewModel.swift
//  binding&reactivePrograming
//
//  Created by Alperen Selçuk on 20.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class RegistrationViewModel {
    
    var textField1: String? {
        didSet {
            checkFormValidity()
        }
    }
    
    var textfield2: String? {
        didSet {
            checkFormValidity()
        }
    }
    //reactive programing
    var isFormValidObserver: ((Bool) -> ())?
    
    var bindableIsFormValid = Bindable<Bool>()
}

extension RegistrationViewModel {
        
    fileprivate func checkFormValidity() {
        let isFormValid = textField1?.isEmpty == false && textfield2?.isEmpty == false
        
        //bindable 
        bindableIsFormValid.value = isFormValid
        
        //reactive programing
        isFormValidObserver?(isFormValid)
    }
}
