//
//  622.myCircularQueue.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/2.
//

import Foundation

// MARK: - MyCircularQueue

/*
 622. 设计循环队列
 难度
 中等

 309

 设计你的循环队列实现。 循环队列是一种线性数据结构，其操作表现基于 FIFO（先进先出）原则并且队尾被连接在队首之后以形成一个循环。它也被称为“环形缓冲器”。

 循环队列的一个好处是我们可以利用这个队列之前用过的空间。在一个普通队列里，一旦一个队列满了，我们就不能插入下一个元素，即使在队列前面仍有空间。但是使用循环队列，我们能使用这些空间去存储新的值。

 你的实现应该支持如下操作：

 MyCircularQueue(k): 构造器，设置队列长度为 k 。
 Front: 从队首获取元素。如果队列为空，返回 -1 。
 Rear: 获取队尾元素。如果队列为空，返回 -1 。
 enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
 deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
 isEmpty(): 检查循环队列是否为空。
 isFull(): 检查循环队列是否已满。

 示例：

 MyCircularQueue circularQueue = new MyCircularQueue(3); // 设置长度为 3
 circularQueue.enQueue(1);  // 返回 true
 circularQueue.enQueue(2);  // 返回 true
 circularQueue.enQueue(3);  // 返回 true
 circularQueue.enQueue(4);  // 返回 false，队列已满
 circularQueue.Rear();  // 返回 3
 circularQueue.isFull();  // 返回 true
 circularQueue.deQueue();  // 返回 true
 circularQueue.enQueue(4);  // 返回 true
 circularQueue.Rear();  // 返回 4

 提示：

 所有的值都在 0 至 1000 的范围内；
 操作数将在 1 至 1000 的范围内；
 请不要使用内置的队列库。
 */

class MyCircularQueue {
    private var front: Int
    private var rear: Int
    private var elems: [Int]
    init(_ k: Int) {
        front = 0
        rear = 0
        elems = [Int](repeating: 0, count: k + 1)
    }

    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        elems[rear] = value
        rear = (rear + 1) % elems.count
        return true
    }

    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        front = (front + 1) % elems.count
        return true
    }

    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        return elems[front]
    }

    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        return elems[(rear - 1 + elems.count) % elems.count]
    }

    func isEmpty() -> Bool {
        return front == rear
    }

    func isFull() -> Bool {
        return (rear + 1) % elems.count == front
    }
}

// MARK: - MyCircularQueue2

class MyCircularQueue2 {
    class ListNode {
        var val: Int
        var next: ListNode?
        init() { val = 0; next = nil }
        init(_ val: Int) { self.val = val; next = nil }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
    }

    private var head: ListNode?
    private var tail: ListNode?
    private var cap: Int
    private var size: Int

    init(_ k: Int) {
        cap = k
        size = 0
    }

    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let node = ListNode(value)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        size += 1
        return true
    }

    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        head = head?.next
        size -= 1
        return true
    }

    func Front() -> Int {
        if isEmpty() {
            return -1
        }
        return head!.val
    }

    func Rear() -> Int {
        if isEmpty() {
            return -1
        }
        return tail!.val
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    func isFull() -> Bool {
        return size == cap
    }
}
