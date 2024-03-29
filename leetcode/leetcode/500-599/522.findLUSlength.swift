//
//  522.findLUSlength.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/25.
//

import Foundation

/*
 522. 最长特殊序列 II
 难度
 中等

 54

 给定字符串列表，你需要从它们中找出最长的特殊序列。最长特殊序列定义如下：该序列为某字符串独有的最长子序列（即不能是其他字符串的子序列）。

 子序列可以通过删去字符串中的某些字符实现，但不能改变剩余字符的相对顺序。空序列为所有字符串的子序列，任何字符串为其自身的子序列。

 输入将是一个字符串列表，输出是最长特殊序列的长度。如果最长特殊序列不存在，返回 -1 。

 示例：

 输入: "aba", "cdc", "eae"
 输出: 3

 提示：

 所有给定的字符串长度不会超过 10 。
 给定字符串列表的长度将在 [2, 50 ] 之间。

 */

func findLUSlength(_ strs: [String]) -> Int {
    var m: [String: [Character]] = [:]
    func isSub(_ a: String, _ b: String) -> Bool {
        if a == b {
            return true
        }
        var j = 0
        var i = 0
        let arrA = m[a]
        let arrB = m[b]
        while i < b.count && j < a.count {
            if arrA![j] == arrB![i] {
                j += 1
            }
            i += 1
        }

        return j == a.count
    }

    for i in strs {
        m[i] = Array(i)
    }
    var ans = -1
    for i in 0 ..< strs.count {
        var end = true
        for j in 0 ..< strs.count {
            if i == j {
                continue
            }

            if isSub(strs[i], strs[j]) {
                end = false
                break
            }
        }
        if end {
            ans = max(ans, strs[i].count)
        }
    }

    return ans
}
