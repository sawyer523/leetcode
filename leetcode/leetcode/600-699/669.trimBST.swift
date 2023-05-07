//
//  669.trimBST.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/10.
//

import Foundation

/*
 669. 修剪二叉搜索树
 难度
 中等

 674

 给你二叉搜索树的根节点 root ，同时给定最小边界low 和最大边界 high。通过修剪二叉搜索树，使得所有节点的值在[low, high]中。修剪树 不应该 改变保留在树中的元素的相对结构 (即，如果没有被移除，原有的父代子代关系都应当保留)。 可以证明，存在 唯一的答案 。

 所以结果应当返回修剪好的二叉搜索树的新的根节点。注意，根节点可能会根据给定的边界发生改变。

 示例 1：

 输入：root = [1,0,2], low = 1, high = 2
 输出：[1,null,2]
 示例 2：

 输入：root = [3,0,4,null,2,null,null,1], low = 1, high = 3
 输出：[3,2,null,1]

 提示：

 树中节点数在范围 [1, 10^4] 内
 0 <= Node.val <= 10^4
 树中每个节点的值都是 唯一 的
 题目数据保证输入是一棵有效的二叉搜索树
 0 <= low <= high <= 10^4
 */

func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
    var node = root
    while node != nil,
          node!.val < low || high < node!.val {
        if node!.val < low {
            node = node?.right
        } else {
            node = node?.left
        }
    }

    if node == nil {
        return nil
    }

    var l: TreeNode? = node
    while l?.left != nil {
        if l?.left?.val ?? 0 < low {
            l?.left = l?.left?.right
        } else {
            l = l?.left
        }
    }

    var r: TreeNode? = node
    while r?.right != nil {
        if high < r?.right?.val ?? 0 {
            r?.right = r?.right?.left
        } else {
            r = r?.right
        }
    }

    return node
}
