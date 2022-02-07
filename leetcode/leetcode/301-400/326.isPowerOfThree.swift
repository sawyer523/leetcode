//
//  326.isPowerOfThree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/9/23.
//

import Foundation

/*
 326. 3的幂
 难度
 简单
 
 187
 
 
 
 
 
 给定一个整数，写一个函数来判断它是否是 3 的幂次方。如果是，返回 true ；否则，返回 false 。
 
 整数 n 是 3 的幂次方需满足：存在整数 x 使得 n == 3x
 
 
 
 示例 1：
 
 输入：n = 27
 输出：true
 示例 2：
 
 输入：n = 0
 输出：false
 示例 3：
 
 输入：n = 9
 输出：true
 示例 4：
 
 输入：n = 45
 输出：false
 
 
 提示：
 
 -2^31 <= n <= 2^31 - 1

 */

func isPowerOfThree(_ n: Int) -> Bool {
    return 0 < n && 1162261467 % n == 0
}
