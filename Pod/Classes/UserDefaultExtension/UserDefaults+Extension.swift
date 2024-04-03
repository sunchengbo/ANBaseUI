//
//  UserDefaults+Extension.swift
//  ANBaseUI
//
//  Created by Ackerman on 2019/5/12.
//

import UIKit

public protocol UserDefaultSettable {
    var uniqueKey: String { get }
}

public extension UserDefaultSettable where Self : RawRepresentable, Self.RawValue == String {
    
    func remove() {
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }
    
    func store(value: Any?) {
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    
    var storedValue: Any? {
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    
    var uniqueKey: String {
        //        return "\(Self.self).\(rawValue)"
        //    从oc主工程里读UserDefault
        return "\(rawValue)"
    }
    
    var storedString: String? {
        return UserDefaults.standard.string(forKey: uniqueKey)
    }
    
    var storedArray: [Any]? {
        return UserDefaults.standard.array(forKey: uniqueKey)
    }
    
    var storedDictionary: [String : Any]? {
        return UserDefaults.standard.dictionary(forKey: uniqueKey)
    }
    
    var storedData: Data? {
        return UserDefaults.standard.data(forKey: uniqueKey)
    }
    
    var storedStringArray: [String]? {
        return UserDefaults.standard.stringArray(forKey: uniqueKey)
    }
    
    var storedInt: Int {
        return UserDefaults.standard.integer(forKey: uniqueKey)
    }
    
    var storedFloat: Float {
        return UserDefaults.standard.float(forKey: uniqueKey)
    }
    
    var storedDouble: Double {
        return UserDefaults.standard.double(forKey: uniqueKey)
    }
    
    var storedBool: Bool {
        return UserDefaults.standard.bool(forKey: uniqueKey)
    }
    
    var storedInteger: NSInteger {
        return UserDefaults.standard.integer(forKey: uniqueKey)
    }
    
}
