//
//  matrixScore.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/7.
//

import Foundation

/*
 861. 翻转矩阵后的得分
 难度
 中等

 184

 收藏

 分享
 切换为英文
 接收动态
 反馈

 有一个二维矩阵 A 其中每个元素的值为 0 或 1 。
 
 移动是指选择任一行或列，并转换该行或列中的每一个值：将所有 0 都更改为 1，将所有 1 都更改为 0。

 在做出任意次数的移动后，将该矩阵的每一行都按照二进制数来解释，矩阵的得分就是这些数字的总和。

 返回尽可能高的分数。

  

 示例：

 输入：[[0,0,1,1],[1,0,1,0],[1,1,0,0]]
 输出：39
 解释：
 转换为 [[1,1,1,1],[1,0,0,1],[1,1,1,1]]
 0b1111 + 0b1001 + 0b1111 = 15 + 9 + 15 = 39

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/score-after-flipping-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func matrixScore(_ A: [[Int]]) -> Int {
    if A.isEmpty {
        return 0
    }
    
    let m = A.count
    let n = A[0].count
    var ans = 1 << (n - 1) * m
    var ones = 0
    for j in 1..<n {
        ones = 0
        for a in A {
            if a[j] == a[0] {
                ones += 1
            }
        }
        if ones < m-ones {
            ones = m-ones
        }
        ans += 1 << (n - 1 - j) * ones
    }
    return ans
}


