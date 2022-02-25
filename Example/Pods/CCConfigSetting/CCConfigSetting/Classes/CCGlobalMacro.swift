//
//  CCGlobalMacro.swift
//  CCConfigSetting
//
//  Created by ZCZ on 2022/2/22.
//

import UIKit

// 隐私政策
public let cc_m7privacy_policy = "https://m.7moor.com/static/m7PrivacyPolicy.html"
// 服务协议
public let cc_m7ServiceTerms = "https://m.7moor.com/static/m7ServiceTerms.html"
// 权限说明
public let cc_m7Permission = "https://m.7moor.com/static/m7AppPermission.html"
// SDK 列表
public let cc_m7SDK_list = "https://m.7moor.com/static/m7AppPermission.html"


public func isIPad() -> Bool {
    let model = UIDevice.current.model
    if model == "iPad" {
        //iPad
        return true
    }
    
    return false
}




/// 全屏宽度
public let kScreenWidth = UIScreen.main.bounds.size.width
/// 全屏高度
public let kScreenHeight = UIScreen.main.bounds.size.height



public let kScale6 = isIPad() ? 1 : (kScreenHeight/812.0)

/// 是否是深色模式
public var isDarkStyle = false;

public let dateYearPattern: String = "yyyy-MM-dd"
public let datePattern: String = "yyyy-MM-dd HH:mm:ss"
public let dateTimePattern: String = "HH:mm:ss"



/*********字体***********/
public let PingFangSC_Med = "PingFangSC-Medium";
public let PingFangSC_Reg = "PingFangSC-Regular";
public let PingFangSC_Lig = "PingFangSC-Light";
public let PingFangTC_Sem = "PingFangTC-Semibold";


public var isIPhoneX: Bool {
    var iPhoneX: Bool = false
    if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
        return iPhoneX
    }
    
    if #available(iOS 11.0, *) {
        if let window = UIApplication.shared.delegate?.window, let window = window , window.safeAreaInsets.bottom > 0 {
            iPhoneX = true
        }
    }
    return iPhoneX
}
