//
//  395.longestSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/27.
//

import Foundation

/*
 395. 至少有 K 个重复字符的最长子串
 难度
 中等

 366





 给你一个字符串 s 和一个整数 k ，请你找出 s 中的最长子串， 要求该子串中的每一字符出现次数都不少于 k 。返回这一子串的长度。

  

 示例 1：

 输入：s = "aaabb", k = 3
 输出：3
 解释：最长子串为 "aaa" ，其中 'a' 重复了 3 次。
 示例 2：

 输入：s = "ababbc", k = 2
 输出：5
 解释：最长子串为 "ababb" ，其中 'a' 重复了 2 次， 'b' 重复了 3 次。
  

 提示：

 1 <= s.length <= 104
 s 仅由小写英文字母组成
 1 <= k <= 105

 */

func longestSubstring(_ s: String, _ k: Int) -> Int {
//    if s.count == 0 {
//        return 0
//    }
//
//    var cnt = [Int](repeating: 0, count: 26)
//    let baseAscii = Character("a").asciiValue!
//    for char in s {
//        cnt[Int(char.asciiValue! - baseAscii)] += 1
//    }
//
//    var split = 0
//    for (i, v) in cnt.enumerated() {
//        if 0 < v && v < k {
//            split = Int(baseAscii) + i
//            break
//        }
//    }
//    if split == 0 {
//        return s.count
//    }
//
//    var len = 0
//    for subStr in s.split(separator: Character(UnicodeScalar(split)!)) {
//        len = max(len, longestSubstring(String(subStr), k))
//    }
//
//    return len
    
    let baseAscii = Character("a").asciiValue!
    let arr = Array(s)
    var ans = 0
    for t in 1...26 {
        var cnt = [Int](repeating: 0, count: 26)
        var total = 0
        var lessK = 0
        var l = 0
        for (r, ch) in s.enumerated() {
            let ascii = Int(ch.asciiValue! - baseAscii)
            if cnt[ascii] == 0 {
                total += 1
                lessK += 1
            }
            
            cnt[ascii] += 1
            if cnt[ascii] == k {
                lessK -= 1
            }
            
            while t < total  {
                let ascii = Int(arr[l].asciiValue! - baseAscii)
                if cnt[ascii] == k {
                    lessK += 1
                }
                cnt[ascii] -= 1
                if cnt[ascii] == 0 {
                    total -= 1
                    lessK -= 1
                }
                l += 1
            }
            if lessK == 0 {
                ans = max(ans, r - l + 1)
            }
        }
    }
    
    return ans
}
