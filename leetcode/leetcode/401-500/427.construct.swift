//
//  427.construct.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/29.
//

import Foundation

/*
 427. 建立四叉树
 难度
 中等

 92





 给你一个 n * n 矩阵 grid ，矩阵由若干 0 和 1 组成。请你用四叉树表示该矩阵 grid 。

 你需要返回能表示矩阵的 四叉树 的根结点。

 注意，当 isLeaf 为 False 时，你可以把 True 或者 False 赋值给节点，两种值都会被判题机制 接受 。

 四叉树数据结构中，每个内部节点只有四个子节点。此外，每个节点都有两个属性：

 val：储存叶子结点所代表的区域的值。1 对应 True，0 对应 False；
 isLeaf: 当这个节点是一个叶子结点时为 True，如果它有 4 个子节点则为 False 。
 class Node {
     public boolean val;
     public boolean isLeaf;
     public Node topLeft;
     public Node topRight;
     public Node bottomLeft;
     public Node bottomRight;
 }
 我们可以按以下步骤为二维区域构建四叉树：

 如果当前网格的值相同（即，全为 0 或者全为 1），将 isLeaf 设为 True ，将 val 设为网格相应的值，并将四个子节点都设为 Null 然后停止。
 如果当前网格的值不同，将 isLeaf 设为 False， 将 val 设为任意值，然后如下图所示，将当前网格划分为四个子网格。
 使用适当的子网格递归每个子节点。


 如果你想了解更多关于四叉树的内容，可以参考 wiki 。

 四叉树格式：

 输出为使用层序遍历后四叉树的序列化形式，其中 null 表示路径终止符，其下面不存在节点。

 它与二叉树的序列化非常相似。唯一的区别是节点以列表形式表示 [isLeaf, val] 。

 如果 isLeaf 或者 val 的值为 True ，则表示它在列表 [isLeaf, val] 中的值为 1 ；如果 isLeaf 或者 val 的值为 False ，则表示值为 0 。

  

 示例 1：



 输入：grid = [[0,1],[1,0]]
 输出：[[0,1],[1,0],[1,1],[1,1],[1,0]]
 解释：此示例的解释如下：
 请注意，在下面四叉树的图示中，0 表示 false，1 表示 True 。

 示例 2：



 输入：grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
 输出：[[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
 解释：网格中的所有值都不相同。我们将网格划分为四个子网格。
 topLeft，bottomLeft 和 bottomRight 均具有相同的值。
 topRight 具有不同的值，因此我们将其再分为 4 个子网格，这样每个子网格都具有相同的值。
 解释如下图所示：

 示例 3：

 输入：grid = [[1,1],[1,1]]
 输出：[[1,1]]
 示例 4：

 输入：grid = [[0]]
 输出：[[1,0]]
 示例 5：

 输入：grid = [[1,1,0,0],[1,1,0,0],[0,0,1,1],[0,0,1,1]]
 输出：[[0,1],[1,1],[1,0],[1,0],[1,1]]
  

 提示：

 n == grid.length == grid[i].length
 n == 2^x 其中 0 <= x <= 6
 */

func construct(_ grid: [[Int]]) -> Node2? {
    /*
    // 超时
    let n = grid.count
    var pre = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    for i in grid.indices {
        for j in grid[i].indices {
            pre[i+1][j+1] = pre[i+1][j] + pre[i][j+1] - pre[i][j] + grid[i][j]
        }
    }
    
    func dfs(_ r0: Int, _ c0: Int, _ r1: Int, _ c1: Int) -> Node2 {
        let total = pre[r1][c1] - pre[r1][c0] - pre[r0][c1] + pre[r0][c0]
        if total == 0 {
            return Node2(false, true)
        }
        if total == (r1-r0)*(c1-c0) {
            return Node2(true, true)
        }
        
        let rMid = (r0 + r1) / 2
        let cMid = (c0 + c1) / 2
        
        let node2 = Node2(true, false)
        node2.topLeft = dfs(r0, c0, rMid, cMid)
        node2.topRight = dfs(r0, cMid, rMid, c1)
        node2.bottomLeft = dfs(rMid, c0, c1, cMid)
        node2.bottomRight = dfs(rMid, cMid, r1, c1)
        return node2
    }
    
    return dfs(0, 0, n, n)
     */
    
    func createNode(_ x1: Int, _ x2: Int, _ y1: Int, _ y2: Int) -> Node2 {
        if x1 == x2 {
            return Node2(grid[x1][y1] == 1, true)
        }
        if isLeft(x1, x2, y1, y2) {
            return Node2(grid[x1][y1] == 1, true)
        }
        
        let node = Node2(grid[x1][y1] == 1, false)
        
        let midx = (x2 + x1) / 2
        
        let midy = (y2 + y1) / 2
        
        node.topLeft = createNode(x1, midx, y1, midy)
        
        node.topRight = createNode(x1, midx, midy + 1, y2)
        
        node.bottomLeft = createNode(midx + 1, x2, y1, midy)
        
        node.bottomRight = createNode(midx + 1, x2, midy + 1, y2)
        
        return node
        
    }
    
    // 是否是叶子节点
    func isLeft(_ x1: Int, _ x2: Int, _ y1: Int, _ y2: Int) -> Bool {
        if x1 == x2 {
            return true
        }
        
        let temp = grid[x1][y1]
        
        for i in x1...x2 {
            for j in y1...y2 {
                if temp != grid[i][j] {
                    return false
                }
            }
        }
        
        return true
    }
    
    return createNode(0, grid.count - 1, 0, grid.count - 1)
}
