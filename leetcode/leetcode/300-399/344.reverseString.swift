//
//  344.reverseString.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/1.
//

import Foundation

/*
 344. 反转字符串
 难度
 简单

 336

 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。

 示例 1：

 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 示例 2：

 输入：["H","a","n","n","a","h"]
 输出：["h","a","n","n","a","H"]
 */

func reverseString(_ s: inout [Character]) {
    var start = 0
    var end = s.count - 1
    while start < end {
        (s[start], s[end]) = (s[end], s[start])
        start += 1
        end -= 1
    }
}
