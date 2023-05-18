//
//  Result.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation

enum Result<T:BaseResponse<Any>>{
    case Error(error:ApiException)
    case Success(T)
    case Loading(text:String?)
}
