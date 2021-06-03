//
//  1310.xorQueries.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/12.
//

import Foundation

/*
 1310. 子数组异或查询
 难度
 中等
 
 81
 
 
 
 
 
 有一个正整数数组 arr，现给你一个对应的查询数组 queries，其中 queries[i] = [Li, Ri]。
 
 对于每个查询 i，请你计算从 Li 到 Ri 的 XOR 值（即 arr[Li] xor arr[Li+1] xor ... xor arr[Ri]）作为本次查询的结果。
 
 并返回一个包含给定查询 queries 所有结果的数组。
 
 
 
 示例 1：
 
 输入：arr = [1,3,4,8], queries = [[0,1],[1,2],[0,3],[3,3]]
 输出：[2,7,14,8]
 解释：
 数组中元素的二进制表示形式是：
 1 = 0001
 3 = 0011
 4 = 0100
 8 = 1000
 查询的 XOR 值为：
 [0,1] = 1 xor 3 = 2
 [1,2] = 3 xor 4 = 7
 [0,3] = 1 xor 3 xor 4 xor 8 = 14
 [3,3] = 8
 示例 2：
 
 输入：arr = [4,8,2,10], queries = [[2,3],[1,3],[0,0],[0,3]]
 输出：[8,0,4,4]
 
 
 提示：
 
 1 <= arr.length <= 3 * 10^4
 1 <= arr[i] <= 10^9
 1 <= queries.length <= 3 * 10^4
 queries[i].length == 2
 0 <= queries[i][0] <= queries[i][1] < arr.length
 */

func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
    var xors = [Int](repeating: 0, count: arr.count+1)
    for i in 0..<arr.count {
        xors[i+1] = xors[i]^arr[i]
    }

    var res = [Int](repeating: 0, count: queries.count)
    for i in 0..<queries.count {
        res[i] = xors[queries[i][0]] ^ xors[queries[i][1]+1]
    }
    return res
}
