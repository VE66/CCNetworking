//
//  CCNetworking.swift
//  CCNetworking
//
//  Created by ZCZ on 2022/2/22.
//

import UIKit
import CCConfigSetting

public typealias CCSuccess = ([String: Any])->Void
public typealias CCFailure = (Any)->Void

public class CCNetworking: NSObject {
    
    public class func POST(url: String = ccBaseURL.absoluteString ,path: String = "", param: [String: Any], success: CCSuccess?, failure: CCFailure?) {
        
        var newParam = param
        if param.keys.contains("sessionId") == false {
            let sessionId = CCKeyChain.shared.userID.value ?? ""
            newParam.updateValue(sessionId, forKey: "sessionId")
        }
        
        if let data = try? JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.fragmentsAllowed) {
            let jsonStr = String(data: data, encoding: .utf8) ?? ""
            let jsonString = "data=\(jsonStr)"
            let newString = jsonString.replacingOccurrences(of: "\\/", with: "/")
            let newData = newString.data(using: String.Encoding.utf8)!

            let session = URLSession.shared
            var nUrl = URL.init(string: url) ?? URL(string: "")!
            if path.isEmpty == false {
                nUrl = nUrl.appendingPathComponent(path)
            }
            
            var request = URLRequest.init(url: nUrl)
            request.httpMethod = "POST"
            request.httpBody = newData
                        
            let task = session.dataTask(with: request) { (backData, response, error) in
                if let data = backData {
                    DispatchQueue.main.async {
                        do {
                            let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                            
                            if let dic = dict as? [String: Any], let suc = dic["Succeed"] as? Bool, suc == true {
                                success?(dic)
                            } else {
                                failure?(error ?? "请求失败,请稍后重试!")
                            }
                            
                        } catch {
                            failure?("请求失败,请稍后重试!")
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        failure?(error?.localizedDescription ?? "请求失败,请稍后重试!")
                    }
                }
            }
            
            task.resume()
        } else {
            failure?("数据格式错误")
        }
    }
    
    public class func POSTMoblie(url: String = ccBaseURL.absoluteString, param: [String: Any], success: CCSuccess?, failure: CCFailure?) {
        POST(url: url, path: "/mobile", param: param, success: success, failure: failure)
    }
    
}
