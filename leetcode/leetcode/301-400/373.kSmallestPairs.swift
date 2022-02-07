//
//  373.kSmallestPairs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/14.
//

import Foundation

/*
 373. 查找和最小的K对数字
 难度
 中等
 
 259
 
 
 
 
 
 给定两个以升序排列的整数数组 nums1 和 nums2 , 以及一个整数 k 。
 
 定义一对值 (u,v)，其中第一个元素来自 nums1，第二个元素来自 nums2 。
 
 请找到和最小的 k 个数对 (u1,v1),  (u2,v2)  ...  (uk,vk) 。
 
 
 
 示例 1:
 
 输入: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 输出: [1,2],[1,4],[1,6]
 解释: 返回序列中的前 3 对数：
 [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 示例 2:
 
 输入: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
 输出: [1,1],[1,1]
 解释: 返回序列中的前 2 对数：
 [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
 示例 3:
 
 输入: nums1 = [1,2], nums2 = [3], k = 3
 输出: [1,3],[2,3]
 解释: 也可能序列中所有的数对都被返回:[1,3],[2,3]
 
 
 提示:
 
 1 <= nums1.length, nums2.length <= 10^4
 -10^9 <= nums1[i], nums2[i] <= 10^9
 nums1, nums2 均为升序排列
 1 <= k <= 1000

 */

func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
    let n = nums1.count
    let m = nums2.count
    
    var queue = [Int](repeating: 0, count: n)
    var res: [[Int]] = []
    while res.count < k {
        var cur = 0
        
        for i in 1..<n {
            if queue[i] == m {
                continue
            }
            
            if  queue[cur] == m ||
                    nums1[i] + nums2[queue[i]] < nums1[cur] + nums2[queue[cur]]  {
                cur = i
            }
        }
        
        if queue[cur] == m {
            break
        }
        
        res.append([nums1[cur], nums2[queue[cur]]])
        
        queue[cur] += 1
    }
    
    return res
}
