//
//  102.levelOrder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/16.
//

import Foundation

/*
 102. 二叉树的层序遍历
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

 示例 1：

 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[9,20],[15,7]]
 示例 2：

 输入：root = [1]
 输出：[[1]]
 示例 3：

 输入：root = []
 输出：[]

 提示：

 树中节点数目在范围 [0, 2000] 内
 -1000 <= Node.val <= 1000
 */

func levelOrder2(_ root: TreeNode?) -> [[Int]] {
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
