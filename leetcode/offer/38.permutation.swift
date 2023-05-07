//
//  38.permutation.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/22.
//

import Foundation

/*
 剑指 Offer 38. 字符串的排列
 输入一个字符串，打印出该字符串中字符的所有排列。

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]

 限制：

 1 <= s 的长度 <= 8
 */

func permutation(_ s: String) -> [String] {
    var list: Set<String> = []
    var visited = [Bool](repeating: false, count: s.count)
    let s = Array(s)

    func dfs(_ str: String) {
        if str.count == s.count {
            list.insert(str)
            return
        }

        for i in 0 ..< s.count {
            if visited[i] {
                continue
            }
            visited[i] = true
            dfs(str + String(s[i]))
            visited[i] = false
        }
    }
    dfs("")
    return Array(list)
}
