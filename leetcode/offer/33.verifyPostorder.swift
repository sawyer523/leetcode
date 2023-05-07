//
//  33.verifyPostorder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/30.
//

import Foundation

/*
 剑指 Offer 33. 二叉搜索树的后序遍历序列
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,6,5]
 输出: true

 提示：

 数组长度 <= 1000
 */

func verifyPostorder(_ postorder: [Int]) -> Bool {
    var stack: [Int] = []
    var root = Int.max
    for item in postorder.reversed() {
        if root < item {
            return false
        }

        while !stack.isEmpty, item < stack.last! {
            root = stack.removeLast()
        }

        stack.append(item)
    }

    return true
}
