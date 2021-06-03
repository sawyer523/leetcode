//
//  39.combinationSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/24.
//

import Foundation

/*
 39. 组合总和
 难度
 中等

 1313





 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

 candidates 中的数字可以无限制重复被选取。

 说明：

 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1：

 输入：candidates = [2,3,6,7], target = 7,
 所求解集为：
 [
   [7],
   [2,2,3]
 ]
 示例 2：

 输入：candidates = [2,3,5], target = 8,
 所求解集为：
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
  

 提示：

 1 <= candidates.length <= 30
 1 <= candidates[i] <= 200
 candidate 中的每个元素都是独一无二的。
 1 <= target <= 500

 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let n = candidates.count
    var res: [[Int]] = []
    let candidates = candidates.sorted()
    var path: [Int] = []
    func dfs(_ begin: Int, _ end: Int, _ target: Int) {
        if target == 0 {
            res.append(path)
            path.removeAll()
            return
        }

        for i in begin..<end {
            if target - candidates[i] < 0 {
                break
            }

            path.append(candidates[i])
            dfs(i, n, target - candidates[i])
            _ = path.popLast()
        }
    }
    dfs(0, n, target)
    return res
}
