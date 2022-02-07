//
//  1005.largestSumAfterKNegations.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/3.
//

import Foundation

/*
 1005. K 次取反后最大化的数组和
 难度
 简单
 
 148
 
 
 
 
 
 给你一个整数数组 nums 和一个整数 k ，按以下方法修改该数组：
 
 选择某个下标 i 并将 nums[i] 替换为 -nums[i] 。
 重复这个过程恰好 k 次。可以多次选择同一个下标 i 。
 
 以这种方式修改数组后，返回数组 可能的最大和 。
 
 
 
 示例 1：
 
 输入：nums = [4,2,3], k = 1
 输出：5
 解释：选择下标 1 ，nums 变为 [4,-2,3] 。
 示例 2：
 
 输入：nums = [3,-1,0,2], k = 3
 输出：6
 解释：选择下标 (1, 2, 2) ，nums 变为 [3,1,0,2] 。
 示例 3：
 
 输入：nums = [2,-3,-1,5,-4], k = 2
 输出：13
 解释：选择下标 (1, 4) ，nums 变为 [2,3,-1,5,4] 。
 
 
 提示：
 
 1 <= nums.length <= 10^4
 -100 <= nums[i] <= 100
 1 <= k <= 10^4
 */

func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
    var freq: [Int: Int] = [:]
    var ans = 0
    for num in nums {
        freq[num, default: 0] += 1
        ans += num
    }
    
    var k = k
    for i in stride(from: -100, to: 0, by: 1) where k != 0 {
        if let num = freq[i], 0 < num {
            let ops = min(k, num)
            ans -= i * ops * 2
            freq[-i, default: 0] += ops
            k -= ops
        }
    }

    if 0 < k && k & 1 == 1 && freq[0, default: 0] == 0 {
        for i in 1...100 {
            if let num = freq[i], 0 < num {
                ans -= i * 2
                break
            }
        }
    }
    
    return ans
}

