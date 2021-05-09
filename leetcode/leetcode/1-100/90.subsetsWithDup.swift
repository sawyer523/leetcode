//
//  90.subsetsWithDup.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/31.
//

import Foundation

/*
 90. 子集 II
 难度
 中等

 441





 给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

 解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。

  

 示例 1：

 输入：nums = [1,2,2]
 输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
 示例 2：

 输入：nums = [0]
 输出：[[],[0]]
  

 提示：

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10

 */

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = []
    let nums = nums.sorted()
    var tmp: [Int] = []
    func dfs(_ choosePre: Bool, _ cur: Int) {
        if cur == nums.count {
            res.append(tmp)
            return
        }
        
        dfs(false, cur + 1)
        if !choosePre && 0 < cur && nums[cur - 1] == nums[cur] {
            return
        }
        
        tmp.append(nums[cur])
        dfs(true, cur + 1)
        tmp.removeLast()
    }
    
    dfs(false, 0)
    
    return res
}
