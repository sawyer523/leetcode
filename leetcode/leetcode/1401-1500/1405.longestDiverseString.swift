//
//  1405.longestDiverseString.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/7.
//

import Foundation

/*
 1405. 最长快乐字符串
 难度
 中等
 
 72
 
 
 
 
 
 如果字符串中不含有任何 'aaa'，'bbb' 或 'ccc' 这样的字符串作为子串，那么该字符串就是一个「快乐字符串」。
 
 给你三个整数 a，b ，c，请你返回 任意一个 满足下列全部条件的字符串 s：
 
 s 是一个尽可能长的快乐字符串。
 s 中 最多 有a 个字母 'a'、b 个字母 'b'、c 个字母 'c' 。
 s 中只含有 'a'、'b' 、'c' 三种字母。
 如果不存在这样的字符串 s ，请返回一个空字符串 ""。
 
 
 
 示例 1：
 
 输入：a = 1, b = 1, c = 7
 输出："ccaccbcc"
 解释："ccbccacc" 也是一种正确答案。
 示例 2：
 
 输入：a = 2, b = 2, c = 1
 输出："aabbc"
 示例 3：
 
 输入：a = 7, b = 1, c = 0
 输出："aabaa"
 解释：这是该测试用例的唯一正确答案。
 
 
 提示：
 
 0 <= a, b, c <= 100
 a + b + c > 0
 */

func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    var cnt = [(a, "a"), (b, "b"), (c, "c")]
    var ans: [String] = []
    while true {
        cnt.sort(by: {return $1.0 < $0.0 })
        var hasNext = false
        for i in cnt.indices {
            if cnt[i].0 <= 0 {
                break
            }
            
            let m = ans.count
            if 2 <= m && ans[m-2] == cnt[i].1 && ans[m-1] == cnt[i].1 {
                continue
            }
            
            hasNext = true
            ans.append(cnt[i].1)
            cnt[i].0 -= 1
            break
        }
        
        if !hasNext {
            return ans.joined()
        }
    }
}
