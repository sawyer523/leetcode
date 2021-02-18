//
//  1190.reverseParentheses.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 1190. 反转每对括号间的子串
 难度
 中等

 59





 给出一个字符串 s（仅含有小写英文字母和括号）。

 请你按照从括号内到外的顺序，逐层反转每对匹配括号中的字符串，并返回最终的结果。

 注意，您的结果中 不应 包含任何括号。

  

 示例 1：

 输入：s = "(abcd)"
 输出："dcba"
 示例 2：

 输入：s = "(u(love)i)"
 输出："iloveu"
 示例 3：

 输入：s = "(ed(et(oc))el)"
 输出："leetcode"
 示例 4：

 输入：s = "a(bcdefghijkl(mno)p)q"
 输出："apmnolkjihgfedcbq"
  

 提示：

 0 <= s.length <= 2000
 s 中只有小写英文字母和括号
 我们确保所有括号都是成对出现的

 */

func reverseParentheses(_ s: String) -> String {
    /*
     * 栈暴力解法
     * 时间复杂度：O(N^2)
     * 空间复杂度O(N)
    var stack: [Int] = []
    var arr = Array(s)
    
    func reverseString(_ start: Int, _ end: Int) {
        var start = start
        var end = end
        while  start < end {
            (arr[start], arr[end]) = (arr[end], arr[start])
            start += 1
            end -= 1
        }
    }
    
    for i in 0 ..< arr.count {
        if arr[i] == "(" {
            stack.append(i+1)
        } else if arr[i] == ")" {
            reverseString(stack.popLast()!, i - 1)
        }
    }
    
    var ans = ""
    for i in arr {
        if i == "(" || i == ")" {
            continue
        }
        ans += String(i)
    }
    
    return ans
     */
   
    /*
     * 神奇指针
     * 时间复杂度: O(N)
     * 空间复杂度: O(N)
     * 遇到括号,➡️变成⬅️, ⬅️变成➡️
     */
    let n = s.count
    var stack: [Int] = []
    var pair = [Int](repeating: 0, count: n)
    let arr = Array(s)
    
    for i in 0..<n {
        if arr[i] == "(" {
            stack.append(i)
        } else if arr[i] == ")" {
            let j = stack.popLast()!
            pair[i] = j
            pair[j] = i
        }
    }
    
    var i = 0
    var d = 1
    var ans = ""
    while i < n {
        if arr[i] == "(" || arr[i] == ")" {
            i = pair[i]
            d = -d
        } else {
            ans += String(arr[i])
        }
        
        i += d
    }
    
    return ans
}
