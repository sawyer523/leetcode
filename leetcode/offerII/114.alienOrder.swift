//
//  114.alienOrder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/31.
//

import Foundation

/*
 剑指 Offer II 114. 外星文字典
 难度
 困难

 39

 现有一种使用英语字母的外星文语言，这门语言的字母顺序与英语顺序不同。

 给定一个字符串列表 words ，作为这门语言的词典，words 中的字符串已经 按这门新语言的字母顺序进行了排序 。

 请你根据该词典还原出此语言中已知的字母顺序，并 按字母递增顺序 排列。若不存在合法字母顺序，返回 "" 。若存在多种可能的合法字母顺序，返回其中 任意一种 顺序即可。

 字符串 s 字典顺序小于 字符串 t 有两种情况：

 在第一个不同字母处，如果 s 中的字母在这门外星语言的字母顺序中位于 t 中字母之前，那么 s 的字典顺序小于 t 。
 如果前面 min(s.length, t.length) 字母都相同，那么 s.length < t.length 时，s 的字典顺序也小于 t 。

 示例 1：

 输入：words = ["wrt","wrf","er","ett","rftt"]
 输出："wertf"
 示例 2：

 输入：words = ["z","x"]
 输出："zx"
 示例 3：

 输入：words = ["z","x","z"]
 输出：""
 解释：不存在合法字母顺序，因此返回 "" 。

 提示：

 1 <= words.length <= 100
 1 <= words[i].length <= 100
 words[i] 仅由小写英文字母组成
 */

func alienOrder(_ words: [String]) -> String {
    var g: [Character: [Character]] = [:]
    for c in words[0] {
        g[c] = []
    }
next:
        for i in 1 ..< words.count {
        let s = words[i - 1]
        let t = words[i]
        for c in t {
            g[c] = g[c, default: []]
        }

        for (u, v) in zip(s, t) {
            if u != v {
                g[u, default: []].append(v)
                continue next
            }
        }

        if t.count < s.count {
            return ""
        }
    }

    let visiting = 1
    let visited = 2
    var i = g.count - 1
    var state: [Character: Int] = [:]
    var order = [Character](repeating: " ", count: g.count)

    func dfs(_ u: Character) -> Bool {
        state[u] = visiting
        for v in g[u]! {
            if state[u, default: 0] == 0 {
                if !dfs(v) {
                    return false
                } else if state[v] == visiting {
                    return false
                }
            }
        }

        order[i] = u
        i -= 1
        state[u] = visited
        return true
    }

    for k in g.keys {
        if state[k, default: 0] == 0 && !dfs(k) {
            return ""
        }
    }
    return String(order.reversed())
}
