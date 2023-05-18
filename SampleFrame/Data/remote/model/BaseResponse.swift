//
//  BaseResponse.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//

import ObjectMapper
import RxSwift
import Moya
import RxCocoa
class BaseResponse<T> :  Mappable{
    var message:String?
    var result:Int?
    var encode:String?
    var data:T?
    init(message:String?,result:Int,encode:String? = nil,data:T? = nil){
        self.message = message
        self.result = result
        self.encode = encode
        self.data = data
    }
    required init?(map:Map){
        
    }
    func mapping(map: Map) {
        message <- map["Message"]
        result <- map["Result"]
        encode <- map["Encode"]
        data <- map["Data"]
    }
}

extension BaseResponse{
    /**
            [Swinject.Injection.isRelease == false]mock environment use that create release flow
     
     */
    func asResponse() -> Single<Response>{
        Single.create{
            single in
            do{
                let data = try JSONSerialization.data(withJSONObject: self.toJSON())
                single(.success(Response(statusCode: 200, data: data)))
            }catch{
                print(error.localizedDescription)
            }
          
          
            return Disposables.create {
                
            }
        }
    }
}
