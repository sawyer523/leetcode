//
//  1161.maxLevelSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/31.
//

import Foundation

/*
 1161. 最大层内元素和
 难度
 中等

 79

 给你一个二叉树的根节点 root。设根节点位于二叉树的第 1 层，而根节点的子节点位于第 2 层，依此类推。

 请返回层内元素之和 最大 的那几层（可能只有一层）的层号，并返回其中 最小 的那个。

 示例 1：

 输入：root = [1,7,0,7,-8,null,null]
 输出：2
 解释：
 第 1 层各元素之和为 1，
 第 2 层各元素之和为 7 + 0 = 7，
 第 3 层各元素之和为 7 + -8 = -1，
 所以我们返回第 2 层的层号，它的层内元素之和最大。
 示例 2：

 输入：root = [989,null,10250,98693,-89388,null,null,null,-32127]
 输出：2

 提示：

 树中的节点数在 [1, 10^4]范围内
 -10^5 <= Node.val <= 10^5
 */

func maxLevelSum(_ root: TreeNode?) -> Int {
    // dfs
    /*
     var sum: [Int] = []
     func dfs(_ node: TreeNode, _ level: Int) {
         if sum.count == level {
             sum.append(node.val)
         } else {
             sum[level] += node.val
         }
         if let left = node.left {
             dfs(left, level+1)
         }
         if let right = node.right {
             dfs(right, level+1)
         }
     }
     dfs(root!, 0)
     var ans = 0
     for (i, s) in sum.enumerated() {
         if sum[ans] < s {
             ans = i
         }
     }
     return ans + 1
      */

    // bfs
    var q = [root!]
    var maxSum = root?.val ?? 0
    var level = 1
    var ans = 1
    while !q.isEmpty {
        let tmp = q
        q.removeAll()
        var sum = 0
        for t in tmp {
            sum += t.val
            if let l = t.left {
                q.append(l)
            }
            if let r = t.right {
                q.append(r)
            }
        }

        if maxSum < sum {
            maxSum = sum
            ans = level
        }
        level += 1
    }

    return ans
}
