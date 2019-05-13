//
//  QueueAble.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

protocol QueueAble {
    associatedtype E
    
    /// 查询队列的个数
    ///
    /// - Returns: func
    func getSize() -> Int
    
    /// 查询队列是否为空
    ///
    /// - Returns: true false
    func isEmpty() -> Bool
    
    /// 入队列
    ///
    /// - Parameter e: 入队列的数据
    /// - Returns: return value description
    mutating func enqueue(e:E) throws
    
    /// 出队列
    ///
    /// - Returns: 值
    mutating func dequeue() throws -> E?
    
    /// 查看队列顶的数据
    ///
    /// - Returns: return value description
    func getFront() throws -> E?
}
