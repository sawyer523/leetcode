//
//  105.buildTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/30.
//

import Foundation

/*
 105. 从前序与中序遍历序列构造二叉树
 给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并返回其根节点。

 示例 1:

 输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 输出: [3,9,20,null,null,15,7]
 示例 2:

 输入: preorder = [-1], inorder = [-1]
 输出: [-1]

 提示:

 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder 和 inorder 均 无重复 元素
 inorder 均出现在 preorder
 preorder 保证 为二叉树的前序遍历序列
 inorder 保证 为二叉树的中序遍历序列
 */

func buildTree2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty {
        return nil
    }

    let root = TreeNode(preorder[0])
    var stack = [root]
    var idx = 0
    for i in 1 ..< preorder.count {
        let preVal = preorder[i]
        var node = stack.last!
        if node.val != inorder[idx] {
            node.left = TreeNode(preVal)
            stack.append(node.left!)
        } else {
            while !stack.isEmpty, stack.last!.val == inorder[idx] {
                node = stack.removeLast()
                idx += 1
            }
            node.right = TreeNode(preVal)
            stack.append(node.right!)
        }
    }

    return root
}
