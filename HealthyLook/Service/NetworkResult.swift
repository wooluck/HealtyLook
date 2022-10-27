//
//  NetworkResult.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/27.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
