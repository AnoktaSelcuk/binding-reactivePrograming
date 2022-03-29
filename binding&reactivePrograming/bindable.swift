//
//  bindable.swift
//  binding&reactivePrograming
//
//  Created by Alperen Selçuk on 20.03.2022.
//  Copyright © 2022 Alperen Selçuk. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?

    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
