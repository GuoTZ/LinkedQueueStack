//
//  StackAble.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

protocol StackAble {
    associatedtype E
    
    /// 查询栈的个数
    ///
    /// - Returns: func
    func getSize() -> Int
    
    /// 查询栈是否为空
    ///
    /// - Returns: true false
    func isEmpty() -> Bool
    
    /// 入栈
    ///
    /// - Parameter e: 入栈的数据
    /// - Returns: return value description
    mutating func push(e:E) throws
    
    /// 出栈
    ///
    /// - Returns: 值
    mutating func pop() throws -> E?
    
    /// 查看栈顶的数据
    ///
    /// - Returns: return value description
    func peek() throws -> E?
}
