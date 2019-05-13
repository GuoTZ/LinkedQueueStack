//
//  main.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation


//var stack = ArrayStack<Int>()
//
//for i in 0...10 {
//    stack.push(e: i)
//    print(stack.description)
//}
//
//try! stack.pop()
//print(stack.description)
//
//
//var queue = ArrayQueue<Int>()
//print("开始加入队列")
//for i in 0...10 {
//    queue.enqueue(e: i)
//    print(queue.description)
//}
//print("加入完成")
//print("-------------")
//print("第一次出队")
//try! queue.dequeue()
//print(queue.description)
//print("第二次出队")
//try! queue.dequeue()
//print(queue.description)
//print("出队完成")


//var listed = LinkedList<Int>()
//print("增")
//try listed.addLast(e: 0)
//try listed.addFirst(e: 10)
//try listed.add(index: 1, e: 12)
//try listed.addLast(e: 1)
//try listed.addFirst(e: 2)
//try listed.add(index: 4, e: 5)
//print(listed.description)
//print("查")
//let first = try listed.getFirst()
//let last = try listed.getLast()
//let index = try listed.get(index: 2)
//print("查询first=====\(first ?? 0)\n查询last=====\(last ?? 0)\n查询index2=====:\(index ?? 0)")
//print("查询是否存在数字5===\(listed.contains(e: 5))")
//print("删")
//try listed.removeLast()
//print(listed.description)
//try listed.removeFirst()
//print(listed.description)
//try listed.remove(index: 2)
//print(listed.description)
//print("改")
//try listed.set(index: 1, e: 100)
//print(listed.description)


//var stack = LinkedStack<Int>()
//
//for i in 0...10 {
//    try stack.push(e: i)
//    print(stack.description)
//}
//
//try! stack.pop()
//print(stack.description)

var queue = LinkedQueue2<Int>()
print("开始加入队列")
for i in 0...10 {
    try queue.enqueue(e: i)
    print(queue.description)
}
print("加入完成")
print("-------------")
print("第一次出队")
try! queue.dequeue()
print(queue.description)
print("第二次出队")
try! queue.dequeue()
print(queue.description)
print("出队完成")
