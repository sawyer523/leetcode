//
//  20.isValid.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/7.
//

import Foundation

/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 示例 3：

 输入：s = "(]"
 输出：false

 提示：

 1 <= s.length <= 104
 s 仅由括号 '()[]{}' 组成
 */

func isValid2(_ s: String) -> Bool {
    let m: [Character: Character] = ["}": "{", ")": "(", "]": "["]
    var stack: [Character] = []

    for ch in s {
        if let p = m[ch] {
            if stack.isEmpty || stack.last! != p {
                return false
            }
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }

    return stack.isEmpty
}
