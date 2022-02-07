//
//  1995.countQuadruplets.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/29.
//

import Foundation

/*
 1995. 统计特殊四元组
 难度
 简单
 
 26
 
 
 
 
 
 给你一个 下标从 0 开始 的整数数组 nums ，返回满足下述条件的 不同 四元组 (a, b, c, d) 的 数目 ：
 
 nums[a] + nums[b] + nums[c] == nums[d] ，且
 a < b < c < d
 
 
 示例 1：
 
 输入：nums = [1,2,3,6]
 输出：1
 解释：满足要求的唯一一个四元组是 (0, 1, 2, 3) 因为 1 + 2 + 3 == 6 。
 示例 2：
 
 输入：nums = [3,3,6,4,5]
 输出：0
 解释：[3,3,6,4,5] 中不存在满足要求的四元组。
 示例 3：
 
 输入：nums = [1,1,1,3,5]
 输出：4
 解释：满足要求的 4 个四元组如下：
 - (0, 1, 2, 3): 1 + 1 + 1 == 3
 - (0, 1, 3, 4): 1 + 1 + 3 == 5
 - (0, 2, 3, 4): 1 + 1 + 3 == 5
 - (1, 2, 3, 4): 1 + 1 + 3 == 5
 
 
 提示：
 
 4 <= nums.length <= 50
 1 <= nums[i] <= 100
 */

func countQuadruplets(_ nums: [Int]) -> Int {
    var cnt: [Int: Int] = [:]
    let n = nums.count
    var ans = 0
    for b in stride(from: n - 3, through: 1, by: -1) {
        for i in b+2..<n {
            cnt[nums[i] - nums[b+1], default: 0] += 1
        }
        
        for i in 0..<b {
            let sum = nums[i] + nums[b]
            if 0 < cnt[sum, default: 0] {
                ans += cnt[sum]!
            }
        }
    }
    
    return ans
}
