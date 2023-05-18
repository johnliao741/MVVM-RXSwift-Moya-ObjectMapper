//
//  Repository.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation
import RxSwift
protocol Repository{
    func login(request:LoginRequest)->Single<BaseResponse<Any>>
}
