//
//  LinkedListAble.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

/// E 必须遵守相等协议 Equatable
class LinkedList<E> where E:Equatable {
    
    /// 虚拟头结点
    public var dummyHead:Node<E>
    /// 链表的大小
    public var size:Int
    init() {
        self.size = 0
        self.dummyHead = Node<E>()
    }
    // 获取链表中的元素个数
    public func getSize() -> Int{
    return size;
    }
    // 返回链表是否为空
    public func isEmpty() -> Bool{
    return size == 0;
    }
    // 在链表的index(0-based)位置添加新的元素e
    public func add(index:Int, e:E) throws -> Void{
        
        if (index < 0 || index > size){
            throw OperationError.ErrorMsg("添加失败。非法索引。")
        }
        
        var prev:Node<E>? = dummyHead;
        for _ in 0..<index {
            prev = prev?.node
        }
        
        if let prev = prev {
            prev.node = Node.init(e: e, node: prev.node);
        }
        self.size += 1;
    }
    
    // 在链表头添加新的元素e
    public func addFirst(e:E) throws -> Void{
        try add(index: 0, e: e);
    }
    
    // 在链表末尾添加新的元素e
    public func addLast(e:E) throws -> Void{
        try add(index: size, e: e);
    }
    
    
    // 获得链表的第index(0-based)个位置的元素
    public func get(index:Int) throws -> E?{
    
        if (index < 0 || index > size){
            throw OperationError.ErrorMsg("添加失败。非法索引。")
        }
    
        var cur = self.dummyHead.node;
        for _ in 0..<index {
            cur = cur?.node
        }
        return cur?.e;
    }
    
    // 获得链表的第一个元素
    public func getFirst() throws -> E?{
        return try get(index: 0);
    }
    
    // 获得链表的最后一个元素
    public func getLast() throws -> E?{
        return try get(index: size - 1);
    }
    
    // 查找链表中是否有元素e
    public func contains(e:E) -> Bool{
        var cur = dummyHead.node;
        while(cur != nil){
            if let next = cur?.e {
                if next == e {
                    return true
                }
            }
            
            cur = cur?.node
        }
        return false;
    }
    // 从链表中删除index(0-based)位置的元素, 返回删除的元素
    public func remove(index:Int) throws -> E?{
        if (index < 0 || index > size){
            throw OperationError.ErrorMsg("添加失败。非法索引。")
        }
    
        var prev:Node<E>? = dummyHead;
        for _ in 0..<index {
            prev = prev?.node
        }
        
    
        let retNode = prev?.node
        prev?.node = retNode?.node
        retNode?.node = nil
        self.size -= 1
    
        return retNode?.e;
    }
    // 修改链表的第index(0-based)个位置的元素为e
    // 在链表中不是一个常用的操作，练习用：）
    public func set(index:Int, e:E) throws {
        if (index < 0 || index > size){
            throw OperationError.ErrorMsg("添加失败。非法索引。")
        }
    
        var cur = dummyHead.node
        for _ in 0..<index {
            cur = cur?.node
            cur?.e = e
        }
    }
    // 从链表中删除第一个元素, 返回删除的元素
    public func removeFirst() throws -> E?{
        return try remove(index: 0);
    }
    
    // 从链表中删除最后一个元素, 返回删除的元素
    public func removeLast() throws -> E?{
        return try remove(index: size - 1);
    }
    
    // 从链表中删除元素e
    public func removeElement(e:E){
        var prev:Node<E>? = dummyHead
        while(prev?.node != nil){
            if let next = prev?.e {
                if next == e {
                    break;
                }
            }
            prev = prev?.node;
        }
        
        if(prev?.node != nil){
            let delNode = prev?.node
            prev?.node = delNode?.node
            delNode?.node = nil
        }
    }
    var description: String {
        var res = String();
    
        var cur = dummyHead.node
        while(cur != nil){
            res.append(cur!.debugDescription + "->");
            cur = cur?.node
        }
        res.append("nil")
        return res
    }
}
