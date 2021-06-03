//
//  706.myHashMap.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/14.
//

import Foundation

/*
 706. 设计哈希映射
 难度
 简单

 140





 不使用任何内建的哈希表库设计一个哈希映射（HashMap）。

 实现 MyHashMap 类：

 MyHashMap() 用空映射初始化对象
 void put(int key, int value) 向 HashMap 插入一个键值对 (key, value) 。如果 key 已经存在于映射中，则更新其对应的值 value 。
 int get(int key) 返回特定的 key 所映射的 value ；如果映射中不包含 key 的映射，返回 -1 。
 void remove(key) 如果映射中存在 key 的映射，则移除 key 和它所对应的 value 。
  

 示例：

 输入：
 ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
 [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
 输出：
 [null, null, null, 1, -1, null, 1, null, -1]

 解释：
 MyHashMap myHashMap = new MyHashMap();
 myHashMap.put(1, 1); // myHashMap 现在为 [[1,1]]
 myHashMap.put(2, 2); // myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.get(1);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.get(3);    // 返回 -1（未找到），myHashMap 现在为 [[1,1], [2,2]]
 myHashMap.put(2, 1); // myHashMap 现在为 [[1,1], [2,1]]（更新已有的值）
 myHashMap.get(2);    // 返回 1 ，myHashMap 现在为 [[1,1], [2,1]]
 myHashMap.remove(2); // 删除键为 2 的数据，myHashMap 现在为 [[1,1]]
 myHashMap.get(2);    // 返回 -1（未找到），myHashMap 现在为 [[1,1]]
  

 提示：

 0 <= key, value <= 106
 最多调用 104 次 put、get 和 remove 方法
  

 进阶：你能否不使用内置的 HashMap 库解决此问题？
 */

class MyHashMap {

//    class LinkedList {
//        var data: (Int, Int)
//        var next: LinkedList?
//
//        init(_ data: (Int, Int)) {
//            self.data = data
//        }
//    }
//
//    private var linkedList: [LinkedList?]
//    private let base = 769
//
//    private func hash(_ key: Int) -> Int {
//        return key % base
//    }
//    /** Initialize your data structure here. */
//    init() {
//        self.linkedList = [LinkedList?](repeating: nil, count: base)
//    }
//
//    /** value will always be non-negative. */
//    func put(_ key: Int, _ value: Int) {
//        let hash = hash(key)
//        var root = self.linkedList[hash]
//        while root?.next != nil {
//                if root?.data.0 == key {
//                    root?.data.1 = value
//                    return
//                }
//                root = root?.next
//            }
//
//
//    }
//
//    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
//    func get(_ key: Int) -> Int {
//
//    }
//
//    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
//    func remove(_ key: Int) {
//
//    }
    var array = [Int]()

    /** Initialize your data structure here. */
    init() {

    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if array.count <= key {
            array += Array(repeating: -1, count: key - array.count + 1)
        }

        array[key] = value
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        guard key < array.count else { return -1 }
        return array[key]
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        guard key < array.count else { return }
        array[key] = -1
    }
}
