//
//  216.combinationSum3.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/24.
//

import Foundation

/*
 216. 组合总和 III
 难度
 中等
 
 296
 
 
 
 
 
 找出所有相加之和为 n 的 k 个数的组合。组合中只允许含有 1 - 9 的正整数，并且每种组合中不存在重复的数字。
 
 说明：
 
 所有数字都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: k = 3, n = 7
 输出: [[1,2,4]]
 示例 2:
 
 输入: k = 3, n = 9
 输出: [[1,2,6], [1,3,5], [2,3,4]]
 
 */

func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    var res: Set<[Int]> = []
    var path: [Int] = []
    func dfs(_ cur: Int, _ target: Int) {
        if target == 0 && path.count == k {
            res.insert(path.sorted())
            return
        }
        if target < cur || 9 < cur {
            return
        }
        for i in cur...9 {
            if path.contains(i) {
                continue
            }
            path.append(i)
            dfs(cur+1, target-i)
            path.removeLast()
        }
    }
    dfs(1, n)
    return Array(res)
}
