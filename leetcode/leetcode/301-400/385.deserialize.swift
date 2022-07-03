//
//  385.deserialize.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/15.
//

import Foundation

/*
 385. 迷你语法分析器
 难度
 中等

 130





 给定一个字符串 s 表示一个整数嵌套列表，实现一个解析它的语法分析器并返回解析的结果 NestedInteger 。

 列表中的每个元素只可能是整数或整数嵌套列表

  

 示例 1：

 输入：s = "324",
 输出：324
 解释：你应该返回一个 NestedInteger 对象，其中只包含整数值 324。
 示例 2：

 输入：s = "[123,[456,[789]]]",
 输出：[123,[456,[789]]]
 解释：返回一个 NestedInteger 对象包含一个有两个元素的嵌套列表：
 1. 一个 integer 包含值 123
 2. 一个包含两个元素的嵌套列表：
     i.  一个 integer 包含值 456
     ii. 一个包含一个元素的嵌套列表
          a. 一个 integer 包含值 789
  

 提示：

 1 <= s.length <= 5 * 10^4
 s 由数字、方括号 "[]"、负号 '-' 、逗号 ','组成
 用例保证 s 是可解析的 NestedInteger
 输入中的所有值的范围是 [-10^6, 10^6]
 */

func deserialize(_ s: String) -> NestedInteger {
    var integerStr = ""
    var stack = [NestedInteger()]
    var lastInteger = stack.first
    
    func transformInteger() -> NestedInteger? {
        guard let val = Int(integerStr) else {
            return nil
        }
        let integer = NestedInteger()
        integer.setInteger(val)
        integerStr = ""
        return integer
    }
    
    s.forEach { c in
        switch c {
        case "[":
            let integer = NestedInteger()
            lastInteger?.add(integer)
            lastInteger = integer
            stack.append(integer)
        case "]":
            if let integer = transformInteger() {
                lastInteger?.add(integer)
            }
            stack.removeLast()
        case "-", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            integerStr.append(c)
        case ",":
            lastInteger = stack.last
            guard let integer = transformInteger() else {
                return
            }
            lastInteger?.add(integer)
        default:
            break
        }
    }
    
    if let integer = transformInteger() {
        lastInteger?.add(integer)
    }
    return stack.first?.getList().first ?? NestedInteger()
}

class NestedInteger {
    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool {
        return true
    }

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int {
        return 0
    }

    // Set this NestedInteger to hold a single integer.
    public func setInteger(_ value: Int) {
        
    }

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(_ elem: NestedInteger) {
        
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] {
        return []
    }
}
