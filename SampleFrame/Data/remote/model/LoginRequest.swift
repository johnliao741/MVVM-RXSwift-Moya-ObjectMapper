//
//  LoginRequest.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//


import ObjectMapper
class LoginRequest :  Mappable{
    var account:String?
    var password:String?
    var partner:String?
    var token:String?
    var platform:String?
    init(account:String,password:String,partenr:String,token:String,platform:String){
        self.account = account
        self.password = password
        self.partner = partenr
        self.token = token
        self.platform = platform
    }
    
    required init?(map:Map){
        
    }
    func mapping(map: Map) {
        account <- map["Acc"]
        password <- map["Pwd"]
        partner <- map["Partner"]
        token <- map["Token"]
        platform <- map["Platform"]
      
    }
}
