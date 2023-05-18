//
//  ApiException.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation

class ApiException:Error{
    var message:String
    var status:Int?
    
    init(message: String, status: Int? = nil) {
        self.message = message
        self.status = status
    }
    func toString()->String{
        "api error"
    }
}
