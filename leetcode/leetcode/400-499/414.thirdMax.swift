//
//  414.thirdMax.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/6.
//

import Foundation

/*
 414. 第三大的数
 难度
 简单

 283

 给你一个非空数组，返回此数组中 第三大的数 。如果不存在，则返回数组中最大的数。

 示例 1：

 输入：[3, 2, 1]
 输出：1
 解释：第三大的数是 1 。
 示例 2：

 输入：[1, 2]
 输出：2
 解释：第三大的数不存在, 所以返回最大的数 2 。
 示例 3：

 输入：[2, 2, 3, 1]
 输出：1
 解释：注意，要求返回第三大的数，是指在所有不同数字中排第三大的数。
 此例中存在两个值为 2 的数，它们都排第二。在所有不同数字中排第三大的数为 1 。

 提示：

 1 <= nums.length <= 104
 -2^31 <= nums[i] <= 2^31 - 1
 */

func thirdMax(_ nums: [Int]) -> Int {
    var a = Int.min
    var b = Int.min
    var c = Int.min
    for num in nums {
        if a < num {
            (a, b, c) = (num, a, b)
        } else if num < a && b < num {
            (b, c) = (num, b)
        } else if num < b && c < num {
            c = num
        }
    }

    return c == Int.min ? a : c
}
