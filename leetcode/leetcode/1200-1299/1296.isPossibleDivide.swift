//
//  1296.isPossibleDivide.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/30.
//

import Foundation

/*
 1296. 划分数组为连续数字的集合
 难度
 中等

 67

 给你一个整数数组 nums 和一个正整数 k，请你判断是否可以把这个数组划分成一些由 k 个连续数字组成的集合。
 如果可以，请返回 true；否则，返回 false。

 示例 1：

 输入：nums = [1,2,3,3,4,4,5,6], k = 4
 输出：true
 解释：数组可以分成 [1,2,3,4] 和 [3,4,5,6]。
 示例 2：

 输入：nums = [3,2,1,2,3,4,3,4,5,9,10,11], k = 3
 输出：true
 解释：数组可以分成 [1,2,3] , [2,3,4] , [3,4,5] 和 [9,10,11]。
 示例 3：

 输入：nums = [3,3,2,2,1,1], k = 3
 输出：true
 示例 4：

 输入：nums = [1,2,3,4], k = 3
 输出：false
 解释：数组不能分成几个大小为 3 的子数组。

 提示：

 1 <= k <= nums.length <= 10^5
 1 <= nums[i] <= 10^9
 */

func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
    if nums.count % k > 0 {
        return false
    }

    let hand = nums.sorted()

    var cnt: [Int: Int] = [:]
    for h in hand {
        cnt[h, default: 0] += 1
    }

    for x in hand {
        if cnt[x] == 0 {
            continue
        }

        for num in x ..< x + k {
            if cnt[num, default: 0] <= 0 {
                return false
            }
            cnt[num, default: 0] -= 1
        }
    }

    return true
}
