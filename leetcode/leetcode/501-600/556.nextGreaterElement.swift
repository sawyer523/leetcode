//
//  556.nextGreaterElement.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/6.
//

import Foundation

/*
 556. 下一个更大元素 III
 难度
 中等

 128





 给你一个正整数 n ，请你找出符合条件的最小整数，其由重新排列 n 中存在的每位数字组成，并且其值大于 n 。如果不存在这样的正整数，则返回 -1 。

 注意 ，返回的整数应当是一个 32 位整数 ，如果存在满足题意的答案，但不是 32 位整数 ，同样返回 -1 。

  

 示例 1：

 输入：n = 12
 输出：21
 示例 2：

 输入：n = 21
 输出：-1

 提示：

 1 <= n <= 231 - 1
 */

func nextGreaterElement(_ n: Int) -> Int {
    var digits = Array(n.description)
    
    var i = digits.count - 2
    var j = digits.count - 1
    
    while i >= 0 && digits[i + 1] <= digits[i] {
        i -= 1
    }
    
    if i < 0 { return -1 }
    
    while j >= 0 && digits[j] <= digits[i] {
        j -= 1
    }
    
    digits.swapAt(i, j)
    digits[i+1..<digits.count].sort()
    
    if let result = Int(String(digits)), result <= Int32.max {
        return result
    }
    
    return -1
}
