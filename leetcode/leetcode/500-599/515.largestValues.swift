//
//  515.largestValues.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/24.
//

import Foundation

/*
 515. 在每个树行中找最大值
 难度
 中等

 226

 收藏

 分享
 切换为英文
 接收动态
 反馈
 给定一棵二叉树的根节点 root ，请找出该二叉树中每一层的最大值。

 示例1：

 输入: root = [1,3,2,5,3,null,9]
 输出: [1,3,9]
 示例2：

 输入: root = [1,2,3]
 输出: [1,3]

 提示：

 二叉树的节点个数的范围是 [0,10^4]
 -2^31 <= Node.val <= 2^31 - 1
 */

func largestValues(_ root: TreeNode?) -> [Int] {
    var ans: [Int] = []
    func dfs(_ root: TreeNode?, _ curHeight: Int) {
        guard let node = root else {
            return
        }
        if curHeight == ans.count {
            ans.append(node.val)
        } else {
            ans[curHeight] = max(ans[curHeight], node.val)
        }
        dfs(node.left, curHeight + 1)
        dfs(node.right, curHeight + 1)
    }
    dfs(root, 0)
    return ans
}
