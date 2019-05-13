//
//  ArrayStack.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

struct ArrayStack<E>: StackAble {
    private var data:[E]
    init() {
        self.data = Array<E>()
    }
    func getSize() -> Int {
        return self.data.count
    }
    
    func isEmpty() -> Bool {
        return self.data.count == 0
    }
    
    mutating func push(e: E) throws{
        self.data.insert(e, at: 0)
    }
    
    mutating func pop() throws -> E? {
        let e = self.data.first
        if e == nil {
            throw OperationError.ErrorMsg("不存在")
        }
        self.data.remove(at: 0)
        return e!
    }
    
    func peek() throws -> E? {
        let e = self.data.first
        if e == nil {
            throw OperationError.ErrorMsg("栈顶不存在元素")
        }
        return e!
    }
    // 重写基类中description属性
    var description: String {
        var res = String();
        res.append("Stack: ");
        res.append("top [");
        for i in 0..<self.data.count {
            res.append("\(self.data[i])");
            if (i != self.data.count - 1){
                res.append(", ");
            }
        }
        res.append("]");
        return res;
    }
}


