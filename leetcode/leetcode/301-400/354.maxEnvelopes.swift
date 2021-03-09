//
//  354.maxEnvelopes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/4.
//

import Foundation

/*
 354. 俄罗斯套娃信封问题
 难度
 困难
 
 336
 
 
 
 
 
 给定一些标记了宽度和高度的信封，宽度和高度以整数对形式 (w, h) 出现。当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。
 
 请计算最多能有多少个信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。
 
 说明:
 不允许旋转信封。
 
 示例:
 
 输入: envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出: 3
 解释: 最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
 
 */


func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    if envelopes.isEmpty {
        return 0
    }
    
    let env = envelopes.sorted { a, b in
        return a[0] < b[0] || a[0] == b[0] && b[1] < a[1]
    }
    
    var dp = [Int](repeating: 0, count: env.count)
    var res = 0
    for e in env {
        var start = 0
        var end = res - 1
        while start <= end {
            let mid = (start + end) / 2
            if dp[mid] < e[1] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        dp[start] = e[1]
        if res == start {
            res += 1
        }
    }
    
    return res
}
