//
//  OperationError.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

/// 定义错误类型
///
/// - ErrorMsg: ErrorMsg description
/// - ErrorOther: ErrorOther description
enum OperationError : Error {
    case ErrorMsg(String)
    case ErrorOther
}

