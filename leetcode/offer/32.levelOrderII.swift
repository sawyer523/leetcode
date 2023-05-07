//
//  32.levelOrderII.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/16.
//

import Foundation

/*
 剑指 Offer 32 - II. 从上到下打印二叉树 II
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 提示：

 节点总数 <= 1000
 注意：本题与主站 102 题相同：https://leetcode-cn.com/problems/binary-tree-level-order-traversal/

 */

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let node = root else {
        return res
    }

    var q = [node]
    var i = 0
    while !q.isEmpty {
        res.append([])
        var p: [TreeNode] = []
        for j in 0 ..< q.count {
            let node = q[j]
            res[i].append(node.val)
            if let l = node.left {
                p.append(l)
            }

            if let r = node.right {
                p.append(r)
            }
        }

        q = p
        i += 1
    }

    return res
}
