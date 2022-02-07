//
//  50.myPow.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/8.
//

import Foundation

/*
 50. Pow(x, n)
 难度
 中等
 
 683
 
 
 
 
 
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。
 
 
 
 示例 1：
 
 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：
 
 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：
 
 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2-2 = 1/22 = 1/4 = 0.25
 
 
 提示：
 
 -100.0 < x < 100.0
 -231 <= n <= 231-1
 -104 <= xn <= 104
 */

func myPow2(_ x: Double, _ n: Int) -> Double {
    var xx = x
    var nn = n
    if nn < 0 {
        xx = 1/x
        nn = -n
    }
    
    var pow = 1.0
    
    while nn != 0 {
        if ((nn & 1) != 0) {
            pow *= xx
        }
        
        xx *= xx
        
        nn = nn>>1
    }
    
    return Double(pow)
}
