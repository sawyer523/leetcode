//
//  1046.lastStoneWeight.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/30.
//

import Foundation

/*
 1046. 最后一块石头的重量
 难度
 简单

 110





 有一堆石头，每块石头的重量都是正整数。

 每一回合，从中选出两块 最重的 石头，然后将它们一起粉碎。假设石头的重量分别为 x 和 y，且 x <= y。那么粉碎的可能结果如下：

 如果 x == y，那么两块石头都会被完全粉碎；
 如果 x != y，那么重量为 x 的石头将会完全粉碎，而重量为 y 的石头新重量为 y-x。
 最后，最多只会剩下一块石头。返回此石头的重量。如果没有石头剩下，就返回 0。

  

 示例：

 输入：[2,7,4,1,8,1]
 输出：1
 解释：
 先选出 7 和 8，得到 1，所以数组转换为 [2,4,1,1,1]，
 再选出 2 和 4，得到 2，所以数组转换为 [2,1,1,1]，
 接着是 2 和 1，得到 1，所以数组转换为 [1,1,1]，
 最后选出 1 和 1，得到 0，最终数组转换为 [1]，这就是最后剩下那块石头的重量。
  

 提示：

 1 <= stones.length <= 30
 1 <= stones[i] <= 1000
 */

func lastStoneWeight(_ stones: [Int]) -> Int {
    if stones.count == 1 {
        return stones.first!
    }

    var stones = stones.sorted(by: >)

    func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        if arr.count < 2 {
            return arr.first ?? 0 > target ? 1 : 0
        }
        if arr.last ?? 0 > target {
            return arr.count
        }
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] < target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func find(_ arr: inout [Int]) -> Int {
        if arr.count < 2 {
            return arr.first ?? 0
        }
        let a1 = arr.removeFirst()
        let a2 = arr.removeFirst()

        let x = a1 - a2
        if x > 0 {
            let index = binarySearch(arr, x)
            arr.insert(x, at: index)
        }
        return find(&arr)
    }

    return find(&stones)
}
