//
//  432.allOne.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/16.
//

import Foundation

/*
 432. 全 O(1) 的数据结构
 难度
 困难

 142

 请你设计一个用于存储字符串计数的数据结构，并能够返回计数最小和最大的字符串。

 实现 AllOne 类：

 AllOne() 初始化数据结构的对象。
 inc(String key) 字符串 key 的计数增加 1 。如果数据结构中尚不存在 key ，那么插入计数为 1 的 key 。
 dec(String key) 字符串 key 的计数减少 1 。如果 key 的计数在减少后为 0 ，那么需要将这个 key 从数据结构中删除。测试用例保证：在减少计数前，key 存在于数据结构中。
 getMaxKey() 返回任意一个计数最大的字符串。如果没有元素存在，返回一个空字符串 "" 。
 getMinKey() 返回任意一个计数最小的字符串。如果没有元素存在，返回一个空字符串 "" 。

 示例：

 输入
 ["AllOne", "inc", "inc", "getMaxKey", "getMinKey", "inc", "getMaxKey", "getMinKey"]
 [[], ["hello"], ["hello"], [], [], ["leet"], [], []]
 输出
 [null, null, null, "hello", "hello", null, "hello", "leet"]

 解释
 AllOne allOne = new AllOne();
 allOne.inc("hello");
 allOne.inc("hello");
 allOne.getMaxKey(); // 返回 "hello"
 allOne.getMinKey(); // 返回 "hello"
 allOne.inc("leet");
 allOne.getMaxKey(); // 返回 "hello"
 allOne.getMinKey(); // 返回 "leet"

 提示：

 1 <= key.length <= 10
 key 由小写英文字母组成
 测试用例保证：在每次调用 dec 时，数据结构中总存在 key
 最多调用 inc、dec、getMaxKey 和 getMinKey 方法 5 * 10^4 次
 */

class AllOne {
    class Node<T> {
        var prev: Node<T>?
        var next: Node<T>?
        var val: T?
        var key: String?

        init() {}

        init(_ key: String, _ val: T?) {
            self.key = key
            self.val = val
        }
    }

    private var map: [String: Node<Int>] = [:]
    private var head: Node<Int>
    private var tail: Node<Int>
    init() {
        head = Node()
        tail = Node()

        map = [:]
        head.next = tail
        tail.prev = head
    }

    func inc(_ key: String) {
        if let node = map[key] {
            node.val! += 1
            sortOrder(for: key)
        } else {
            enqueue(key)
        }
    }

    func dec(_ key: String) {
        if let node = map[key] {
            node.val! -= 1
            sortOrder(for: key)
            trimZeroes()
        }
    }

    func getMaxKey() -> String {
        if head.next !== tail {
            return head.next!.key!
        }
        return ""
    }

    func getMinKey() -> String {
        if tail.prev !== head {
            return tail.prev!.key!
        }

        return ""
    }

    fileprivate func enqueue(_ key: String) {
        map[key] = Node<Int>(key, 1)

        if tail.prev === head {
            head.next = map[key]!
            tail.prev = map[key]!
            map[key]!.next = tail
            map[key]!.prev = head
        } else {
            let tailPrev = tail.prev

            tailPrev?.next = map[key]!
            tail.prev = map[key]!
            map[key]!.next = tail
            map[key]!.prev = tailPrev
        }
    }

    fileprivate func trimZeroes() {
        while tail.prev !== head, tail.prev!.val! == 0 {
            let tailPrev = tail.prev
            tailPrev?.prev?.next = tail
            tail.prev = tailPrev?.prev
        }
    }

    fileprivate func sortOrder(for key: String) {
        if let prevVal = map[key]?.prev?.val, let keyVal = map[key]?.val, prevVal < keyVal {
            let prevPrev = map[key]?.prev?.prev
            let next = map[key]?.next

            prevPrev?.next = map[key]
            next?.prev = map[key]?.prev

            map[key]?.prev = prevPrev
            map[key]?.next = next?.prev

            next?.prev?.next = next
            next?.prev?.prev = map[key]

            sortOrder(for: key)
        } else if let nextVal = map[key]?.next?.val, let keyVal = map[key]?.val, nextVal > keyVal {
            let nextNext = map[key]?.next?.next
            let prev = map[key]?.prev

            nextNext?.prev = map[key]
            prev?.next = map[key]?.next

            map[key]?.prev = prev?.next
            map[key]?.next = nextNext

            prev?.next?.prev = prev
            prev?.next?.next = map[key]

            sortOrder(for: key)
        }
    }
}
