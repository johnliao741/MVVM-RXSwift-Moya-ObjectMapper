//
//  ViewModel.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation
import RxSwift
class ViewModel{
    @Inject private var loginUseCase :LoginUseCase
    var loginResponse = PublishSubject<Result<BaseResponse<Any>>>()
    private let dispose = DisposeBag()
    init() {
       
    }
    func login(account:String,password:String){
        print("accout : \(account) password : \(password)")
        self.loginResponse.onNext(Result.Loading(text: nil))
        loginUseCase.invoke(request: LoginRequest(account: account, password: password, partenr: "off", token: "", platform: "android"))
            .subscribe(
            onSuccess: {
                response in
                print("response1 \(response)")
                self.loginResponse.onNext(Result<BaseResponse>.Success(response))
            },
            onError: {error in
                print("error \(error)")
                self.loginResponse.onNext(Result<BaseResponse>.Error(error: error as! ApiException))
            }
        ).disposed(by: dispose)
    }
}
