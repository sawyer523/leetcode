//
//  705.myHashSet.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 705. 设计哈希集合
 难度
 简单

 76





 不使用任何内建的哈希表库设计一个哈希集合

 具体地说，你的设计应该包含以下的功能

 add(value)：向哈希集合中插入一个值。
 contains(value) ：返回哈希集合中是否存在这个值。
 remove(value)：将给定值从哈希集合中删除。如果哈希集合中没有这个值，什么也不做。

 示例:

 MyHashSet hashSet = new MyHashSet();
 hashSet.add(1);
 hashSet.add(2);
 hashSet.contains(1);    // 返回 true
 hashSet.contains(3);    // 返回 false (未找到)
 hashSet.add(2);
 hashSet.contains(2);    // 返回 true
 hashSet.remove(2);
 hashSet.contains(2);    // 返回  false (已经被删除)

 注意：

 所有的值都在 [0, 1000000]的范围内。
 操作的总数目在[1, 10000]范围内。
 不要使用内建的哈希集合库。
 */

class MyHashSet {

//    private var myHash: [Int]
//    /** Initialize your data structure here. */
//    init() {
//        self.myHash = [Int](repeating: 0, count: 1000000 >> 5)
//    }
//
//    func add(_ key: Int) {
//        myHash[key>>5] |= 1<<(key&31)
//    }
//
//    func remove(_ key: Int) {
//        myHash[key>>5] &= ~(1<<(key&31))
//    }
//
//    /** Returns true if this set contains the specified element */
//    func contains(_ key: Int) -> Bool {
//        return  ((myHash[key>>5] & (1<<(key&31))) != 0)
//    }

    private var myHash: Set<Int>
    /** Initialize your data structure here. */
    init() {
        self.myHash = []
    }

    func add(_ key: Int) {
        myHash.insert(key)
    }

    func remove(_ key: Int) {
        self.myHash.remove(key)
    }

    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return  self.myHash.contains(key)
    }
}
