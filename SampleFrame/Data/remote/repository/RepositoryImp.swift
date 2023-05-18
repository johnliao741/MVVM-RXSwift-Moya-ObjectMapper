//
//  RepositoryImp.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//


import Moya
import RxSwift
import Moya_ObjectMapper
class RepositoryImp : Repository{
   
    
    @Inject var netAPI : MoyaProvider<NetAPI>
    func login(request: LoginRequest) -> Single<BaseResponse<Any>> {
        return netAPI.rx.request(.Login(request: request))
            .myMapObject(type: BaseResponse<Any>.self)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
        
    }
}
