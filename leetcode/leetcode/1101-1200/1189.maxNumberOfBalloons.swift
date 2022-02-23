//
//  1189.maxNumberOfBalloons.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/13.
//

import Foundation

/*
 1189. “气球” 的最大数量
 难度
 简单
 
 101
 
 
 
 
 
 给你一个字符串 text，你需要使用 text 中的字母来拼凑尽可能多的单词 "balloon"（气球）。
 
 字符串 text 中的每个字母最多只能被使用一次。请你返回最多可以拼凑出多少个单词 "balloon"。
 
 
 
 示例 1：
 
 
 
 输入：text = "nlaebolko"
 输出：1
 示例 2：
 
 
 
 输入：text = "loonbalxballpoon"
 输出：2
 示例 3：
 
 输入：text = "leetcode"
 输出：0
 
 
 提示：
 
 1 <= text.length <= 10^4
 text 全部由小写英文字母组成
 */

func maxNumberOfBalloons(_ text: String) -> Int {
    var cnt = [Int](repeating: 0, count: 5)
    for ch in text {
        switch ch {
        case "b":
            cnt[0] += 1
        case "a":
            cnt[1] += 1
        case "l":
            cnt[2] += 1
        case "o":
            cnt[3] += 1
        case "n":
            cnt[4] += 1
        default:
            break
        }
    }
    
    cnt[2] /= 2
    cnt[3] /= 2
    var ans = cnt[0]
    for i in 1...4 {
        ans = min(ans, cnt[i])
    }
    
    return ans
}
