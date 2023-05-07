//
//  553.optimalDivision.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/27.
//

import Foundation

/*
 553. 最优除法
 难度
 中等

 142

 给定一组正整数，相邻的整数之间将会进行浮点除法操作。例如， [2,3,4] -> 2 / 3 / 4 。

 但是，你可以在任意位置添加任意数目的括号，来改变算数的优先级。你需要找出怎么添加括号，才能得到最大的结果，并且返回相应的字符串格式的表达式。你的表达式不应该含有冗余的括号。

 示例：

 输入: [1000,100,10,2]
 输出: "1000/(100/10/2)"
 解释:
 1000/(100/10/2) = 1000/((100/10)/2) = 200
 但是，以下加粗的括号 "1000/((100/10)/2)" 是冗余的，
 因为他们并不影响操作的优先级，所以你需要返回 "1000/(100/10/2)"。

 其他用例:
 1000/(100/10)/2 = 50
 1000/(100/(10/2)) = 50
 1000/100/10/2 = 0.5
 1000/100/(10/2) = 2
 说明:

 输入数组的长度在 [1, 10] 之间。
 数组中每个元素的大小都在 [2, 1000] 之间。
 每个测试用例只有一个最优除法解。
 */

func optimalDivision(_ nums: [Int]) -> String {
    struct node {
        var minVal: Double
        var maxVal: Double
        var minStr: String
        var maxStr: String
        init(minVal v: Double) {
            self.minVal = v
            self.maxVal = 0
            self.minStr = ""
            self.maxStr = ""
        }
    }

    let n = nums.count
    var dp = [[node]](repeating: [node](repeating: node(minVal: 1e4), count: n), count: n)
    for i in 0 ..< n {
        dp[i][i].minVal = Double(nums[i])
        dp[i][i].maxVal = Double(nums[i])
        dp[i][i].minStr = String(nums[i])
        dp[i][i].maxStr = String(nums[i])
    }

    for i in 1 ..< n {
        for j in 0 ..< n - i {
            for k in j ..< j + i {
                if dp[j][j + i].maxVal < dp[j][k].maxVal / dp[k + 1][j + i].minVal {
                    dp[j][j + i].maxVal = dp[j][k].maxVal / dp[k + 1][j + i].minVal
                    if k + 1 == j + i {
                        dp[j][j + i].maxStr = dp[j][k].maxStr + "/" + dp[k + 1][j + i].minStr
                    } else {
                        dp[j][j + i].maxStr = dp[j][k].maxStr + "/(" + dp[k + 1][j + i].minStr + ")"
                    }
                }
                if dp[j][j + i].minVal > dp[j][k].minVal / dp[k + 1][j + i].maxVal {
                    dp[j][j + i].minVal = dp[j][k].minVal / dp[k + 1][j + i].maxVal
                    if k + 1 == j + i {
                        dp[j][j + i].minStr = dp[j][k].minStr + "/" + dp[k + 1][j + i].maxStr
                    } else {
                        dp[j][j + i].minStr = dp[j][k].minStr + "/(" + dp[k + 1][j + i].maxStr + ")"
                    }
                }
            }
        }
    }

    return dp[0][n - 1].maxStr
}
