//
//  437.pathSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/9/28.
//

import Foundation

/*
 437. 路径总和 III
 难度
 中等
 
 1018
 
 
 
 
 
 给定一个二叉树的根节点 root ，和一个整数 targetSum ，求该二叉树里节点值之和等于 targetSum 的 路径 的数目。
 
 路径 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。
 
 
 
 示例 1：
 
 
 
 输入：root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 输出：3
 解释：和等于 8 的路径有 3 条，如图所示。
 示例 2：
 
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：3
 
 
 提示:
 
 二叉树的节点个数的范围是 [0,1000]
 -10^9 <= Node.val <= 10^9
 -1000 <= targetSum <= 1000
 */

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
    guard let root = root else {
        return 0
    }
    
    return findPath(root, targetSum) + pathSum(root.left, targetSum) + pathSum(root.right, targetSum)
}

private func findPath(_ root: TreeNode?, _ sum: Int) -> Int {
    guard let root = root else {
        return 0
    }
    
    var result = 0
    
    if sum == root.val {
        result += 1
    }
    result += findPath(root.left, sum - root.val)
    result += findPath(root.right, sum - root.val)
    
    return result
}
