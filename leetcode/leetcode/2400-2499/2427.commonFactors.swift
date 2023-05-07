//
//  2427.commonFactors.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/5.
//

import Foundation

/*
 2427. 公因子的数目
 给你两个正整数 a 和 b ，返回 a 和 b 的 公 因子的数目。

 如果 x 可以同时整除 a 和 b ，则认为 x 是 a 和 b 的一个 公因子 。

 示例 1：

 输入：a = 12, b = 6
 输出：4
 解释：12 和 6 的公因子是 1、2、3、6 。
 示例 2：

 输入：a = 25, b = 30
 输出：2
 解释：25 和 30 的公因子是 1、5 。

 提示：

 1 <= a, b <= 1000
 */

func commonFactors(_ a: Int, _ b: Int) -> Int {
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while a != 0 {
            (a, b) = (b % a, a)
        }
        return b
    }

    let g = gcd(a, b)
    var ans = 0
    for i in 1 ... g where i * i <= g {
        if g % i == 0 {
            ans += 1
            if i * i < g {
                ans += 1
            }
        }
    }

    return ans
}
