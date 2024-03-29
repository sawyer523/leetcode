//
//  27.mirrorTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/17.
//

import Foundation

/*
 剑指 Offer 27. 二叉树的镜像
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 镜像输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 示例 1：

 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]

 限制：

 0 <= 节点个数 <= 1000

 */

func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    guard let node = root else {
        return nil
    }
    let left = mirrorTree(node.left)
    let right = mirrorTree(node.right)
    node.right = left
    node.left = right
    return node
}
