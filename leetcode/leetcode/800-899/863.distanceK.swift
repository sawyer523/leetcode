//
//  863.distanceK.swift
//  863.distanceK
//
//  Created by Xiaonan Chen on 2021/7/28.
//

import Foundation

/*
 863. 二叉树中所有距离为 K 的结点
 难度
 中等

 365

 给定一个二叉树（具有根结点 root）， 一个目标结点 target ，和一个整数值 K 。

 返回到目标结点 target 距离为 K 的所有结点的值的列表。 答案可以以任何顺序返回。

 示例 1：

 输入：root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, K = 2
 输出：[7,4,1]
 解释：
 所求结点为与目标结点（值为 5）距离为 2 的结点，
 值分别为 7，4，以及 1

 注意，输入的 "root" 和 "target" 实际上是树上的结点。
 上面的输入仅仅是对这些对象进行了序列化描述。

 提示：

 给定的树是非空的。
 树上的每个结点都具有唯一的值 0 <= node.val <= 500 。
 目标结点 target 是树上的结点。
 0 <= K <= 1000.
 */

func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
    var parents: [Int: TreeNode] = [:]
    func findParents(_ node: TreeNode?) {
        if let tmp = node?.left {
            parents[tmp.val] = node!
            findParents(tmp)
        }
        if let tmp = node?.right {
            parents[tmp.val] = node!
            findParents(tmp)
        }
    }
    findParents(root)

    var ans: [Int] = []
    func dfs(_ node: TreeNode?, _ from: TreeNode?, _ K: Int) {
        guard let node = node else {
            return
        }

        if K == k {
            ans.append(node.val)
            return
        }

        if node.left !== from {
            dfs(node.left, node, K + 1)
        }

        if node.right !== from {
            dfs(node.right, node, K + 1)
        }

        if let parent = parents[node.val], parent !== from {
            dfs(parent, node, K + 1)
        }
    }

    dfs(target, nil, 0)

    return ans
}
