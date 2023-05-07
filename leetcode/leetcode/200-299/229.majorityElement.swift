//
//  229.majorityElement.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/22.
//

import Foundation

/*
 229. 求众数 II
 难度
 中等

 455

 给定一个大小为 n 的整数数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。

 示例 1：

 输入：[3,2,3]
 输出：[3]
 示例 2：

 输入：nums = [1]
 输出：[1]
 示例 3：

 输入：[1,1,1,3,3,2,2,2]
 输出：[1,2]

 提示：

 1 <= nums.length <= 5 * 10^4
 -10^9 <= nums[i] <= 10^9

 进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1)的算法解决此问题。
 */

func majorityElement(_ nums: [Int]) -> [Int] {
    var ele1 = 0, ele2 = 0, vote1 = 0, vote2 = 0
    for num in nums {
        if vote1 > 0, num == ele1 {
            vote1 += 1
        } else if vote2 > 0, num == ele2 {
            vote2 += 1
        } else if vote1 == 0 {
            ele1 = num
            vote1 += 1
        } else if vote2 == 0 {
            ele2 = num
            vote2 += 1
        } else { // 如果三个元素均不相同,则相互抵消一次
            vote1 -= 1
            vote2 -= 1
        }
    }

    var cnt1 = 0, cnt2 = 0
    for num in nums {
        if vote1 > 0, num == ele1 {
            cnt1 += 1
        }
        if vote2 > 0, num == ele2 {
            cnt2 += 1
        }
    }

    let n = nums.count
    var ans: [Int] = []
    if vote1 > 0, n / 3 < cnt1 {
        ans.append(ele1)
    }
    if vote2 > 0, n / 3 < cnt2 {
        ans.append(ele2)
    }
    return ans
}
