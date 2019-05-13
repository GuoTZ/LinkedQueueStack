//
//  LinkedStack.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

struct LinkedStack<E>:StackAble where E:Equatable {
    var data: LinkedList<E>
    init() {
        self.data = LinkedList<E>()
    }
    
    func getSize() -> Int {
        return self.data.getSize()
    }
    
    func isEmpty() -> Bool {
        return self.data.isEmpty()
    }
    
    mutating func push(e: E) throws {
       try self.data.addLast(e: e)
    }
    
    mutating func pop() throws -> E? {
        return try self.data.removeFirst()
    }
    
    func peek() throws -> E? {
        return try self.data.getFirst()
    }
    
    // 重写基类中description属性
    var description: String {
        var res = String();
        res.append("链表栈: ");
        res.append("栈顶 [");
        for i in 0..<self.data.getSize() {
            if let e = (try? self.data.get(index: i)) {
                res.append("\(String(describing:e ))");
                if (i != self.data.getSize() - 1){
                    res.append(", ");
                }
            }
            
        }
        res.append("]");
        return res;
    }
}



