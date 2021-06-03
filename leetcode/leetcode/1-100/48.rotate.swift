//
//  48.rotate.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/19.
//

import Foundation

/*
 48. 旋转图像
 难度
 中等
 
 717
 
 
 
 
 
 给定一个 n × n 的二维矩阵表示一个图像。
 
 将图像顺时针旋转 90 度。
 
 说明：
 
 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
 
 示例 1:
 
 给定 matrix =
 [
    [1,2,3],
    [4,5,6],
    [7,8,9]
 ],
 
 原地旋转输入矩阵，使其变为:
 [
    [7,4,1],
    [8,5,2],
    [9,6,3]
 ]
 示例 2:
 
 给定 matrix =
 [
    [ 5, 1, 9,11],
    [ 2, 4, 8,10],
    [13, 3, 6, 7],
    [15,14,12,16]
 ],
 
 原地旋转输入矩阵，使其变为:
 [
    [15,13, 2, 5],
    [14, 3, 4, 1],
    [12, 6, 8, 9],
    [16, 7,10,11]
 ]
 
 */

func rotate(_ matrix: inout [[Int]]) {
    let a = matrix
    for i in 0..<a.count {
        for j in 0..<a[i].count {
            matrix[j][abs(i-(a.count - 1))] = a[i][j]
        }
    }
}

func rotate1(_ matrix: inout [[Int]]) {
    let n = matrix.count
    var temp = 0
    for i in 0 ..< n/2 {
        for j in 0 ..< (n+1)/2 {
            temp = matrix[i][j]
            matrix[i][j] = matrix[n-j-1][i]
            matrix[n-j-1][i] = matrix[n-i-1][n-j-1]
            matrix[n-i-1][n-j-1] = matrix[j][n-i-1]
            matrix[j][n-i-1] = temp
        }
    }
}

func rotate2(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0 ..< n/2 {
        matrix.swapAt(i, n-i-1)
    }

    var temp = 0
    for i in 0..<n {
        for j in 0..<i {
            temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
}
