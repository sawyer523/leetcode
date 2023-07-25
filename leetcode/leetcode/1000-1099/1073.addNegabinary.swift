//
//  1073.addNegabinary.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/18.
//

import Foundation

/*
 1073. 负二进制数相加
 给出基数为 -2 的两个数 arr1 和 arr2，返回两数相加的结果。

 数字以 数组形式 给出：数组由若干 0 和 1 组成，按最高有效位到最低有效位的顺序排列。例如，arr = [1,1,0,1] 表示数字 (-2)^3 + (-2)^2 + (-2)^0 = -3。数组形式 中的数字 arr 也同样不含前导零：即 arr == [0] 或 arr[0] == 1。

 返回相同表示形式的 arr1 和 arr2 相加的结果。两数的表示形式为：不含前导零、由若干 0 和 1 组成的数组。

 示例 1：

 输入：arr1 = [1,1,1,1,1], arr2 = [1,0,1]
 输出：[1,0,0,0,0]
 解释：arr1 表示 11，arr2 表示 5，输出表示 16 。
 示例 2：

 输入：arr1 = [0], arr2 = [0]
 输出：[0]
 示例 3：

 输入：arr1 = [0], arr2 = [1]
 输出：[1]

 提示：

 1 <= arr1.length, arr2.length <= 1000
 arr1[i] 和 arr2[i] 都是 0 或 1
 arr1 和 arr2 都没有前导0
 */

func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var i = arr1.count - 1
    var j = arr2.count - 1
    var carry = 0
    var ans: [Int] = []
    while 0 <= i ||
        0 <= j ||
        carry != 0 {
        var x = carry
        if 0 <= i {
            x += arr1[i]
        }
        if 0 <= j {
            x += arr2[j]
        }

        if 2 <= x {
            ans.append(x - 2)
            carry = -1
        } else if 0 <= x {
            ans.append(x)
            carry = 0
        } else {
            ans.append(1)
            carry = 1
        }
        i -= 1
        j -= 1
    }

    while 1 < ans.count, ans.last! == 0 {
        ans.removeLast()
    }

    return ans.reversed()
}
