//
//  07.buildTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/30.
//

import Foundation

/*
 剑指 Offer 07. 重建二叉树
 输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。

 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 示例 1:

 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 示例 2:

 Input: preorder = [-1], inorder = [-1]
 Output: [-1]

 限制：

 0 <= 节点个数 <= 5000
 */

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty {
        return nil
    }

    let root = TreeNode(preorder[0])
    var stack = [root]
    var inorderIndex = 0
    for i in 1 ..< preorder.count {
        let preorderVal = preorder[i]
        var node = stack.last!
        if node.val != inorder[inorderIndex] {
            node.left = TreeNode(preorderVal)
            stack.append(node.left!)
        } else {
            while !stack.isEmpty, stack.last!.val == inorder[inorderIndex] {
                node = stack.removeLast()
                inorderIndex += 1
            }
            node.right = TreeNode(preorderVal)
            stack.append(node.right!)
        }
    }

    return root
}
