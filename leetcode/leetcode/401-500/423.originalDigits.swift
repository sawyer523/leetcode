//
//  423.originalDigits.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/24.
//

import Foundation

/*
 423. 从英文中重建数字
 难度
 中等
 
 88
 
 
 
 
 
 给你一个字符串 s ，其中包含字母顺序打乱的用英文单词表示的若干数字（0-9）。按 升序 返回原始的数字。
 
 
 
 示例 1：
 
 输入：s = "owoztneoer"
 输出："012"
 示例 2：
 
 输入：s = "fviefuro"
 输出："45"
 
 
 提示：
 
 1 <= s.length <= 10^5
 s[i] 为 ["e","g","f","i","h","o","n","s","r","u","t","w","v","x","z"] 这些字符之一
 s 保证是一个符合题目要求的字符串

 */

func originalDigits(_ s: String) -> String {
    var m: [Character: Int] = [:]
    for char in s {
        m[char, default: 0] += 1
    }
    
    var cnt = [Int](repeating: 0, count: 10)
    cnt[0] = m["z", default: 0]
    cnt[2] = m["w", default: 0]
    cnt[4] = m["u", default: 0]
    cnt[6] = m["x", default: 0]
    cnt[8] = m["g", default: 0]
    
    cnt[3] = m["h", default: 0] - cnt[8]
    cnt[5] = m["f", default: 0] - cnt[4]
    cnt[7] = m["s", default: 0] - cnt[6]
    
    cnt[1] = m["o", default: 0] - cnt[0] - cnt[2] - cnt[4]
    cnt[9] = m["i", default: 0] - cnt[5] - cnt[6] - cnt[8]
    
    var ans = ""
    for i in 0..<10 {
        ans += String(repeating: String(i), count: cnt[i])
    }
    return ans
}
