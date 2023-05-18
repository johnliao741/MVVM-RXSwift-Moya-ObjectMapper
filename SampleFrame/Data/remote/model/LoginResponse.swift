//
//  LoginResponse.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//

import ObjectMapper
class LoginResponse : BaseResponse<LoginResponse>{
    var account:String?
    var password:String?
    
    required init?(map:Map){
        super.init(map: map)
    }
    init(message:String,status:Int,account:String,password:String){
        super.init(message: message, result: status)
        self.account = account
        self.password = password
    }
    override func mapping(map: Map) {
        super.mapping(map: map)
        account <- map["account"]
        password <- map["password"]
    }
}
