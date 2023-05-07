//
//  1302.deepestLeavesSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/17.
//

import Foundation

/*
 1302. 层数最深叶子节点的和
 难度
 中等

 101

 给你一棵二叉树的根节点 root ，请你返回 层数最深的叶子节点的和 。

 示例 1：

 输入：root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
 输出：15
 示例 2：

 输入：root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
 输出：19

 提示：

 树中节点数目在范围 [1, 10^4] 之间。
 1 <= Node.val <= 100
 */

func deepestLeavesSum(_ root: TreeNode?) -> Int {
    /* dfs */
    /*
     var sum = 0
     var maxLevel = -1
     func dfs(_ node: TreeNode?, _ level: Int) {
         guard let root = node else { return }
         if maxLevel < level {
             sum = root.val
             maxLevel = level
         } else if level == maxLevel {
             sum += root.val
         }

         dfs(root.left, level + 1)
         dfs(root.right, level + 1)
     }
     return sum
      */

    var q = [root]
    var sum = 0
    while !q.isEmpty {
        sum = 0
        let tmp = q
        q.removeAll()
        for node in tmp {
            sum += node!.val
            if let l = node?.left {
                q.append(l)
            }
            if let r = node?.right {
                q.append(r)
            }
        }
    }
    return sum
}
