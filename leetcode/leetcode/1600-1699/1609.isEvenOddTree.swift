//
//  1609.isEvenOddTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/25.
//

import Foundation

/*
 1609. 奇偶树
 难度
 中等

 31

 如果一棵二叉树满足下述几个条件，则可以称为 奇偶树 ：

 二叉树根节点所在层下标为 0 ，根的子节点所在层下标为 1 ，根的孙节点所在层下标为 2 ，依此类推。
 偶数下标 层上的所有节点的值都是 奇 整数，从左到右按顺序 严格递增
 奇数下标 层上的所有节点的值都是 偶 整数，从左到右按顺序 严格递减
 给你二叉树的根节点，如果二叉树为 奇偶树 ，则返回 true ，否则返回 false 。

 示例 1：

 输入：root = [1,10,4,3,null,7,9,12,8,6,null,null,2]
 输出：true
 解释：每一层的节点值分别是：
 0 层：[1]
 1 层：[10,4]
 2 层：[3,7,9]
 3 层：[12,8,6,2]
 由于 0 层和 2 层上的节点值都是奇数且严格递增，而 1 层和 3 层上的节点值都是偶数且严格递减，因此这是一棵奇偶树。
 示例 2：

 输入：root = [5,4,2,3,3,7]
 输出：false
 解释：每一层的节点值分别是：
 0 层：[5]
 1 层：[4,2]
 2 层：[3,3,7]
 2 层上的节点值不满足严格递增的条件，所以这不是一棵奇偶树。
 示例 3：

 输入：root = [5,9,1,3,5,7]
 输出：false
 解释：1 层上的节点值应为偶数。
 示例 4：

 输入：root = [1]
 输出：true
 示例 5：

 输入：root = [11,8,6,1,3,9,11,30,20,18,16,12,10,4,2,17]
 输出：true

 提示：

 树中节点数在范围 [1, 10^5] 内
 1 <= Node.val <= 10^6
 */

func isEvenOddTree(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return false
    }
    var q: [TreeNode] = [root]
    var level = 0
    while !q.isEmpty {
        var prev = 0
        if level & 1 == 1 {
            prev = Int.max
        }

        let size = q.count
        for node in q {
            let val = node.val
            if val & 1 == level & 1 || level & 1 == 0 && val <= prev || level & 1 == 1 && prev <= val {
                return false
            }
            prev = val
            if let left = node.left {
                q.append(left)
            }

            if let right = node.right {
                q.append(right)
            }
        }

        q.removeFirst(size)
        level += 1
    }

    return true
}
