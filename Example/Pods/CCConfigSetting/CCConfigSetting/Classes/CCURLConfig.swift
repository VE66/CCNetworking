//
//  CCURLConfig.swift
//  CCConfigSetting
//
//  Created by ZCZ on 2022/2/22.
//

import UIKit

//// 研发环境(腾讯云)
public var ping_host = "139.199.128.94"
public var ping_port = 7001
public var ccBaseURL = URL(string: "http://139.199.128.94:7001")!
public var cc_webSocket_url = ""
public var isDEBUG = true
public let apsForProductio = false

/// 电商
//public var ping_host = "139.199.128.94"
//public var ping_port = 7111
//public var ccBaseURL = URL(string: "http://140.143.60.140:3220")!
//public var ccBaseURL = URL(string: "http://58.87.118.20:3220")!
//public var isDEBUG = true
//// 测试环境(腾讯云)
//public var ping_host = "139.199.128.94"
//public var ping_port = 7111
//public var ccBaseURL = URL(string: "http://139.199.128.94:7001")!

//// ********************************  云客服正式环境(腾讯云勿动) *********************************
//public var ping_host = "139.199.118.175"
//public var ping_port = 8008
//public var ccBaseURL = URL(string: "https://ykf-app.7moor-fs1.com")!
//public var cc_webSocket_url = "ws://tx-app-socket.7moor.com:8009/webSocket"
//public let apsForProductio = false
//public var isDEBUG = false

//// ********************************  云客服正式环境(阿里云勿动) *********************************
//public var ping_host = "115.29.160.119"
//public var ping_port = 8008
//public var ccBaseURL = URL(string: " https://cc-app.7moor-fs1.com ")!
//public let apsForProductio = true
//public var cc_webSocket_url = ""
//public var isDEBUG = false

// 预发布
//public var ping_host = "139.199.118.175"
//public var ping_port = 7001
//public var ccBaseURL = URL(string: "http://101.201.239.192:7001")!
//public var cc_webSocket_url = "ws://101.201.239.192:8088/webSocket"
//public let apsForProductio = true
//public var isDEBUG = true
//
////视频服务地址
public var VideoHttpHost = "https://rtc.7moor.com"
//public let VideoHttpHost = "https://txrtc.7moor.com"


let kDocuments = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""

// 聊天缓存文件路径
public let kChatFilePath = kDocuments + "/fileRcv/"

// 保存文本文件路径
public let kChatDocFilePath = kDocuments + "/fileSave/Doc/"

// 保存音频文件路径
public let kChatAudioFilePath = kDocuments + "/fileSave/Audio/"

// 保存其他文件路径
public let kChatOtherFilePath = kDocuments + "/fileSave/Other/"

// 七牛资源地址(工单)
//public let qiniuResourcesTicket = "http://7xj0za.com1.z0.glb.clouddn.com/"
public let qiniuResourcesTicket = "https://fs-test.7moor.com"

// 七牛资源地址(消息)
//public let qiniuResources = "http://7xkag6.com2.z0.glb.qiniucdn.com"
public let qiniuResources = "https://fs-im-kefu.7moor.com"

// 七牛资源地址(头像)
public let qiniuResourcesUser = "https://fs-im-resources.7moor.com"
