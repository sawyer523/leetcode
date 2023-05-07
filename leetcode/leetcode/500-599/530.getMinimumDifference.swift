//
//  530.getMinimumDifference.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/13.
//

import Foundation

/*
 530. 二叉搜索树的最小绝对差
 难度
 简单

 245

 给你一棵所有节点为非负值的二叉搜索树，请你计算树中任意两节点的差的绝对值的最小值。

 示例：

 输入：

    1
     \
      3
     /
    2

 输出：
 1

 解释：
 最小绝对差为 1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。

 提示：

 树中至少有 2 个节点。
 本题与 783 https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes/ 相同
 */

private func getMinimumDifference(_ root: TreeNode?) -> Int {
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
