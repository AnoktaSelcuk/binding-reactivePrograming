//
//  ViewController.swift
//  binding&reactivePrograming
//
//  Created by Alperen Selçuk on 17.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    let registrationViewModel = RegistrationViewModel()
    
    let button1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Button1", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = .systemGray
//        btn.isEnabled = false
        btn.addTarget(self, action: #selector(handleButton(sender:)), for: .primaryActionTriggered)
        return btn
    }()
    
    let textField1: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "textfield"
        txtfld.backgroundColor = .systemGray
        txtfld.addTarget(self, action: #selector(handleTextfield), for: .editingChanged)
        
        return txtfld
    }()
    
    let textField2: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "textfield"
        txtfld.backgroundColor = .systemGray
        txtfld.addTarget(self, action: #selector(handleTextfield), for: .editingChanged)
        
        return txtfld
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let stackview = UIStackView(arrangedSubviews: [button1, textField1, textField2])
        stackview.spacing = 10
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        view = stackview
        
        setupRegistrationViewModelObserver()
    }
}

//@objc function
extension RegistrationViewController {
    @objc func handleTextfield(textfield: UITextField?) {
        switch textfield {
        case textField1:
            registrationViewModel.textField1 = textField1.text
        default:
            registrationViewModel.textfield2 = textField2.text
        }
    }
    
    @objc func handleButton(sender: UIButton?) {
        print("buton tapped")
    }
}

extension RegistrationViewController {
    fileprivate func setupRegistrationViewModelObserver() {
        registrationViewModel.isFormValidObserver = {[unowned self] (isFormValid) in
            
            self.button1.isEnabled = isFormValid
            self.button1.backgroundColor = isFormValid ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : .lightGray
            self.button1.setTitleColor(isFormValid ? .white : .gray, for: .normal)
        }
    }
    
    fileprivate func setupRegistrationViewModelBindingObserver() {
        registrationViewModel.bindableIsFormValid.bind { [unowned self] (isFormValid) in
            guard let isFormValid = isFormValid else { return }
            self.button1.isEnabled = isFormValid
            self.button1.backgroundColor = isFormValid ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : .lightGray
            self.button1.setTitleColor(isFormValid ? .white : .gray, for: .normal)
        }
    }
}
