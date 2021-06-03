//
//  1404.numSteps.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/30.
//

import Foundation

/*
 1404. 将二进制表示减到 1 的步骤数
 难度
 中等
 
 20
 
 
 
 
 
 给你一个以二进制形式表示的数字 s 。请你返回按下述规则将其减少到 1 所需要的步骤数：
 
 如果当前数字为偶数，则将其除以 2 。
 
 如果当前数字为奇数，则将其加上 1 。
 
 题目保证你总是可以按上述规则将测试用例变为 1 。
 
 
 
 示例 1：
 
 输入：s = "1101"
 输出：6
 解释："1101" 表示十进制数 13 。
 Step 1) 13 是奇数，加 1 得到 14
 Step 2) 14 是偶数，除 2 得到 7
 Step 3) 7  是奇数，加 1 得到 8
 Step 4) 8  是偶数，除 2 得到 4
 Step 5) 4  是偶数，除 2 得到 2
 Step 6) 2  是偶数，除 2 得到 1
 示例 2：
 
 输入：s = "10"
 输出：1
 解释："10" 表示十进制数 2 。
 Step 1) 2 是偶数，除 2 得到 1
 示例 3：
 
 输入：s = "1"
 输出：0
 
 提示：
 
 1 <= s.length <= 500
 s 由字符 '0' 或 '1' 组成。
 s[0] == '1'
 
 */

func numSteps(_ s: String) -> Int {
    if s.count == 1 {
        return 0
    }
    var index = 0
    // meet1 记录我们有没有遇见过字符 1
    var meet1 = false
    for (i, v) in s.enumerated().reversed() {
        if v == "0" {
            // 如果当前字符为 0，分为两种情况
            // (1) 还没有遇见过字符 1，那么这个 0 是字符串低位的 0，需要一次除二操作
            // (2) 遇见过字符 1，那么这个 0 会因为它右侧的某次加一操作变为 1，因此它需要一次加一和一次除二操作
            index += meet1 ? 2 : 1
        } else {
            // 如果当前字符为 1，分为两种情况
            // (1) 还没有遇见过字符 1，那么这个 1 需要一次加一和一次除二操作
            //     这里需要考虑一种特殊情况，就是这个 1 是字符串最左侧的 1，它并不需要任何操作
            // (2) 遇见过字符 1，那么这个 1 会因为它右侧的某次加一操作变为 0，因此它只需要一次除二操作
            if !meet1 {
                if i != 0 {
                    index += 2
                }
                meet1 = true
            } else {
                index += 1
            }
        }
    }

    return index
}
