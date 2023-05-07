//
//  101.isSymmetric2.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/17.
//

import Foundation

/*
 101. 对称二叉树
 给你一个二叉树的根节点 root ， 检查它是否轴对称。

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false

 提示：

 树中节点数目在范围 [1, 1000] 内
 -100 <= Node.val <= 100

 */

func isSymmetric2(_ root: TreeNode?) -> Bool {
    func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }

        return p?.val == q?.val &&
            check(p?.left, q?.right) &&
            check(p?.right, q?.left)
    }

    return check(root, root)
}
