//
//  LinkedQueue.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

struct LinkedQueue<E>: QueueAble where E:Equatable {
    private var data:LinkedList<E>
    init() {
        self.data = LinkedList<E>()
    }
    func getSize() -> Int {
        return self.data.getSize()
    }
    
    func isEmpty() -> Bool {
        return self.data.getSize() == 0
    }
    
    mutating func enqueue(e: E) throws{
        try self.data.addFirst(e: e)
    }
    
    mutating func dequeue() throws -> E? {
        return try self.data.removeLast()
    }
    
    func getFront() throws -> E? {
        return try self.data.getFirst()
    }
    // 重写基类中description属性
    var description: String {
        var res = String();
        res.append("链表队列: ");
        res.append("队首 [");
        for i in 0..<self.data.getSize() {
            if let e = try? self.data.get(index: i) {
                res.append("\(e)");
                if (i != self.data.getSize() - 1){
                    res.append(", ");
                }
            }
        }
        res.append("] 队尾");
        return res;
    }
}


class LinkedList2<E>: LinkedList<E> where E:Equatable {
    /// 虚拟头结点
    private var foot:Node<E>?
    override init() {
        super.init()
        self.foot = self.dummyHead
    }
    override func addLast(e: E) throws {
        self.foot?.node = Node.init(e: e, node: nil)
        self.foot = self.foot?.node
        self.size += 1;
    }
}


struct LinkedQueue2<E>: QueueAble where E:Equatable {
    private var data:LinkedList2<E>
    init() {
        self.data = LinkedList2<E>()
    }
    func getSize() -> Int {
        return self.data.getSize()
    }
    
    func isEmpty() -> Bool {
        return self.data.getSize() == 0
    }
    
    mutating func enqueue(e: E) throws{
        try self.data.addLast(e: e)
    }
    
    mutating func dequeue() throws -> E? {
        return try self.data.removeFirst()
    }
    
    func getFront() throws -> E? {
        return try self.data.getFirst()
    }
    // 重写基类中description属性
    var description: String {
        var res = String();
        res.append("链表队列: ");
        res.append("队首 [");
        for i in 0..<self.data.getSize() {
            if let e = try? self.data.get(index: i) {
                res.append("\(e)");
                if (i != self.data.getSize() - 1){
                    res.append(", ");
                }
            }
        }
        res.append("] 队尾");
        return res;
    }
}

