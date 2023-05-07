//
//  06.inorderSuccessor.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/16.
//

import Foundation

/*
 面试题 04.06. 后继者
 难度
 中等

 106

 设计一个算法，找出二叉搜索树中指定节点的“下一个”节点（也即中序后继）。

 如果指定节点没有对应的“下一个”节点，则返回null。

 示例 1:

 输入: root = [2,1,3], p = 1

   2
  / \
 1   3

 输出: 2
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], p = 6

       5
      / \
     3   6
    / \
   2   4
  /
 1

 输出: null
 */

func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    var successor: TreeNode?
    if p?.right != nil {
        successor = p?.right
        while successor?.left != nil {
            successor = successor?.left
        }
        return successor
    }

    var node = root
    while node != nil {
        if p?.val ?? 0 < node?.val ?? 0 {
            successor = node
            node = node?.left
        } else {
            node = node?.right
        }
    }

    return successor
}
