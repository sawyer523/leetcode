//
//  1206.skiplist.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/26.
//

import Foundation

/*
 1206. 设计跳表
 难度
 困难

 142

 不使用任何库函数，设计一个 跳表 。

 跳表 是在 O(log(n)) 时间内完成增加、删除、搜索操作的数据结构。跳表相比于树堆与红黑树，其功能与性能相当，并且跳表的代码长度相较下更短，其设计思想与链表相似。

 例如，一个跳表包含 [30, 40, 50, 60, 70, 90] ，然后增加 80、45 到跳表中，以下图的方式操作：

 Artyom Kalinin [CC BY-SA 3.0], via Wikimedia Commons

 跳表中有很多层，每一层是一个短的链表。在第一层的作用下，增加、删除和搜索操作的时间复杂度不超过 O(n)。跳表的每一个操作的平均时间复杂度是 O(log(n))，空间复杂度是 O(n)。

 了解更多 : https://en.wikipedia.org/wiki/Skip_list

 在本题中，你的设计应该要包含这些函数：

 bool search(int target) : 返回target是否存在于跳表中。
 void add(int num): 插入一个元素到跳表。
 bool erase(int num): 在跳表中删除一个值，如果 num 不存在，直接返回false. 如果存在多个 num ，删除其中任意一个即可。
 注意，跳表中可能存在多个相同的值，你的代码需要处理这种情况。

 示例 1:

 输入
 ["Skiplist", "add", "add", "add", "search", "add", "search", "erase", "erase", "search"]
 [[], [1], [2], [3], [0], [4], [1], [0], [1], [1]]
 输出
 [null, null, null, null, false, null, true, false, true, false]

 解释
 Skiplist skiplist = new Skiplist();
 skiplist.add(1);
 skiplist.add(2);
 skiplist.add(3);
 skiplist.search(0);   // 返回 false
 skiplist.add(4);
 skiplist.search(1);   // 返回 true
 skiplist.erase(0);    // 返回 false，0 不在跳表中
 skiplist.erase(1);    // 返回 true
 skiplist.search(1);   // 返回 false，1 已被擦除

 提示:

 0 <= num, target <= 2 * 10^4
 调用search, add,  erase操作次数不大于 5 * 10^4
 */

// class Skiplist {
//    private let maxLevel = 32
//    private let pFactor = 0.25
//    private var level: Int
//    private var head: SkiplistNode?
//    init() {
//        head = SkiplistNode(val: -1, forward: [SkiplistNode?](repeating: nil, count: maxLevel))
//        level = 0
//    }
//
//    func randomLevel() -> Int {
//        var lv = 1
//        while lv < maxLevel && Double.random(in: 0..<1) < pFactor {
//            lv += 1
//        }
//        return lv
//    }
//
//    func search(_ target: Int) -> Bool {
//        var cur = head
//        for i in stride(from: level - 1, through: 0, by: -1) {
//            while cur?.forward[i] != nil && cur?.forward[i]?.val ?? 0 < target {
//                cur = cur?.forward[i]
//            }
//        }
//        cur = cur?.forward[0]
//        return cur != nil && cur!.val == target
//    }
//
//    func add(_ num: Int) {
//        var update = [SkiplistNode?](repeating: head, count: maxLevel)
//        var cur = head
//
//        for i in stride(from: level - 1, through: 0, by: -1) {
//            while cur?.forward[i] != nil && cur!.val < num {
//                cur = cur?.forward[i]
//            }
//            update[i] = cur
//        }
//
//        let lv = randomLevel()
//        level = max(level, lv)
//        let newNode = SkiplistNode(val: num, forward: [SkiplistNode?](repeating: nil, count: lv))
//        for i in 0..<lv {
//            newNode.forward[i] = update[i]?.forward[i]
//            update[i]?.forward[i] = newNode
//        }
//    }
//
//    func erase(_ num: Int) -> Bool {
//        var update = [SkiplistNode?](repeating: nil, count: maxLevel)
//        var cur = head
//        for i in stride(from: level - 1, through: 0, by: -1) {
//            while cur?.forward[i] != nil && cur?.forward[i]?.val ?? 0 < num {
//                cur = cur?.forward[i]
//            }
//            update[i] = cur
//        }
//
//        cur = cur?.forward[0]
//
//        if cur == nil ||
//            cur!.val != num {
//            return false
//        }
//
//        for i in 0..<level where update[i]?.forward[i] == cur {
//            update[i]?.forward[i] = cur?.forward[i]
//        }
//
//        while 1 < level && head?.forward[level - 1] == nil {
//            level -= 1
//        }
//
//        return true
//    }
// }
//
// fileprivate  class SkiplistNode: Equatable {
//    var val: Int
//    var forward: [SkiplistNode?]
//    init(val: Int, forward: [SkiplistNode?]) {
//        self.val = val
//        self.forward = forward
//    }
//    static func == (lhs: SkiplistNode, rhs: SkiplistNode) -> Bool {
//        return lhs.val == rhs.val && lhs.forward == rhs.forward
//    }
// }

class Skiplist {
    private var count: [Int]
    init() {
        count = [Int](repeating: 0, count: 20005)
    }

    func search(_ target: Int) -> Bool {
        return count[target] > 0
    }

    func add(_ num: Int) {
        count[num] += 1
    }

    func erase(_ num: Int) -> Bool {
        if count[num] == 0 {
            return false
        }
        count[num] -= 1
        return true
    }
}
