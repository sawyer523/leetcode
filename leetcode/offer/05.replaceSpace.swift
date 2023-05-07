//
//  05.replaceSpace.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/13.
//

import Foundation

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."

 限制：

 0 <= s 的长度 <= 10000
 */

func replaceSpace(_ s: String) -> String {
    var ans = ""
    for ch in s {
        if ch.isWhitespace {
            ans.append("%20")
        } else {
            ans.append(String(ch))
        }
    }
    return ans
}
