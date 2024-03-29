//
//  1769.minOperations.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/2.
//

import Foundation

/*
 1769. 移动所有球到每个盒子所需的最小操作数
 难度
 中等

 40

 有 n 个盒子。给你一个长度为 n 的二进制字符串 boxes ，其中 boxes[i] 的值为 '0' 表示第 i 个盒子是 空 的，而 boxes[i] 的值为 '1' 表示盒子里有 一个 小球。

 在一步操作中，你可以将 一个 小球从某个盒子移动到一个与之相邻的盒子中。第 i 个盒子和第 j 个盒子相邻需满足 abs(i - j) == 1 。注意，操作执行后，某些盒子中可能会存在不止一个小球。

 返回一个长度为 n 的数组 answer ，其中 answer[i] 是将所有小球移动到第 i 个盒子所需的 最小 操作数。

 每个 answer[i] 都需要根据盒子的 初始状态 进行计算。

 示例 1：

 输入：boxes = "110"
 输出：[1,1,3]
 解释：每个盒子对应的最小操作数如下：
 1) 第 1 个盒子：将一个小球从第 2 个盒子移动到第 1 个盒子，需要 1 步操作。
 2) 第 2 个盒子：将一个小球从第 1 个盒子移动到第 2 个盒子，需要 1 步操作。
 3) 第 3 个盒子：将一个小球从第 1 个盒子移动到第 3 个盒子，需要 2 步操作。将一个小球从第 2 个盒子移动到第 3 个盒子，需要 1 步操作。共计 3 步操作。
 示例 2：

 输入：boxes = "001011"
 输出：[11,8,5,4,3,4]

 提示：

 n == boxes.length
 1 <= n <= 2000
 boxes[i] 为 '0' 或 '1'
 */

func minOperations(_ boxes: String) -> [Int] {
    var left = Int(boxes.first!.asciiValue! - Character("0").asciiValue!)
    var right = 0
    var operations = 0
    let n = boxes.count
    let boxes = Array(boxes)
    for i in 1 ..< n {
        if boxes[i] == "1" {
            right += 1
            operations += i
        }
    }

    var ans = [Int](repeating: 0, count: n)
    ans[0] = operations
    for i in 1 ..< n {
        operations += left - right
        if boxes[i] == "1" {
            left += 1
            right -= 1
        }
        ans[i] = operations
    }
    return ans
}
