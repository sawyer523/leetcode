//
//  541.reverseStr.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/1.
//

import Foundation

/*
 541. 反转字符串 II
 难度
 简单

 108





 给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。

 如果剩余字符少于 k 个，则将剩余字符全部反转。
 如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
  

 示例:

 输入: s = "abcdefg", k = 2
 输出: "bacdfeg"
  

 提示：

 该字符串只包含小写英文字母。
 给定字符串的长度和 k 在 [1, 10000] 范围内。
 */

func reverseStr(_ s: String, _ k: Int) -> String {
        var arr = Array(s)
        var start = 0
        var end = k-1
        var i = 0
        while i < arr.count {
            start = i
            end = i + k - 1 > arr.count - 1 ? arr.count - 1 : i+k-1
            while start < end {
                (arr[start], arr[end]) = (arr[end], arr[start])
                start += 1
                end -= 1
            }
            i += k*2
        }
        return String(arr)
}
