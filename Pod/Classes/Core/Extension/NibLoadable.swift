//
//  NibLoadable.swift
//  ANBaseUI
//
//  Created by yanlan on 2019/12/11.
//

import UIKit

public protocol NibLoadable {}

public extension NibLoadable where Self: UIView {
    static func loadFromNib(_ nibName: String? = nil,_ bundle: Bundle = Bundle.main) -> Self {
        let loadName = (nibName == nil) ? "\(self)" : nibName!
        return bundle.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}

public extension NibLoadable where Self: UIViewController {
    static func loadFromSB(_ vcIdentifier: String? = nil,_ sbName: String = "Main",_ bundle: Bundle = Bundle.main) -> Self {
        let vcIdentifier = (vcIdentifier == nil) ? "\(self)" : vcIdentifier
        return UIStoryboard(name: sbName, bundle: bundle).instantiateViewController(withIdentifier: vcIdentifier!) as! Self
    }
    
    static func loadInstantiateVCFromSB(_ sbName: String = "Main",_ bundle: Bundle = Bundle.main) -> Self {
        return UIStoryboard(name: sbName, bundle: bundle).instantiateInitialViewController() as! Self
    }
    
    static func loadFromNib(_ nibName: String? = nil,_ bundle: Bundle = Bundle.main) -> Self {
        let loadName = (nibName == nil) ? "\(self)" : nibName!
        return UIViewController(nibName: loadName, bundle: bundle) as! Self
    }
}
