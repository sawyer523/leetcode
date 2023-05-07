//
//  104.maxDepth.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/28.
//

import Foundation

/*
 104. 二叉树的最大深度
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 */

func maxDepth2(_ root: TreeNode?) -> Int {
    var depth = 0
    guard let node = root else {
        return depth
    }
    var q: [TreeNode] = [node]
    while !q.isEmpty {
        let t = q
        q.removeAll()
        for n in t {
            if let l = n.left {
                q.append(l)
            }
            if let r = n.right {
                q.append(r)
            }
        }
        depth += 1
    }
    return depth
}
