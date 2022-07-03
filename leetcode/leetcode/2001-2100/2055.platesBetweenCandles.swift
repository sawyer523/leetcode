//
//  2055.platesBetweenCandles.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/8.
//

import Foundation

/*
 2055. 蜡烛之间的盘子
 难度
 中等
 
 34
 
 
 
 
 
 给你一个长桌子，桌子上盘子和蜡烛排成一列。给你一个下标从 0 开始的字符串 s ，它只包含字符 '*' 和 '|' ，其中 '*' 表示一个 盘子 ，'|' 表示一支 蜡烛 。
 
 同时给你一个下标从 0 开始的二维整数数组 queries ，其中 queries[i] = [lefti, righti] 表示 子字符串 s[lefti...righti] （包含左右端点的字符）。对于每个查询，你需要找到 子字符串中 在 两支蜡烛之间 的盘子的 数目 。如果一个盘子在 子字符串中 左边和右边 都 至少有一支蜡烛，那么这个盘子满足在 两支蜡烛之间 。
 
 比方说，s = "||**||**|*" ，查询 [3, 8] ，表示的是子字符串 "*||**|" 。子字符串中在两支蜡烛之间的盘子数目为 2 ，子字符串中右边两个盘子在它们左边和右边 都 至少有一支蜡烛。
 请你返回一个整数数组 answer ，其中 answer[i] 是第 i 个查询的答案。
 
 
 
 示例 1:
 
 ex-1
 
 输入：s = "**|**|***|", queries = [[2,5],[5,9]]
 输出：[2,3]
 解释：
 - queries[0] 有两个盘子在蜡烛之间。
 - queries[1] 有三个盘子在蜡烛之间。
 示例 2:
 
 ex-2
 
 输入：s = "***|**|*****|**||**|*", queries = [[1,17],[4,5],[14,17],[5,11],[15,16]]
 输出：[9,0,0,0,0]
 解释：
 - queries[0] 有 9 个盘子在蜡烛之间。
 - 另一个查询没有盘子在蜡烛之间。
 
 
 提示：
 
 3 <= s.length <= 10^5
 s 只包含字符 '*' 和 '|' 。
 1 <= queries.length <= 10^5
 queries[i].length == 2
 0 <= lefti <= righti < s.length
 */

func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
    let n = s.count
    var preSum = [Int](repeating: 0, count: n)
    var left = [Int](repeating: 0, count: n)
    var sum = 0
    var l = -1
    for i in 0..<n {
        switch s[i] {
        case "*":
            sum += 1
        default:
            l = i
        }
        preSum[i] = sum
        left[i] = l
    }
    
    var right = [Int](repeating: 0, count: n)
    var r = -1
    for i in stride(from: n-1, through: 0, by: -1) {
        if s[i] == "|" {
            r = i
        }
        right[i] = r
    }
    
    var ans = [Int](repeating: 0, count: queries.count)
    for i in 0..<queries.count {
        let x = right[queries[i][0]]
        let y = left[queries[i][1]]
        if 0 <= x &&
            0 <= y &&
            x < y {
            ans[i] = preSum[y] - preSum[x]
        }
    }
    
    return ans
}
