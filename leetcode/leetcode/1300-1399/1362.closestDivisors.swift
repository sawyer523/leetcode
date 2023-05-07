//
//  1362.closestDivisors.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/15.
//

import Foundation

/*
 1362. 最接近的因数
 难度
 中等

 19

 给你一个整数 num，请你找出同时满足下面全部要求的两个整数：

 两数乘积等于  num + 1 或 num + 2
 以绝对差进行度量，两数大小最接近
 你可以按任意顺序返回这两个整数。

 示例 1：

 输入：num = 8
 输出：[3,3]
 解释：对于 num + 1 = 9，最接近的两个因数是 3 & 3；对于 num + 2 = 10, 最接近的两个因数是 2 & 5，因此返回 3 & 3 。
 示例 2：

 输入：num = 123
 输出：[5,25]
 示例 3：

 输入：num = 999
 输出：[40,25]

 提示：

 1 <= num <= 10^9
 */

func closestDivisors(_ num: Int) -> [Int] {
    var ans: [Int] = [0, Int(1e9)]

    func divide(_ n: Int) {
        for i in (1 ... Int(sqrt(Double(n)))).reversed() {
            if n % i == 0, abs(n / i - i) < abs(ans[0] - ans[1]) {
                ans[0] = n / i
                ans[1] = i
            }
        }
    }

    divide(num + 1)
    divide(num + 2)
    return ans
}
