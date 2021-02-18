//
//  119.getRow.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/12.
//

import Foundation

/*
 119. 杨辉三角 II
 难度
 简单

 232





 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。



 在杨辉三角中，每个数是它左上方和右上方的数的和。

 示例:

 输入: 3
 输出: [1,3,3,1]
 */

func getRow(_ rowIndex: Int) -> [Int] {
    var row = [Int](repeating: 1, count: rowIndex+1)
    if rowIndex < 1 {
        return row
    }
    for i in 1...rowIndex {
        row[i] = row[i-1]*(rowIndex-i+1)/i
    }
    return row
}
