//
//  Node.swift
//  structurestemplate
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

public class Node<Element>: CustomDebugStringConvertible {

    
    public var e: Element?  //数据域
    public var node: Node<Element>? //指针域
    
    init(e:Element?,node:Node<Element>?) {
        self.e = e
        self.node = node
    }
    
    convenience init(e:Element?) {
        self.init(e: e,node: nil)
    }
    
    convenience init() {
        self.init(e: nil,node: nil)
    }
    
    public var debugDescription: String {
        return self.e == nil ? "nil" : String(describing: self.e!)
    }
}
