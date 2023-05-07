//
//  179.largestNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/12.
//

import Foundation

/*
 179. 最大数
 难度
 中等

 617

 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。

 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。

 示例 1：

 输入：nums = [10,2]
 输出："210"
 示例 2：

 输入：nums = [3,30,34,5,9]
 输出："9534330"
 示例 3：

 输入：nums = [1]
 输出："1"
 示例 4：

 输入：nums = [10]
 输出："10"

 提示：

 1 <= nums.length <= 100
 0 <= nums[i] <= 109
 */

func largestNumber(_ nums: [Int]) -> String {
    let nums = nums.sorted { x, y in
        var x1 = 10, x2 = 10
        while x1 <= x {
            x1 *= 10
        }

        while x2 <= y {
            x2 *= 10
        }

        return x1 * y + x < x2 * x + y
    }

    if nums.first == 0 {
        return "0"
    }

    var ans: [String] = []
    for num in nums {
        ans.append(String(num))
    }

    return ans.joined()
}
