//
//  NetAPI.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation
import Moya

enum NetAPI{
    case Login(request:LoginRequest)
}
extension NetAPI : TargetType{
    
    
    var baseURL: URL {
        return URL(string:Contact.apiUrl)!
    }
    
    var path: String {
        switch self{
        case .Login(_):
            return "/account/login.php"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .Login(_): return .post
        }
    }
    //Unit Test
    var sampleData: Data {
        return "Login successfully".data(using: String.Encoding.utf8)!
    }
    
    var task: Moya.Task {
        switch self{
            case .Login(let request):
                return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        var headers: [String: String] = [:]
        
        switch self {
            case .Login(_):
                headers["Content-type"] = "application/json;charset=utf-8"
            }
        
        return headers
    }
    
    
}
