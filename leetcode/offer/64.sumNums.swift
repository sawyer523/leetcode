//
//  64.sumNums.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/29.
//

import Foundation

/*
 剑指 Offer 64. 求1+2+…+n
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。

 示例 1：

 输入: n = 3
 输出: 6
 示例 2：

 输入: n = 9
 输出: 45

 限制：

 1 <= n <= 10000
 */

func sumNums(_ n: Int) -> Int {
    var ans = 0

    @discardableResult
    func sum(_ n: Int) -> Bool {
        ans += n
        return 0 < n && sum(n - 1)
    }
    sum(n)
    return ans
}
