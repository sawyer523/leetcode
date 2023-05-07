//
//  942.diStringMatch.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/9.
//

import Foundation

/*
 942. 增减字符串匹配
 难度
 简单

 287

 收藏

 分享
 切换为英文
 接收动态
 反馈
 由范围 [0,n] 内所有整数组成的 n + 1 个整数的排列序列可以表示为长度为 n 的字符串 s ，其中:

 如果 perm[i] < perm[i + 1] ，那么 s[i] == 'I'
 如果 perm[i] > perm[i + 1] ，那么 s[i] == 'D'
 给定一个字符串 s ，重构排列 perm 并返回它。如果有多个有效排列perm，则返回其中 任何一个 。

 示例 1：

 输入：s = "IDID"
 输出：[0,4,1,3,2]
 示例 2：

 输入：s = "III"
 输出：[0,1,2,3]
 示例 3：

 输入：s = "DDI"
 输出：[3,2,0,1]

 提示：

 1 <= s.length <= 10^5
 s 只包含字符 "I" 或 "D"
 */

func diStringMatch(_ s: String) -> [Int] {
    let n = s.count
    var perm = [Int](repeating: 0, count: n + 1)

    var lo = 0
    var hi = n
    for (i, ch) in s.enumerated() {
        switch ch {
        case "I":
            perm[i] = lo
            lo += 1
        default:
            perm[i] = hi
            hi -= 1
        }
    }
    perm[n] = lo
    return perm
}
