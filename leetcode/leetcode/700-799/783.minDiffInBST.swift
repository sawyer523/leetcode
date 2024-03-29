//
//  783.minDiffInBST.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/13.
//

import Foundation

/*
 783. 二叉搜索树节点最小距离
 难度
 简单

 135

 给你一个二叉搜索树的根节点 root ，返回 树中任意两不同节点值之间的最小差值 。

 注意：本题与 530：https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst/ 相同

 示例 1：

 输入：root = [4,2,6,1,3]
 输出：1
 示例 2：

 输入：root = [1,0,48,null,null,12,49]
 输出：1

 提示：

 树中节点数目在范围 [2, 100] 内
 0 <= Node.val <= 105

 */

func minDiffInBST(_ root: TreeNode?) -> Int {
    var ans = Int.max
    var pre = -1
    func dfs(_ root: TreeNode?) {
        if root == nil {
            return
        }
        dfs(root?.left)
        if pre != -1 && root!.val - pre < ans {
            ans = root!.val - pre
        }
        pre = root!.val
        dfs(root?.right)
    }
    dfs(root)
    return ans
}
