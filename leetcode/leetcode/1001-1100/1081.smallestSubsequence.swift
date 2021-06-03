//
//  1081.smallestSubsequence.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/20.
//

import Foundation

/*
 1081. 不同字符的最小子序列
 难度
 中等

 67





 返回字符串 text 中按字典序排列最小的子序列，该子序列包含 text 中所有不同字符一次。

  

 示例 1：

 输入："cdadabcc"
 输出："adbc"
 示例 2：

 输入："abcd"
 输出："abcd"
 示例 3：

 输入："ecbacba"
 输出："eacb"
 示例 4：

 输入："leetcode"
 输出："letcod"
  

 提示：

 1 <= text.length <= 1000
 text 由小写英文字母组成
 */

func smallestSubsequence(_ s: String) -> String {
    let aAscii = Int(("a" as Character).asciiValue!)
    var stack: [Character] = []
    var inStack: [Bool] = Array(repeating: false, count: 26)
    var left: [Int] = Array(repeating: 0, count: 26)

    for (i, c) in s.enumerated() {
        left[Int(c.asciiValue!) - aAscii] = i
    }

    for (i, c) in s.enumerated() {
        if inStack[Int(c.asciiValue!) - aAscii] == true {
            continue
        }

        while let last = stack.last, c < last && i < left[Int(last.asciiValue!) - aAscii] {
            inStack[Int(stack.popLast()!.asciiValue!) - aAscii] = false
        }
        inStack[Int(c.asciiValue!) - aAscii] = true
        stack.append(c)
    }

    return String(stack)
}
