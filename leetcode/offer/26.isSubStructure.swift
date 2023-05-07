//
//  26.isSubStructure.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/17.
//

import Foundation

/*
 剑指 Offer 26. 树的子结构
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

 示例 1：

 输入：A = [1,2,3], B = [3,1]
 输出：false
 示例 2：

 输入：A = [3,4,5,1,2], B = [4,1]
 输出：true
 限制：

 0 <= 节点个数 <= 10000
 */

func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    func helper(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        guard let nodeB = b else { return true }
        guard let nodeA = a else { return false }
        if nodeA.val != nodeB.val {
            return false
        }
        
        return helper(nodeA.left, nodeB.left) &&
        helper(nodeA.right, nodeB.right)
    }
    
    if A == nil, B == nil {
        return true
    }
    
    if A == nil || B == nil {
        return false
    }
    
    var res = false
    if A?.val == B?.val {
        res = helper(A, B)
    }
    if !res {
        res = isSubStructure(A?.left, B)
    }
    
    if !res {
        res = isSubStructure(A?.right, B)
    }
    
    return res
}
