//
//  869.reorderedPowerOf2.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/28.
//

import Foundation

/*
 869. 重新排序得到 2 的幂
 难度
 中等
 
 62
 
 
 
 
 
 给定正整数 N ，我们按任何顺序（包括原始顺序）将数字重新排序，注意其前导数字不能为零。
 
 如果我们可以通过上述方式得到 2 的幂，返回 true；否则，返回 false。
 
 
 
 示例 1：
 
 输入：1
 输出：true
 示例 2：
 
 输入：10
 输出：false
 示例 3：
 
 输入：16
 输出：true
 示例 4：
 
 输入：24
 输出：false
 示例 5：
 
 输入：46
 输出：true
 
 
 提示：
 
 1 <= N <= 10^9
 */


func reorderedPowerOf2(_ n: Int) -> Bool {
    func countDigits(_ n: Int) -> [Int] {
        var cnt = [Int](repeating: 0, count: 10)
        var n = n
        while 0 < n {
            cnt[n%10] += 1
            n /= 10
        }
        return cnt
    }
    
    var powerOf2Digits: [[Int]: Bool] = [:]
    var i = 1
    while i < Int(1e9) {
        powerOf2Digits[countDigits(i)] = true
        i <<= 1
    }
    
    return powerOf2Digits[countDigits(n)] == nil ? false : true
}

