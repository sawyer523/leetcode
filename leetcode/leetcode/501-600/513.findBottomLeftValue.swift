//
//  513.findBottomLeftValue.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/22.
//

import Foundation

/*
 513. 找树左下角的值
 难度
 中等

 295





 给定一个二叉树的 根节点 root，请找出该二叉树的 最底层 最左边 节点的值。

 假设二叉树中至少有一个节点。

  

 示例 1:



 输入: root = [2,1,3]
 输出: 1
 示例 2:



 输入: [1,2,3,4,null,5,6,null,null,7]
 输出: 7
  

 提示:

 二叉树的节点个数的范围是 [1,10^4]
 -2^31 <= Node.val <= 2^31 - 1
 */

func findBottomLeftValue(_ root: TreeNode?) -> Int {
    var curVal = 0
    var curHeight = 0
    func dfs(_ node: TreeNode?, _ height: Int) {
        guard let node = node else {return}
        let height = height + 1
        dfs(node.left, height)
        dfs(node.right, height)
        if curHeight < height {
            curHeight = height
            curVal = node.val
        }
    }
    dfs(root, 0)
    return curVal
}
