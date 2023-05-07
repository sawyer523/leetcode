//
//  54.kthLargest.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/25.
//

import Foundation

/*
 剑指 Offer 54. 二叉搜索树的第k大节点
 给定一棵二叉搜索树，请找出其中第 k 大的节点的值。

  

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 4
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 4
  

 限制：

 1 ≤ k ≤ 二叉搜索树元素个数
 */

func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
    var i = 0
    var res = 0
    func dfs(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        dfs(node.right)
        i += 1
        if i == k {
            res = node.val
        }
        
        dfs(node.left)
    }
    
    dfs(root)
    return res
}
