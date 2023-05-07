//
//  398.pick.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/25.
//

import Foundation

/*
 398. 随机数索引
 难度
 中等

 154

 给定一个可能含有重复元素的整数数组，要求随机输出给定的数字的索引。 您可以假设给定的数字一定存在于数组中。

 注意：
 数组大小可能非常大。 使用太多额外空间的解决方案将不会通过测试。

 示例:

 int[] nums = new int[] {1,2,3,3,3};
 Solution solution = new Solution(nums);

 // pick(3) 应该返回索引 2,3 或者 4。每个索引的返回概率应该相等。
 solution.pick(3);

 // pick(1) 应该返回 0。因为只有nums[0]等于1。
 solution.pick(1);
 */

// class Solution398 {
//    private var dict: [Int: [Int]] = [:]
//    init(_ nums: [Int]) {
//        for i in 0..<nums.count {
//            dict[nums[i], default: []].append(i)
//        }
//    }
//
//    func pick(_ target: Int) -> Int {
//        return dict[target]!.randomElement()!
//    }
// }

class Solution398 {
    private var nums: [Int]
    private let count: Int
    init(_ nums: [Int]) {
        self.nums = nums
        count = nums.count
    }

    func pick(_ target: Int) -> Int {
        var temp: [Int] = []

        for i in 0 ..< count {
            if nums[i] == target {
                temp.append(i)
            }
        }
        return temp.randomElement()!
    }
}
