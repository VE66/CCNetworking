//
//  LGKeyChain.swift
//  ZGLoginModule
//
//  Created by ZCZ on 2021/11/25.
//

import UIKit
import Security

let lg_in_keychain = "X54BPV8374.com.7moor.ims"


enum LG_KeyChainKey: String {
    case lg_loginName, lg_password, lg_accountId, lg_mobile
}

public class CCKeyChain: NSObject {
    
    public static let shared = CCKeyChain()
    
    private var _loginName: String? {
        didSet {
            let _ = self.keychainSave(_loginName ?? "", key: LG_KeyChainKey.lg_loginName.rawValue)
        }
    }
    public var loginName: String? {
        set {
            _loginName = newValue
        }
        get {
            return _loginName ?? self.keychainGetString(LG_KeyChainKey.lg_loginName.rawValue)
        }
    }
    
    var _password: String? {
        didSet {
            let _ = self.keychainSave(_password ?? "", key: LG_KeyChainKey.lg_password.rawValue)
        }
    }
    
    public var password: String? {
        set {
            _password = newValue
        }
        get {
            return _password ?? self.keychainGetString(LG_KeyChainKey.lg_password.rawValue)
        }
    }
    
    var _accountId: String? {
        didSet {
            let _ = self.keychainSave(_accountId ?? "", key: LG_KeyChainKey.lg_accountId.rawValue)
        }
    }
    
    public var accountId: String? {
        set {
            _accountId = newValue
        }
        get {
            return _accountId ?? self.keychainGetString(LG_KeyChainKey.lg_accountId.rawValue)
        }
    }
    
    
    public var mobile: String? {
        didSet {
            let _ = self.keychainSave(mobile ?? "", key: LG_KeyChainKey.lg_mobile.rawValue)
        }
    }
    
    private override init() {
        super.init()
    }
    
    
    func keychainSave(_ value: String, key: String) -> Bool {
        if let data = value.data(using: .utf8) {
            return keychainSave(data, key: key)
        }
        return false
    }
    
    func keychainSave(_ value: Bool, key: String) -> Bool {
        let bytes: [UInt8] = value ? [1] : [0]
        let data = Data.init(bytes: bytes)
        return keychainSave(data, key: key)
    }
    
    func keychainSave(_ data: Data, key: String) -> Bool {
        
        let prefixedKey = "CC" + "\(key)"
        
        var saveDict: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
                                   kSecAttrAccount: prefixedKey,
                                   kSecAttrService: prefixedKey,
                               kSecAttrAccessGroup: lg_in_keychain]
        
//        // 删除就的数据
        SecItemDelete(saveDict as CFDictionary)
//        // 设置新的数据
        saveDict.updateValue(data, forKey: kSecValueData)
        let saveState = SecItemAdd(saveDict as CFDictionary, nil)
        return (saveState == errSecSuccess)
    }
    
    func keychainGetData(_ key: String) -> Data? {
        let prefixedKey = "CC" + "\(key)"

        // 通过标记获取数据
        var readDict: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked,
                                    kSecReturnData: kCFBooleanTrue,
                                    kSecMatchLimit: kSecMatchLimitOne,
                                   kSecAttrAccount: prefixedKey,
                                   kSecAttrService: prefixedKey,
                               kSecAttrAccessGroup: lg_in_keychain]
        // 查询结果返回到
        readDict.updateValue(kCFBooleanTrue, forKey: kSecReturnData)
        // 只返回搜索到的第一条数据
        readDict.updateValue(kSecMatchLimitOne, forKey: kSecMatchLimit)
        
        var result: AnyObject?

        let lastResultCode = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(readDict as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if lastResultCode == noErr {
            return result as? Data
        }
        
        return nil
    }
    
    func keychainGetString(_ key: String) -> String {
        if let obj = keychainGetData(key) {
            let string = String.init(data: obj, encoding: .utf8) ?? ""
            return string
        }
        
        return ""
    }
    
    func keychainGetBool(_ key: String) -> Bool {
        let obj = keychainGetData(key)
        let bool = obj?.first == 1
        return bool
    }
    
}
