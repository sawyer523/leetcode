//
//  85.maximalRectangle.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/26.
//

import Foundation

/*
 85. 最大矩形
 难度
 困难

 744

 给定一个仅包含 0 和 1 、大小为 rows x cols 的二维二进制矩阵，找出只包含 1 的最大矩形，并返回其面积。

 示例 1：

 https://assets.leetcode.com/uploads/2020/09/14/maximal.jpg
 输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 输出：6
 解释：最大矩形如上图所示。
 示例 2：

 输入：matrix = []
 输出：0
 示例 3：

 输入：matrix = [["0"]]
 输出：0
 示例 4：

 输入：matrix = [["1"]]
 输出：1
 示例 5：

 输入：matrix = [["0","0"]]
 输出：0

 提示：

 rows == matrix.length
 cols == matrix[0].length
 0 <= row, cols <= 200
 matrix[i][j] 为 '0' 或 '1'
 */

func maximalRectangle(_ matrix: [[Character]]) -> Int {
    if matrix.isEmpty {
        return 0
    }

    func largestRectangleArea(_ heights: [Int]) -> Int {
        var ans = 0
        var stack = [Int]()
        stack.append(0)
        var start = 0
        for i in 1 ..< heights.count {
            while heights[i] < heights[stack.last!] {
                let height = heights[stack.popLast()!]
                let sub = i - stack.last! - 1
                let width = sub < i - start ? sub : sub - start
                ans = max(ans, height * width)
            }
            if heights[i] != 0 {
                stack.append(i)
            } else {
                start = i
            }
        }

        return ans
    }

    var ans = 0
    let row = matrix.count
    let cols = matrix[0].count
    var heights = [Int](repeating: 0, count: cols + 2)
    for i in 0 ..< row {
        for j in 0 ..< cols {
            if matrix[i][j] == "1" {
                heights[j + 1] += 1
            } else {
                heights[j + 1] = 0
            }
        }
        ans = max(ans, largestRectangleArea(heights))
    }

    return ans
}

func maximalRectangleDp(_ matrix: [[Character]]) -> Int {
    if matrix.isEmpty {
        return 0
    }
    var ans = 0
    let row = matrix.count
    let cols = matrix[0].count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: row)
    for i in 0 ..< row {
        for j in 0 ..< cols {
            if matrix[i][j] == "1" {
                dp[i][j] = 1 + (j > 0 ? dp[i][j - 1] : 0)
            }
        }
    }

    for i in (0 ..< row).reversed() {
        for j in 0 ..< cols {
            var width = dp[i][j]
            if width == 0 {
                continue
            }
            var height = 0
            var k = i
            while k >= 0 && matrix[k][j] == "1" {
                width = min(dp[k][j], width)
                k -= 1
                height += 1
                ans = max(ans, width * height)
            }
        }
    }
    return ans
}
