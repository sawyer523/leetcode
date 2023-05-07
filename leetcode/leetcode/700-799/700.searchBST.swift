//
//  700.searchBST.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/26.
//

import Foundation

/*
 700. 二叉搜索树中的搜索
 难度
 简单

 186

 给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。

 例如，

 给定二叉搜索树:

 4
 / \
 2   7
 / \
 1   3

 和值: 2
 你应该返回如下子树:

 2
 / \
 1   3
 在上述示例中，如果要找的值是 5，但因为没有节点值为 5，我们应该返回 NULL。

 */

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var node = root
    while node != nil {
        if node!.val == val {
            return node
        } else if node!.val > val {
            node = node?.left
        } else {
            node = node?.right
        }
    }
    return nil
}
