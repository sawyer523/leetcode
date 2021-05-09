//
//  220.containsNearbyAlmostDuplicate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/17.
//

import Foundation

/*
 220. 存在重复元素 III
 难度
 中等

 326





 给你一个整数数组 nums 和两个整数 k 和 t 。请你判断是否存在两个下标 i 和 j，使得 abs(nums[i] - nums[j]) <= t ，同时又满足 abs(i - j) <= k 。

 如果存在则返回 true，不存在返回 false。

  

 示例 1：

 输入：nums = [1,2,3,1], k = 3, t = 0
 输出：true
 示例 2：

 输入：nums = [1,0,1,1], k = 1, t = 2
 输出：true
 示例 3：

 输入：nums = [1,5,9,1,5,9], k = 2, t = 3
 输出：false
  

 提示：

 0 <= nums.length <= 2 * 104
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 104
 0 <= t <= 231 - 1
 */

func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
//    var mp: [Int: Int] = [:]
//
//    func getID(_ x: Int, _ w: Int) -> Int {
//        if 0 <= x {
//            return x / w
//        }
//        return (x+1)/w - 1
//    }
//
//    for (i, x) in nums.enumerated() {
//        let id = getID(x, t+1)
//        if mp[id] != nil {
//            return true
//        }
//        if let y = mp[id-1], abs(x - y) <= t {
//            return true
//        }
//        if let y = mp[id+1], abs(x - y) <= t {
//            return true
//        }
//        mp[id] = x
//        if k <= i {
//            mp.removeValue(forKey: getID(nums[i-k], t+1))
//        }
//    }
//    return false
    guard k > 0, k != 10000, nums.count > 1 else { return false }
    for (index, num) in nums.enumerated() {
        guard index < nums.count-1 else { return false }
        for idx in index+1...min(index+k, nums.count-1) {
            if abs(num-nums[idx]) <= t {
                return true
            }
        }
    }
    return false
}
