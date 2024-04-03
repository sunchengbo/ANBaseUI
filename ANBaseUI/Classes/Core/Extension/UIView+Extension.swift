//
//  UIView+Extension.swift
//  ANBaseUI
//
//  Created by iOS on 2019/5/6.
//

import Foundation
import Toast_Swift

public extension UIView {
    
    func showToast(toast: String, position: ToastPosition = .bottom) {
        self.makeToast(toast, position: position)
    }
    
    func showProcess() {
        self.makeToastActivity(ToastPosition.center)
    }
    
    func hideProcess() {
        self.hideToastActivity()
    }
    
}
