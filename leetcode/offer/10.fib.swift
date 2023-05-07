//
//  10.fib.swift
//  10.fib
//
//  Created by Xiaonan Chen on 2021/9/4.
//

import Foundation

/*
 剑指 Offer 10- I. 斐波那契数列
 难度
 简单

 205

 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项（即 F(N)）。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：1
 示例 2：

 输入：n = 5
 输出：5

 提示：

 0 <= n <= 100
 */

func fib(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    let mod = Int(1e9 + 7)
    var p = 0, q = 0, r = 1
    for _ in 2 ... n {
        p = q
        q = r
        r = (p + q) % mod
    }
    return r
}
