//
//  954.canReorderDoubled.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/1.
//

import Foundation

/*
 954. 二倍数对数组
 难度
 中等

 92





 给定一个长度为偶数的整数数组 arr，只有对 arr 进行重组后可以满足 “对于每个 0 <= i < len(arr) / 2，都有 arr[2 * i + 1] = 2 * arr[2 * i]” 时，返回 true；否则，返回 false。

  

 示例 1：

 输入：arr = [3,1,3,6]
 输出：false
 示例 2：

 输入：arr = [2,1,2,6]
 输出：false
 示例 3：

 输入：arr = [4,-2,2,-4]
 输出：true
 解释：可以用 [-2,-4] 和 [2,4] 这两组组成 [-2,-4,2,4] 或是 [2,4,-2,-4]
  

 提示：

 0 <= arr.length <= 3 * 10^4
 arr.length 是偶数
 -10^5 <= arr[i] <= 10^5

 */

func canReorderDoubled(_ arr: [Int]) -> Bool {
    var cnt: [Int: Int] = [:]
    for x in arr {
        cnt[x, default: 0] += 1
    }
    
    if let n = cnt[0], n & 1 == 1 {
        return false
    }
    
    let keys = cnt.keys.sorted(by: {abs($0) < abs($1)})
    for key in keys {
        if cnt[2*key, default: 0] < cnt[key, default: 0] {
            return false
        }
        cnt[2*key, default: 0] -= cnt[key, default: 0]
    }
    
    return true
}
