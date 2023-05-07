//
//  28.isSymmetric.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/17.
//

import Foundation

/*
 剑指 Offer 28. 对称的二叉树
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

 示例 1：

 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：

 输入：root = [1,2,2,null,3,null,3]
 输出：false

 限制：

 0 <= 节点个数 <= 1000
 */

func isSymmetric(_ root: TreeNode?) -> Bool {
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
