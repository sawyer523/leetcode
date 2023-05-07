//
//  2180.countEven.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/6.
//

import Foundation

/*
 2180. 统计各位数字之和为偶数的整数个数
 难度
 简单

 19

 给你一个正整数 num ，请你统计并返回 小于或等于 num 且各位数字之和为 偶数 的正整数的数目。

 正整数的 各位数字之和 是其所有位上的对应数字相加的结果。

 示例 1：

 输入：num = 4
 输出：2
 解释：
 只有 2 和 4 满足小于等于 4 且各位数字之和为偶数。
 示例 2：

 输入：num = 30
 输出：14
 解释：
 只有 14 个整数满足小于等于 30 且各位数字之和为偶数，分别是：
 2、4、6、8、11、13、15、17、19、20、22、24、26 和 28 。

 提示：

 1 <= num <= 1000
 */

func countEven(_ num: Int) -> Int {
    var y = num / 10
    let x = num % 10
    var ans = y * 5
    var ySum = 0
    while y > 0 {
        ySum += y % 10
        y /= 10
    }

    if ySum % 2 == 0 {
        ans += x / 2
    } else {
        ans += (x + 1) / 2 - 1
    }
    return ans
}
