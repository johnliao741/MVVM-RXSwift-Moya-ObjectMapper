//
//  AppUseCase.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//

import Foundation

protocol AppUseCase{
    associatedtype T
    associatedtype R
    func invoke(request:T) -> R
}
