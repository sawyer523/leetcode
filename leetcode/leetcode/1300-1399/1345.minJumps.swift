//
//  1345.minJumps.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/21.
//

import Foundation

/*
 1345. 跳跃游戏 IV
 难度
 困难

 97

 给你一个整数数组 arr ，你一开始在数组的第一个元素处（下标为 0）。

 每一步，你可以从下标 i 跳到下标：

 i + 1 满足：i + 1 < arr.length
 i - 1 满足：i - 1 >= 0
 j 满足：arr[i] == arr[j] 且 i != j
 请你返回到达数组最后一个元素的下标处所需的 最少操作次数 。

 注意：任何时候你都不能跳到数组外面。

 示例 1：

 输入：arr = [100,-23,-23,404,100,23,23,23,3,404]
 输出：3
 解释：那你需要跳跃 3 次，下标依次为 0 --> 4 --> 3 --> 9 。下标 9 为数组的最后一个元素的下标。
 示例 2：

 输入：arr = [7]
 输出：0
 解释：一开始就在最后一个元素处，所以你不需要跳跃。
 示例 3：

 输入：arr = [7,6,9,6,9,6,9,7]
 输出：1
 解释：你可以直接从下标 0 处跳到下标 7 处，也就是数组的最后一个元素处。
 示例 4：

 输入：arr = [6,1,9]
 输出：2
 示例 5：

 输入：arr = [11,22,7,7,7,7,7,7,7,22,13]
 输出：3

 提示：

 1 <= arr.length <= 5 * 10^4
 -10^8 <= arr[i] <= 10^8
 */

func minJumps(_ arr: [Int]) -> Int {
    let c = arr.count
    var equals: [Int: [Int]] = [:]
    var unvisited = [Bool](repeating: true, count: c)
    var nextQueue: [Int] = []
    var result = 0

    func appendQueue(_ index: Int) {
        if unvisited[index] {
            nextQueue.append(index)
            unvisited[index] = false
        }
    }

    for i in 0 ..< c {
        equals[arr[i], default: [Int]()].append(i)
    }

    if c > 1 {
        nextQueue.append(0)
        unvisited[0] = false
    }

    while !nextQueue.isEmpty {
        let queue = nextQueue
        nextQueue = []
        result += 1
        for index in queue {
            if index == c - 2 {
                return result
            }
            if index < c - 1 {
                appendQueue(index + 1)
            }
            if index > 0 {
                appendQueue(index - 1)
            }
            for nextIndex in equals[arr[index], default: [Int]()] {
                if nextIndex == c - 1 {
                    return result
                }
                appendQueue(nextIndex)
            }
            equals[arr[index]] = nil
        }
    }
    return result
}
