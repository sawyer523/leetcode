//
//  930.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/25.
//

import Foundation

/*
 930. 和相同的二元子数组
 难度
 中等

 98

 在由若干 0 和 1  组成的数组 A 中，有多少个和为 S 的非空子数组。

 示例：

 输入：A = [1,0,1,0,1], S = 2
 输出：4
 解释：
 如下面黑体所示，有 4 个满足题目要求的子数组：
 [1,0,1,0,1]
 [1,0,1,0,1]
 [1,0,1,0,1]
 [1,0,1,0,1]

 提示：

 A.length <= 30000
 0 <= S <= A.length
 A[i] 为 0 或 1
 */

func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    var leftL = 0
    var leftH = 0
    var sumL = 0
    var sumH = 0
    var ans = 0
    for right in 0 ..< nums.count {
        sumL += nums[right]
        while leftL < right && goal < sumL {
            sumL -= nums[leftL]
            leftL += 1
        }

        sumH += nums[right]
        while leftH < right && (goal < sumH || sumH == goal && nums[leftH] == 0) {
            sumH -= nums[leftH]
            leftH += 1
        }

        if sumL == goal {
            ans += leftH - leftL + 1
        }
    }
    return ans
}
