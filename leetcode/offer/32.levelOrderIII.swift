//
//  32.levelOrderIII.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/16.
//

import Foundation

/*
 剑指 Offer 32 - III. 从上到下打印二叉树 III
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

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
   [20,9],
   [15,7]
 ]

 提示：

 节点总数 <= 1000

 */

func levelOrder3(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let node = root else {
        return res
    }

    var q = [node]
    var order = false
    while !q.isEmpty {
        var p: [TreeNode] = []

        var vals: [Int] = []
        for j in 0 ..< q.count {
            let node = q[j]
            vals.append(node.val)
            if let l = node.left {
                p.append(l)
            }

            if let r = node.right {
                p.append(r)
            }
        }

        res.append(order ? vals.reversed() : vals)

        order.toggle()
        q = p
    }
    
    return res
}
