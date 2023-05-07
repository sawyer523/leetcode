//
//  1801.getNumberOfBacklogOrders.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/2.
//

import Foundation

/*
 1801. 积压订单中的订单总数
 难度
 中等

 67

 给你一个二维整数数组 orders ，其中每个 orders[i] = [pricei, amounti, orderTypei] 表示有 amounti 笔类型为 orderTypei 、价格为 pricei 的订单。

 订单类型 orderTypei 可以分为两种：

 0 表示这是一批采购订单 buy
 1 表示这是一批销售订单 sell
 注意，orders[i] 表示一批共计 amounti 笔的独立订单，这些订单的价格和类型相同。对于所有有效的 i ，由 orders[i] 表示的所有订单提交时间均早于 orders[i+1] 表示的所有订单。

 存在由未执行订单组成的 积压订单 。积压订单最初是空的。提交订单时，会发生以下情况：

 如果该订单是一笔采购订单 buy ，则可以查看积压订单中价格 最低 的销售订单 sell 。如果该销售订单 sell 的价格 低于或等于 当前采购订单 buy 的价格，则匹配并执行这两笔订单，并将销售订单 sell 从积压订单中删除。否则，采购订单 buy 将会添加到积压订单中。
 反之亦然，如果该订单是一笔销售订单 sell ，则可以查看积压订单中价格 最高 的采购订单 buy 。如果该采购订单 buy 的价格 高于或等于 当前销售订单 sell 的价格，则匹配并执行这两笔订单，并将采购订单 buy 从积压订单中删除。否则，销售订单 sell 将会添加到积压订单中。
 输入所有订单后，返回积压订单中的 订单总数 。由于数字可能很大，所以需要返回对 109 + 7 取余的结果。

 示例 1：

 输入：orders = [[10,5,0],[15,2,1],[25,1,1],[30,4,0]]
 输出：6
 解释：输入订单后会发生下述情况：
 - 提交 5 笔采购订单，价格为 10 。没有销售订单，所以这 5 笔订单添加到积压订单中。
 - 提交 2 笔销售订单，价格为 15 。没有采购订单的价格大于或等于 15 ，所以这 2 笔订单添加到积压订单中。
 - 提交 1 笔销售订单，价格为 25 。没有采购订单的价格大于或等于 25 ，所以这 1 笔订单添加到积压订单中。
 - 提交 4 笔采购订单，价格为 30 。前 2 笔采购订单与价格最低（价格为 15）的 2 笔销售订单匹配，从积压订单中删除这 2 笔销售订单。第 3 笔采购订单与价格最低的 1 笔销售订单匹配，销售订单价格为 25 ，从积压订单中删除这 1 笔销售订单。积压订单中不存在更多销售订单，所以第 4 笔采购订单需要添加到积压订单中。
 最终，积压订单中有 5 笔价格为 10 的采购订单，和 1 笔价格为 30 的采购订单。所以积压订单中的订单总数为 6 。
 示例 2：

 输入：orders = [[7,1000000000,1],[15,3,0],[5,999999995,0],[5,1,1]]
 输出：999999984
 解释：输入订单后会发生下述情况：
 - 提交 109 笔销售订单，价格为 7 。没有采购订单，所以这 109 笔订单添加到积压订单中。
 - 提交 3 笔采购订单，价格为 15 。这些采购订单与价格最低（价格为 7 ）的 3 笔销售订单匹配，从积压订单中删除这 3 笔销售订单。
 - 提交 999999995 笔采购订单，价格为 5 。销售订单的最低价为 7 ，所以这 999999995 笔订单添加到积压订单中。
 - 提交 1 笔销售订单，价格为 5 。这笔销售订单与价格最高（价格为 5 ）的 1 笔采购订单匹配，从积压订单中删除这 1 笔采购订单。
 最终，积压订单中有 (1000000000-3) 笔价格为 7 的销售订单，和 (999999995-1) 笔价格为 5 的采购订单。所以积压订单中的订单总数为 1999999991 ，等于 999999984 % (109 + 7) 。

 提示：

 1 <= orders.length <= 10^5
 orders[i].length == 3
 1 <= pricei, amounti <= 10^9
 orderTypei 为 0 或 1
 */

func getNumberOfBacklogOrders(_ orders: [[Int]]) -> Int {
    struct Heap<T> {
        var nodes = [T]()

        private var orderCriteria: (T, T) -> Bool

        public init(sort: @escaping (T, T) -> Bool) { self.orderCriteria = sort }

        public init(array: [T], sort: @escaping (T, T) -> Bool) {
            self.orderCriteria = sort
            configureHeap(from: array)
        }

        private mutating func configureHeap(from array: [T]) {
            nodes = array
            for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
                shiftDown(i)
            }
        }

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

        public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
            for value in sequence {
                insert(value)
            }
        }

        public mutating func replace(index i: Int, value: T) {
            guard i < nodes.count else {
                return
            }
            remove(at: i)
            insert(value)
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

        @discardableResult public mutating func remove(at index: Int) -> T? {
            guard index < nodes.count else {
                return nil
            }
            let size = nodes.count - 1
            if index != size {
                nodes.swapAt(index, size)
                shiftDown(from: index, until: size)
                shiftUp(index)
            }
            return nodes.removeLast()
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

    typealias Order = (Int, Int)
    var buyHeap = Heap<Order>(sort: { $0.0 > $1.0 }), sellHeap = Heap<Order>(sort: { $0.0 < $1.0 })
    for item in orders {
        var order = (item[0], item[1])
        while order.1 > 0 { // amount > 0
            var amount = 0
            switch item[2] {
            case 0: // buy
                if !sellHeap.isEmpty {
                    var minSellOrder = sellHeap.remove()!
                    if minSellOrder.0 <= order.0 {
                        amount = min(order.1, minSellOrder.1)
                        minSellOrder.1 -= amount
                    }
                    if minSellOrder.1 > 0 {
                        sellHeap.insert(minSellOrder)
                    }
                }
            default: // sell
                if !buyHeap.isEmpty {
                    var maxBuyOrder = buyHeap.remove()!
                    if maxBuyOrder.0 >= order.0 {
                        amount = min(order.1, maxBuyOrder.1)
                        maxBuyOrder.1 -= amount
                    }
                    if maxBuyOrder.1 > 0 {
                        buyHeap.insert(maxBuyOrder)
                    }
                }
            }
            if amount > 0 {
                order.1 -= amount
            } else {
                break // while order
            }
        }
        if order.1 > 0 { // amount is still > 0
            switch item[2] {
            case 0: buyHeap.insert(order)
            default: sellHeap.insert(order)
            }
        }
    }
    return (sellHeap.nodes.reduce(into: Int(0)) { $0 += $1.1 } + buyHeap.nodes.reduce(into: Int(0)) { $0 += $1.1 }) % 1_000_000_007
}
