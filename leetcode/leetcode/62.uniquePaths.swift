//
//  uniquePaths.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/9.
//

import Foundation

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
 
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
 
 问总共有多少条不同的路径？
 
  
 
 示例 1：
 
 
 输入：m = 3, n = 7
 输出：28
 示例 2：
 
 输入：m = 3, n = 2
 输出：3
 解释：
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向右 -> 向下
 2. 向右 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向右
 示例 3：
 
 输入：m = 7, n = 3
 输出：28
 示例 4：
 
 输入：m = 3, n = 3
 输出：6
  
 
 提示：
 
 1 <= m, n <= 100
 题目数据保证答案小于等于 2 * 109
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/unique-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var ans = 1
    var x = n
    for i in 1..<m {
        ans = ans * x / i
        x += 1
    }

    return ans
}

func uniquePaths1(_ m: Int, _ n: Int) -> Int {
    var dp = [Int](repeating: 1, count: m)
    for _ in 1..<n {
        for j in 1..<m {
            dp[j] = dp[j-1] + dp[j]
        }
    }
    return dp.last!
}
