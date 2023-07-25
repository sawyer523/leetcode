//
//  19.pondSizes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/22.
//

import Foundation

/*
 面试题 16.19. 水域大小
 你有一个用于表示一片土地的整数矩阵land，该矩阵中每个点的值代表对应地点的海拔高度。若值为0则表示水域。由垂直、水平或对角连接的水域为池塘。池塘的大小是指相连接的水域的个数。编写一个方法来计算矩阵中所有池塘的大小，返回值需要从小到大排序。

 示例：

 输入：
 [
   [0,2,1,0],
   [0,1,0,1],
   [1,1,0,1],
   [0,1,0,1]
 ]
 输出： [1,2,4]
 提示：

 0 < len(land) <= 1000
 0 < len(land[i]) <= 1000
 */

func pondSizes(_ land: [[Int]]) -> [Int] {
    let m = land.count
    let n = land.first!.count
    var land = land
    func dfs(_ x: Int, _ y: Int) -> Int {
        if x < 0 ||
            m <= x ||
            y < 0 ||
            n <= y ||
            land[x][y] != 0 {
            return 0
        }

        land[x][y] = -1
        var res = 1
        for dx in -1 ... 1 {
            for dy in -1 ... 1 {
                if dx == 0 &&
                    dy == 0 {
                    continue
                }
                res += dfs(x + dx, y + dy)
            }
        }
        return res
    }
    var res: [Int] = []
    for i in 0 ..< m {
        for j in 0 ..< n {
            if land[i][j] == 0 {
                res.append(dfs(i, j))
            }
        }
    }
    return res.sorted()
}
