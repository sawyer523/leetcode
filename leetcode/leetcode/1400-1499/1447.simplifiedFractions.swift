//
//  1447.simplifiedFractions.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/10.
//

import Foundation

/*
 1447. 最简分数
 难度
 中等

 29

 给你一个整数 n ，请你返回所有 0 到 1 之间（不包括 0 和 1）满足分母小于等于  n 的 最简 分数 。分数可以以 任意 顺序返回。

 示例 1：

 输入：n = 2
 输出：["1/2"]
 解释："1/2" 是唯一一个分母小于等于 2 的最简分数。
 示例 2：

 输入：n = 3
 输出：["1/2","1/3","2/3"]
 示例 3：

 输入：n = 4
 输出：["1/2","1/3","1/4","2/3","3/4"]
 解释："2/4" 不是最简分数，因为它可以化简为 "1/2" 。
 示例 4：

 输入：n = 1
 输出：[]

 提示：

 1 <= n <= 100

 */

func simplifiedFractions(_ n: Int) -> [String] {
    if n < 2 {
        return []
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while a != 0 {
            (a, b) = (b % a, a)
        }
        return b
    }

    var ans: [String] = []
    for denominator in 2 ... n {
        for numerator in 1 ..< denominator {
            if gcd(numerator, denominator) == 1 {
                ans.append(String(format: "%d/%d", numerator, denominator))
            }
        }
    }

    return ans
}
