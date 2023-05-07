//
//  641.myCircularDeque.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/15.
//

import Foundation

/*
 641. 设计循环双端队列
 难度
 中等

 139

 设计实现双端队列。

 实现 MyCircularDeque 类:

 MyCircularDeque(int k) ：构造函数,双端队列最大为 k 。
 boolean insertFront()：将一个元素添加到双端队列头部。 如果操作成功返回 true ，否则返回 false 。
 boolean insertLast() ：将一个元素添加到双端队列尾部。如果操作成功返回 true ，否则返回 false 。
 boolean deleteFront() ：从双端队列头部删除一个元素。 如果操作成功返回 true ，否则返回 false 。
 boolean deleteLast() ：从双端队列尾部删除一个元素。如果操作成功返回 true ，否则返回 false 。
 int getFront() )：从双端队列头部获得一个元素。如果双端队列为空，返回 -1 。
 int getRear() ：获得双端队列的最后一个元素。 如果双端队列为空，返回 -1 。
 boolean isEmpty() ：若双端队列为空，则返回 true ，否则返回 false  。
 boolean isFull() ：若双端队列满了，则返回 true ，否则返回 false 。

 示例 1：

 输入
 ["MyCircularDeque", "insertLast", "insertLast", "insertFront", "insertFront", "getRear", "isFull", "deleteLast", "insertFront", "getFront"]
 [[3], [1], [2], [3], [4], [], [], [], [4], []]
 输出
 [null, true, true, true, false, 2, true, true, true, 4]

 解释
 MyCircularDeque circularDeque = new MycircularDeque(3); // 设置容量大小为3
 circularDeque.insertLast(1);                    // 返回 true
 circularDeque.insertLast(2);                    // 返回 true
 circularDeque.insertFront(3);                    // 返回 true
 circularDeque.insertFront(4);                    // 已经满了，返回 false
 circularDeque.getRear();                  // 返回 2
 circularDeque.isFull();                        // 返回 true
 circularDeque.deleteLast();                    // 返回 true
 circularDeque.insertFront(4);                    // 返回 true
 circularDeque.getFront();                // 返回 4

 提示：

 1 <= k <= 1000
 0 <= value <= 1000
 insertFront, insertLast, deleteFront, deleteLast, getFront, getRear, isEmpty, isFull  调用次数不大于 2000 次
 */

class MyCircularDeque {
    private var arr: [Int]
    private let size: Int
    private var front = 0
    private var rear = 0

    init(_ k: Int) {
        arr = [Int](repeating: 0, count: k + 1)
        size = k + 1
    }

    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        front = (front - 1 + size) % size
        arr[front] = value
        return true
    }

    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        arr[rear] = value
        rear = (rear + 1) % size
        return true
    }

    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        front = (front + 1) % size
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        rear = (rear - 1 + size) % size
        return true
    }

    func getFront() -> Int {
        return isEmpty() ? -1 : arr[front]
    }

    func getRear() -> Int {
        return isEmpty() ? -1 : arr[(rear - 1 + size) % size]
    }

    func isEmpty() -> Bool {
        return front == rear
    }

    func isFull() -> Bool {
        return (rear + 1) % size == front
    }
}
