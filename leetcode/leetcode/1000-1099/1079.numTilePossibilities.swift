//
//  1079.numTilePossibilities.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/19.
//

import Foundation

/*
 1079. 活字印刷
 你有一套活字字模 tiles，其中每个字模上都刻有一个字母 tiles[i]。返回你可以印出的非空字母序列的数目。

 注意：本题中，每个活字字模只能使用一次。

 示例 1：

 输入："AAB"
 输出：8
 解释：可能的序列为 "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA"。
 示例 2：

 输入："AAABBC"
 输出：188
 示例 3：

 输入："V"
 输出：1

 提示：

 1 <= tiles.length <= 7
 tiles 由大写英文字母组成
 */

func numTilePossibilities(_ tiles: String) -> Int {
    var count: [Character: Int] = [:]
    for ch in tiles {
        count[ch, default: 0] += 1
    }

    func dfs(_ i: Int) -> Int {
        if i == 0 {
            return 1
        }

        var res = 1
        for (k, v) in count where 0 < v {
            count[k]! -= 1
            res += dfs(i - 1)
            count[k]! += 1
        }
        return res
    }

    return dfs(tiles.count) - 1
}
