## 线性数据结构栈、队列、链表


## 栈
### `定义：栈是限定仅在表头进行插入和删除操作的线性表`
### 栈的功能协议接口
```swift
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

```
<!-- more -->


### 数组栈 
#### `用数组实现栈结构`
```swift

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

/// 定义错误类型
///
/// - ErrorMsg: ErrorMsg description
/// - ErrorOther: ErrorOther description
enum OperationError : Error {
    case ErrorMsg(String)
    case ErrorOther
}

```
#### `数组栈的使用`
```swift
var stack = ArrayStack<Int>()

for i in 0...10 {
    stack.push(e: i)
    print(stack.description)
}

try! stack.pop()
print(stack.description)
```
#### `输出结果`
```objectivec
Stack: top [0]
Stack: top [1, 0]
Stack: top [2, 1, 0]
Stack: top [3, 2, 1, 0]
Stack: top [4, 3, 2, 1, 0]
Stack: top [5, 4, 3, 2, 1, 0]
Stack: top [6, 5, 4, 3, 2, 1, 0]
Stack: top [7, 6, 5, 4, 3, 2, 1, 0]
Stack: top [8, 7, 6, 5, 4, 3, 2, 1, 0]
Stack: top [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
Stack: top [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
Stack: top [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
Program ended with exit code: 0
```



### 链表栈 
#### `用链表实现栈结构`
[链表的实现](https://www.guotzh.com/2017/09/16/数据结构之链表实现/)
```swift

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
        res.append("Stack: ");
        res.append("top [");
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

```
#### `链表栈的使用`
```swift
var stack = LinkedStack<Int>()

for i in 0...10 {
    try stack.push(e: i)
    print(stack.description)
}

try! stack.pop()
print(stack.description)

```
#### `输出结果`
```objectivec
链表栈: 栈顶 [0]
链表栈: 栈顶 [0, 1]
链表栈: 栈顶 [0, 1, 2]
链表栈: 栈顶 [0, 1, 2, 3]
链表栈: 栈顶 [0, 1, 2, 3, 4]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5, 6]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5, 6, 7]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5, 6, 7, 8]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
链表栈: 栈顶 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
链表栈: 栈顶 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Program ended with exit code: 0
```

## 队列
### `定义：它只允许在表的前端（front）进行删除操作，而在表的后端（rear）进行插入操作，和栈一样，队列是一种操作受限制的线性表`
### 队列的功能协议接口
```swift

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

```
<!-- more -->


### 数组队列 
#### `用数组实现队列结构`
```swift

struct ArrayQueue<E>: QueueAble {
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
    
    mutating func enqueue(e: E) throws{
        self.data.append(e)
    }
    
    mutating func dequeue() throws -> E? {
        let e = self.data.first
        if e == nil {
            throw OperationError.ErrorMsg("不存在")
        }
        self.data.remove(at: 0)
        return e!
    }
    
    func getFront() throws -> E? {
        let e = self.data.first
        if e == nil {
            throw OperationError.ErrorMsg("栈顶不存在元素")
        }
        return e!
    }
    // 重写基类中description属性
    var description: String {
        var res = String();
        res.append("队列: ");
        res.append("队首 [");
        for i in 0..<self.data.count {
            res.append("\(self.data[i])");
            if (i != self.data.count - 1){
                res.append(", ");
            }
        }
        res.append("] 队尾");
        return res;
    }
}



```
#### `数组队列的使用`
```swift

var queue = ArrayQueue<Int>()
print("开始加入队列")
for i in 0...10 {
    queue.enqueue(e: i)
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
```
#### `输出结果`
```objectivec
开始加入队列
队列: 队首 [0] 队尾
队列: 队首 [0, 1] 队尾
队列: 队首 [0, 1, 2] 队尾
队列: 队首 [0, 1, 2, 3] 队尾
队列: 队首 [0, 1, 2, 3, 4] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5, 6] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5, 6, 7] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5, 6, 7, 8] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] 队尾
队列: 队首 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 队尾
加入完成
-------------
第一次出队
队列: 队首 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] 队尾
第二次出队
队列: 队首 [2, 3, 4, 5, 6, 7, 8, 9, 10] 队尾
出队完成
```

### 循环队列 
#### `用数组循环实现队列结构`

### 链表队列 
#### `用链表实现队列结构`
[链表的实现](https://www.guotzh.com/2017/09/16/数据结构之链表实现/)
```swift

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

```

#### `链表栈的使用`
```swift
var queue = LinkedQueue<Int>()
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

```
#### `输出结果`
```objectivec
开始加入队列
链表队列: 队首 [0] 队尾
链表队列: 队首 [1, 0] 队尾
链表队列: 队首 [2, 1, 0] 队尾
链表队列: 队首 [3, 2, 1, 0] 队尾
链表队列: 队首 [4, 3, 2, 1, 0] 队尾
链表队列: 队首 [5, 4, 3, 2, 1, 0] 队尾
链表队列: 队首 [6, 5, 4, 3, 2, 1, 0] 队尾
链表队列: 队首 [7, 6, 5, 4, 3, 2, 1, 0] 队尾
链表队列: 队首 [8, 7, 6, 5, 4, 3, 2, 1, 0] 队尾
链表队列: 队首 [9, 8, 7, 6, 5, 4, 3, 2, 1, 0] 队尾
链表队列: 队首 [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0] 队尾
加入完成
-------------
第一次出队
链表队列: 队首 [10, 9, 8, 7, 6, 5, 4, 3, 2, 1] 队尾
第二次出队
链表队列: 队首 [10, 9, 8, 7, 6, 5, 4, 3, 2] 队尾
出队完成
Program ended with exit code: 0
```
#### 分析链表队列
```swift
1、加入队列 O(1)
2、移除队列 O(n)
```
#### 链表队列优化
`从尾节点入队列，从首节点出队列`
```swift

class LinkedList2<E>: LinkedList<E> where E:Equatable {
    /// 尾结点
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

```

```swift

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


```


## 链表
### `线性表的链式存储表示的特点是用一组任意的存储单元存储线性表的数据元素（这组存储单元可以是连续的，也可以是不连续的）`

### 链表的结构
```swift
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
```
<!-- more -->
### 链表的实现
```swift
/// E 必须遵守相等协议 Equatable
class LinkedList<E> where E:Equatable {
    
    /// 虚拟头结点
    private var dummyHead:Node<E>
    /// 链表的大小
    private var size:Int
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

```
### 链表的增
```swift
// 在链表的index(0-based)位置添加新的元素e
public  func add(index:Int, e:E) throws -> Void{
    
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
public  func addFirst(e:E) throws -> Void{
    try add(index: 0, e: e);
}

// 在链表末尾添加新的元素e
public  func addLast(e:E) throws -> Void{
    try add(index: size, e: e);
}
```
### 链表的改
```swift
// 修改链表的第index(0-based)个位置的元素为e
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
```
### 链表的查
```swift
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
```
### 链表的删
```swift
// 从链表中删除index(0-based)位置的元素, 返回删除的元素
public  func remove(index:Int) throws -> E?{
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

// 从链表中删除第一个元素, 返回删除的元素
public  func removeFirst() throws -> E?{
    return try remove(index: 0);
}

// 从链表中删除最后一个元素, 返回删除的元素
public  func removeLast() throws -> E?{
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
```
### 链表的使用
```objectivec
var listed = LinkedList<Int>()
print("增")
try listed.addLast(e: 0)
try listed.addFirst(e: 10)
try listed.add(index: 1, e: 12)
try listed.addLast(e: 1)
try listed.addFirst(e: 2)
try listed.add(index: 4, e: 5)
print(listed.description)
print("查")
let first = try listed.getFirst()
let last = try listed.getLast()
let index = try listed.get(index: 2)
print("查询first=====\(first ?? 0)\n查询last=====\(last ?? 0)\n查询index2=====:\(index ?? 0)")
print("查询是否存在数字5===\(listed.contains(e: 5))")
print("删")
try listed.removeLast()
print(listed.description)
try listed.removeFirst()
print(listed.description)
try listed.remove(index: 2)
print(listed.description)
print("改")
try listed.set(index: 1, e: 100)
print(listed.description)
```
```objectivec
增
2->10->12->0->5->1->nil
查
查询first=====2
查询last=====1
查询index2=====:12
查询是否存在数字5===true
删
2->10->12->0->5->nil
10->12->0->5->nil
10->12->5->nil
改
10->100->5->nil
Program ended with exit code: 0
```