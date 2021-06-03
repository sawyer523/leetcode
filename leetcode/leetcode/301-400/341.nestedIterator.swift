//
//  341.nestedIterator.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/23.
//

import Foundation

/*
 341. 扁平化嵌套列表迭代器
 难度
 中等

 231





 给你一个嵌套的整型列表。请你设计一个迭代器，使其能够遍历这个整型列表中的所有整数。

 列表中的每一项或者为一个整数，或者是另一个列表。其中列表的元素也可能是整数或是其他列表。

  

 示例 1:

 输入: [[1,1],2,[1,1]]
 输出: [1,1,2,1,1]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,1,2,1,1]。
 示例 2:

 输入: [1,[4,[6]]]
 输出: [1,4,6]
 解释: 通过重复调用 next 直到 hasNext 返回 false，next 返回的元素的顺序应该是: [1,4,6]。
 */

class NestedIterator {
    /**
     * // This is the interface that allows for creating nested lists.
     * // You should not implement it, or speculate about its implementation
     * class NestedInteger {
     *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
     *     public func isInteger() -> Bool
     *
     *     // Return the single integer that this NestedInteger holds, if it holds a single integer
     *     // The result is undefined if this NestedInteger holds a nested list
     *     public func getInteger() -> Int
     *
     *     // Set this NestedInteger to hold a single integer.
     *     public func setInteger(value: Int)
     *
     *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
     *     public func add(elem: NestedInteger)
     *
     *     // Return the nested list that this NestedInteger holds, if it holds a nested list
     *     // The result is undefined if this NestedInteger holds a single integer
     *     public func getList() -> [NestedInteger]
     * }
     */

    class NestedInteger {
        // Return true if this NestedInteger holds a single integer, rather than a nested list.
        public func isInteger() -> Bool {return false}
        // Return the single integer that this NestedInteger holds, if it holds a single integer
        // The result is undefined if this NestedInteger holds a nested list
        public func getInteger() -> Int {return 0}
        // Set this NestedInteger to hold a single integer.
        public func setInteger(value: Int) {}
        // Set this NestedInteger to hold a nested list and adds a nested integer to it.
        public func add(elem: NestedInteger) {}
        // Return the nested list that this NestedInteger holds, if it holds a nested list
        // The result is undefined if this NestedInteger holds a single integer
        public func getList() -> [NestedInteger] {return []}
    }

    /**
     private var val: [Int] = []
     
     init(_ nestedList: [NestedInteger]) {
         self.dfs(nestedList)
         val.reverse()
     }
     
     func next() -> Int {
         return val.popLast() ?? 0
     }
     
     func hasNext() -> Bool {
         return !val.isEmpty
     }
     
     private func dfs(_ nestedList: [NestedInteger]) {
         for nest in nestedList {
             if nest.isInteger() {
                 val.append(nest.getInteger())
             } else {
                 dfs(nest.getList())
             }
         }
     }
     */

    var stack: [NestedInteger] = []

    init(_ nestedList: [NestedInteger]) {
        self.stack = nestedList.reversed()
    }

    func next() -> Int {
        return self.stack.removeLast().getInteger()
    }

    func hasNext() -> Bool {
        while !stack.isEmpty {
            let nest = stack.last!
            if nest.isInteger() {
                return true
            }
            stack.removeLast()
            stack.append(contentsOf: nest.getList().reversed())
        }
        return false
    }
}
