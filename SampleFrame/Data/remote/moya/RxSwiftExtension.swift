//
//  RxSwiftExtension.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation

import Foundation
import RxSwift
import Moya
import ObjectMapper

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func myMapObject<T: BaseMappable>(type: T.Type) -> Single<T> {
        return self.map{ response in
            return try response.mapObject(type: type)
        }
    }
    func myMapArray<T: BaseMappable>(type: T.Type) -> Single<[T]> {
        return self.map{ response in
            return try response.mapArray(type: type)
        }
    }
}
public extension ObservableType where Element == Response {
    func myMapObject<T: BaseMappable>(type: T.Type) -> Observable<T> {
        return self.map{ response in
            return try response.mapObject(type: type)
        }
    }
    func myMapArray<T: BaseMappable>(type: T.Type) -> Observable<[T]> {
        return self.map{ response in
            return try response.mapArray(type: type)
        }
    }
}
extension Observable where Element == Response{
    func myMapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map { response in
            
            return try response.mapObject(type: type)
        }
    }
    
    func myMapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
       
        
            return try response.mapArray(type: type)
        }
    }
}
public extension Response{
    func mapObject<T: BaseMappable>(type: T.Type) throws -> T{
        let text = String(bytes: self.data, encoding: .utf8)
        print("response \(text)")
        do{
            let baseResponse = Mapper<BaseResponse<Any>>().map(JSONString: text!)
            print("baseResponse \(baseResponse)")
            if baseResponse?.result != 200 {
                throw ApiException(message: baseResponse?.message ?? "API Error")
            }else{
                return Mapper<T>().map(JSONString: text!)!
            }
        }catch{
            if error is ApiException {
                throw error
            }
            throw ApiException(message:error.localizedDescription)
        }
    }
    func mapArray<T: BaseMappable>(type: T.Type) throws -> [T]{
        let text = String(bytes: self.data, encoding: .utf8)
        do{
            let baseResponse = Mapper<BaseResponse<Any>>().map(JSONString: text!)
            if baseResponse?.result != 200 {
                throw ApiException(message: baseResponse?.message ?? "API Error")
            }else{
                return Mapper<T>().mapArray(JSONString: text!)!
            }
        }catch{
            if error is ApiException {
                throw error
            }
            throw ApiException(message:error.localizedDescription)
        }
    }
}


