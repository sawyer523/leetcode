//
//  279.numSquares.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/11.
//

import Foundation

/*
 279. 完全平方数
 难度
 中等
 
 920
 
 
 
 
 
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 
 给你一个整数 n ，返回和为 n 的完全平方数的 最少数量 。
 
 完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。
 
 
 
 示例 1：
 
 输入：n = 12
 输出：3
 解释：12 = 4 + 4 + 4
 示例 2：
 
 输入：n = 13
 输出：2
 解释：13 = 4 + 9
 
 提示：
 
 1 <= n <= 104
 */

func numSquares(_ n: Int) -> Int {
//    func isPerfectSquare(_ x: Int) -> Bool {
//        let y = Int(sqrt(Double(x)))
//        return y*y == x
//    }
//
//    func checkAnswer4(_ x: Int) -> Bool {
//        var x = x
//        while x%4 == 0 {
//            x /= 4
//        }
//        return x%8 == 7
//    }
//
//    if isPerfectSquare(n) {
//        return 1
//    }
//
//    if checkAnswer4(n) {
//        return 4
//    }
//
//    var i = 1
//    while i*i < n {
//        let j = n - i*i
//        if isPerfectSquare(j) {
//            return 2
//        }
//        i += 1
//    }
//
//    return 3
    var dp = [Int](repeating: 0, count: n+1)
    for i in 1...n {
        var minn = Int.max
        var j = 1
        while j * j <= i {
            minn = min(minn, dp[i-j*j])
            j += 1
        }
        dp[i] = minn + 1
    }
    return dp[n]
}
