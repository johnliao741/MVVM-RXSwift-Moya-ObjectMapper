//
//  Swinject.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//

import Foundation
import Swinject
import RxSwift
import Moya


@propertyWrapper
struct Inject<T>{
    
    let wrappedValue: T
    init(){
        self.wrappedValue = Injection.shared.container.resolve(T.self)!
    }
}
final class Injection{
    static let shared = Injection()
    var container:Container {
        get{
            if _container == nil{
                _container = buildContainer()
            }
            return _container!
        }
        set{
            _container = newValue
        }
    }
    private var _container: Container?
         
        private func buildContainer() -> Container {
            let container = Container()
            container.register(Repository.self) { _ in
                let repository:Repository = Contact.isMockEnvironment ? RepositoryImp() : MockRepository()
                return repository
            }
            container.register(MoyaProvider<NetAPI>.self){
                _ in return MoyaProvider<NetAPI>()
            }
            container.register(LoginUseCase.self) { r in
                return LoginUseCase(repository: r.resolve(Repository.self)!)
            }
            return container
        }
}
