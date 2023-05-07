//
//  653.findTarget.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/21.
//

import Foundation

/*
 653. 两数之和 IV - 输入 BST
 难度
 简单

 329

 给定一个二叉搜索树 root 和一个目标结果 k，如果 BST 中存在两个元素且它们的和等于给定的目标结果，则返回 true。

 示例 1：

 输入: root = [5,3,6,2,4,null,7], k = 9
 输出: true
 示例 2：

 输入: root = [5,3,6,2,4,null,7], k = 28
 输出: false

 提示:

 二叉树的节点个数的范围是  [1, 10^4].
 -10^4 <= Node.val <= 10^4
 root 为二叉搜索树
 -10^5 <= k <= 10^5
 */

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    guard let root = root else {
        return false
    }
    var map: [Int: Int] = [:]

    var q = [root]
    while !q.isEmpty {
        let node = q.removeFirst()
        if map[k - node.val] != nil {
            return true
        }
        map[node.val] = 0
        if let nl = node.left {
            q.append(nl)
        }

        if let nr = node.right {
            q.append(nr)
        }
    }

    return false
}
