//
//  Int+Extension.swift
//  ANBaseUI
//
//  Created by Ackerman on 2019/12/17.
//

import UIKit

public extension Int {
    var f: UIFont {
        return UIFont.systemFont(ofSize: CGFloat(self))
    }
    var bf: UIFont {
        return UIFont.boldSystemFont(ofSize: CGFloat(self))
    }
}
