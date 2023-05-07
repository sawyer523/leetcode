//
//  652.findDuplicateSubtrees.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/5.
//

import Foundation

/*
 652. 寻找重复的子树
 难度
 中等

 498

 给定一棵二叉树 root，返回所有重复的子树。

 对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。

 如果两棵树具有相同的结构和相同的结点值，则它们是重复的。

 示例 1：

 输入：root = [1,2,3,4,null,2,4,null,null,4]
 输出：[[2,4],[4]]
 示例 2：

 输入：root = [2,1,1]
 输出：[[1]]
 示例 3：

 输入：root = [2,2,2,3,null,3,null]
 输出：[[2,3],[3]]

 提示：

 树中的结点数在[1,10^4]范围内。
 -200 <= Node.val <= 200
 */

func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    guard let root = root else {
        return [TreeNode?]()
    }
    var reslist = [TreeNode?]()
    var resDic = [Int: Int]()
    @discardableResult
    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "#"
        }
        let resString = dfs(root.left) + "," + dfs(root.right) + "," + "\(root.val)"
        let hashKey = resString.hashValue
        resDic[hashKey, default: 0] += 1
        if resDic[hashKey, default: 0] == 2 {
            reslist.append(root)
        }

        return resString
    }
    dfs(root)
    return reslist
}
