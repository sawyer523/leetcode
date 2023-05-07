//
//  1705.eatenApples.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/24.
//

import Foundation

/*
 1705. 吃苹果的最大数目
 难度
 中等

 67

 有一棵特殊的苹果树，一连 n 天，每天都可以长出若干个苹果。在第 i 天，树上会长出 apples[i] 个苹果，这些苹果将会在 days[i] 天后（也就是说，第 i + days[i] 天时）腐烂，变得无法食用。也可能有那么几天，树上不会长出新的苹果，此时用 apples[i] == 0 且 days[i] == 0 表示。

 你打算每天 最多 吃一个苹果来保证营养均衡。注意，你可以在这 n 天之后继续吃苹果。

 给你两个长度为 n 的整数数组 days 和 apples ，返回你可以吃掉的苹果的最大数目。

 示例 1：

 输入：apples = [1,2,3,5,2], days = [3,2,1,4,2]
 输出：7
 解释：你可以吃掉 7 个苹果：
 - 第一天，你吃掉第一天长出来的苹果。
 - 第二天，你吃掉一个第二天长出来的苹果。
 - 第三天，你吃掉一个第二天长出来的苹果。过了这一天，第三天长出来的苹果就已经腐烂了。
 - 第四天到第七天，你吃的都是第四天长出来的苹果。
 示例 2：

 输入：apples = [3,0,0,0,0,2], days = [3,0,0,0,0,2]
 输出：5
 解释：你可以吃掉 5 个苹果：
 - 第一天到第三天，你吃的都是第一天长出来的苹果。
 - 第四天和第五天不吃苹果。
 - 第六天和第七天，你吃的都是第六天长出来的苹果。

 提示：

 apples.length == n
 days.length == n
 1 <= n <= 2 * 10^4
 0 <= apples[i], days[i] <= 2 * 10^4
 只有在 apples[i] = 0 时，days[i] = 0 才成立
 */

func eatenApples(_ apples: [Int], _ days: [Int]) -> Int {
    struct Heap<T> {
        var nodes = [T]()
        private var orderCriteria: (T, T) -> Bool

        public init(sort: @escaping (T, T) -> Bool) { self.orderCriteria = sort }

        public var isEmpty: Bool { return nodes.isEmpty }
        public var count: Int { return nodes.count }

        @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int { return (i - 1) / 2 }
        @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int { return 2 * i + 1 }
        @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int { return 2 * i + 2 }

        public func peek() -> T? { return nodes.first }

        public mutating func insert(_ value: T) {
            nodes.append(value)
            shiftUp(nodes.count - 1)
        }

        @discardableResult public mutating func remove() -> T? {
            guard !nodes.isEmpty else {
                return nil
            }
            if nodes.count == 1 {
                return nodes.removeLast()
            } else {
                let value = nodes[0]
                nodes[0] = nodes.removeLast()
                shiftDown(0)
                return value
            }
        }

        internal mutating func shiftUp(_ index: Int) {
            var childIndex = index
            let child = nodes[childIndex]
            var parentIndex = self.parentIndex(ofIndex: childIndex)
            while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
                nodes[childIndex] = nodes[parentIndex]
                childIndex = parentIndex
                parentIndex = self.parentIndex(ofIndex: childIndex)
            }
            nodes[childIndex] = child
        }

        internal mutating func shiftDown(from index: Int, until endIndex: Int) {
            let leftChildIndex = self.leftChildIndex(ofIndex: index)
            let rightChildIndex = leftChildIndex + 1
            var first = index
            if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
                first = leftChildIndex
            }
            if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
                first = rightChildIndex
            }
            if first == index {
                return
            }
            nodes.swapAt(index, first)
            shiftDown(from: first, until: endIndex)
        }

        internal mutating func shiftDown(_ index: Int) { shiftDown(from: index, until: nodes.count) }
    }
    let n = min(apples.count, days.count)
    var result = 0, heap = Heap<(Int, Int)>(sort: { $0.1 < $1.1 }), day = 0
    repeat {
        // grow
        if day < n && apples[day] > 0 {
            heap.insert((apples[day], day + days[day]))
        }
        // eat
        while let (applesCount, rotDay) = heap.remove() {
            if rotDay > day {
                result += 1
                if applesCount > 1 {
                    heap.insert((applesCount - 1, rotDay))
                }
                break
            }
        }
        day += 1
    } while day < n || !heap.isEmpty
    return result
}
