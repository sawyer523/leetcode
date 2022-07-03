//
//  965.isUnivalTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/24.
//

import Foundation

/*
 965. 单值二叉树
 难度
 简单

 121





 如果二叉树每个节点都具有相同的值，那么该二叉树就是单值二叉树。

 只有给定的树是单值二叉树时，才返回 true；否则返回 false。

  

 示例 1：



 输入：[1,1,1,1,1,null,1]
 输出：true
 示例 2：



 输入：[2,2,2,5,2]
 输出：false
  

 提示：

 给定树的节点数范围是 [1, 100]。
 每个节点的值都是整数，范围为 [0, 99] 。
 */

func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let node = root else { return false }
    
    let target = node.val
    var q = [node]
    var i = 0
    while i < q.count {
        let tmp = q[i]
        if tmp.val != target {
            return false
        }
        if let left = tmp.left {
            q.append(left)
        }
        if let right = tmp.right {
            q.append(right)
        }
        i += 1
    }
    
    return true
}
