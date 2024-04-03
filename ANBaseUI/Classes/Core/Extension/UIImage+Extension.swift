//
//  UIImage+Extension.swift
//  ANBaseUI
//
//  Created by iOS on 2019/5/8.
//

import Foundation

extension UIImage {
    convenience init(imageNameByBundle name: String) {
        let framework = Bundle(for: CoreViewController.self)
        let url = framework.url(forResource: "ANBaseUI", withExtension: "bundle")
        let myBundle = Bundle(url: url!)
        self.init(named: name, in: myBundle, compatibleWith: nil)!
    }
}
