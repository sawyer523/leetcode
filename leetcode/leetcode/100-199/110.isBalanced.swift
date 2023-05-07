//
//  110.isBalanced.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/28.
//

import Foundation

/*
 110. 平衡二叉树
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。

 示例 1：

 输入：root = [3,9,20,null,null,15,7]
 输出：true
 示例 2：

 输入：root = [1,2,2,3,3,null,null,4,4]
 输出：false
 示例 3：

 输入：root = []
 输出：true

 提示：

 树中的节点数在范围 [0, 5000] 内
 -10^4 <= Node.val <= 10^4
 */

func isBalanced2(_ root: TreeNode?) -> Bool {
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }

        let left = dfs(node?.left)
        let right = dfs(node?.right)

        if left == -1 || right == -1 || 1 < abs(left - right) {
            return -1
        } else {
            return max(dfs(node?.left), dfs(node?.right)) + 1
        }
    }

    return 0 <= dfs(root)
}
