//
//  1819.countDifferentSubsequenceGCDs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/14.
//

import Foundation

/*
 1819. 序列中不同最大公约数的数目
 难度
 困难

 138

 给你一个由正整数组成的数组 nums 。

 数字序列的 最大公约数 定义为序列中所有整数的共有约数中的最大整数。

 例如，序列 [4,6,16] 的最大公约数是 2 。
 数组的一个 子序列 本质是一个序列，可以通过删除数组中的某些元素（或者不删除）得到。

 例如，[2,5,10] 是 [1,2,1,2,4,1,5,10] 的一个子序列。
 计算并返回 nums 的所有 非空 子序列中 不同 最大公约数的 数目 。

 示例 1：

 输入：nums = [6,10,3]
 输出：5
 解释：上图显示了所有的非空子序列与各自的最大公约数。
 不同的最大公约数为 6 、10 、3 、2 和 1 。
 示例 2：

 输入：nums = [5,15,40,5,6]
 输出：7

 提示：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 2 * 10^5
 */

func countDifferentSubsequenceGCDs(_ nums: [Int]) -> Int {
    func gcd(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1
        var num2 = num2
        while num1 != 0 {
            (num1, num2) = (num2 % num1, num1)
        }
        return num2
    }

    let maxVal = nums.max()!
    var occured = [Bool](repeating: false, count: maxVal + 1)
    for num in nums {
        occured[num] = true
    }

    var ans = 0

    for i in 1 ... maxVal {
        var subGcd = 0
        for j in stride(from: i, through: maxVal, by: i) {
            if occured[j] {
                if subGcd == 0 {
                    subGcd = j
                } else {
                    subGcd = gcd(subGcd, j)
                }
                if subGcd == i {
                    ans += 1
                    break
                }
            }
        }
    }
    return ans
}
