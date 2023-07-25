//
//  32.levelOrderI.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/16.
//

import Foundation

/*
 剑指 Offer 32 - I. 从上到下打印二叉树
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：

 [3,9,20,15,7]

 提示：

 节点总数 <= 1000
 */

func levelOrder(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }

    var queue = [node]
    var ans: [Int] = []

    var idx = 0
    while idx < queue.count {
        let n = queue[idx]
        ans.append(n.val)
        if let l = n.left {
            queue.append(l)
        }

        if let r = n.right {
            queue.append(r)
        }
        idx += 1
    }

    return ans
}
