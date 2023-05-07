//
//  793.preimageSizeFZF.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/28.
//

import Foundation

/*
 793. 阶乘函数后 K 个零
 难度
 困难

 122

  f(x) 是 x! 末尾是 0 的数量。回想一下 x! = 1 * 2 * 3 * ... * x，且 0! = 1 。

 例如， f(3) = 0 ，因为 3! = 6 的末尾没有 0 ；而 f(11) = 2 ，因为 11!= 39916800 末端有 2 个 0 。
 给定 k，找出返回能满足 f(x) = k 的非负整数 x 的数量。

 示例 1：

 输入：k = 0
 输出：5
 解释：0!, 1!, 2!, 3!, 和 4! 均符合 k = 0 的条件。
 示例 2：

 输入：k = 5
 输出：0
 解释：没有匹配到这样的 x!，符合 k = 5 的条件。
 示例 3:

 输入: k = 3
 输出: 5

 提示:

 0 <= k <= 10^9
 */

func preimageSizeFZF(_ k: Int) -> Int {
    func zeta(_ n: Int) -> Int {
        var n = n
        var res = 0
        while n > 0 {
            n /= 5
            res += n
        }
        return res
    }

    func nx(_ k: Int) -> Int {
        var l = 0
        var r = 5 * k
        while l <= r {
            let mid = (l + r) >> 1
            if zeta(mid) < k {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r + 1
    }

    return nx(k + 1) - nx(k)
}
