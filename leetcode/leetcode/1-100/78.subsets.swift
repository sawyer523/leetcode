//
//  78.subsets.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/31.
//

import Foundation

/*
 78. 子集
 难度
 中等
 
 1091
 
 
 
 
 
 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
 
 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
 
 
 
 示例 1：
 
 输入：nums = [1,2,3]
 输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 示例 2：
 
 输入：nums = [0]
 输出：[[],[0]]
 
 
 提示：
 
 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 nums 中的所有元素 互不相同
 
 */

func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    let nums = nums.sorted()
    var tmp: [Int] = []
    func dfs(_ choosePre: Bool, _ cur: Int) {
        if cur == nums.count {
            res.append(tmp)
            return
        }

        dfs(false, cur + 1)
        tmp.append(nums[cur])
        dfs(true, cur + 1)
        tmp.removeLast()
    }

    dfs(false, 0)

    return res
}
