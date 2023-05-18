//
//  MockRepository.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation
import RxSwift
import Moya
class MockRepository:Repository{
    func login(request: LoginRequest) -> Single<BaseResponse<Any>> {
        return BaseResponse<Any>(message:nil,result:123).asResponse()
            .delay(.milliseconds(20), scheduler: MainScheduler.instance)
            .myMapObject(type: BaseResponse<Any>.self)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
        
    }
    
    
}
