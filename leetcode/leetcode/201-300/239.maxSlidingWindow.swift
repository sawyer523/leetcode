//
//  239.maxSlidingWindow.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 239. 滑动窗口最大值
 难度
 困难

 691





 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 示例 1：

 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 示例 2：

 输入：nums = [1], k = 1
 输出：[1]
 示例 3：

 输入：nums = [1,-1], k = 1
 输出：[1,-1]
 示例 4：

 输入：nums = [9,11], k = 2
 输出：[11]
 示例 5：

 输入：nums = [4,-2], k = 2
 输出：[4]
  

 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length
 */

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    /*
     * 单调队列
     时间复杂度: O(nlogn)
     空间复杂度: O(n)
     
     if nums.isEmpty {
     return []
     }
     
     var ans: [Int] = []
     var windows: [Int] = []
     
     for (i, v) in nums.enumerated() {
     if k <= i && windows[0] <= i - k {
     windows.removeFirst()
     }
     
     while !windows.isEmpty && nums[windows.last!] <= v {
     windows.removeLast()
     }
     
     windows.append(i)
     
     if k-1 <= i {
     ans.append(nums[windows[0]])
     }
     }
     
     return ans
    */

    /*
     分块 + 预处理
     时间复杂度：O(n)
     空间复杂度：O(n)
     */
    var left = Array(repeating: 0, count: nums.count)
    var right = Array(repeating: 0, count: nums.count)

    left[0] = nums[0]
    right[nums.count - 1] = nums[nums.count - 1]

    for i in 1..<nums.count {
        left[i] = (i % k == 0 ?  nums[i] :  max(left[i - 1], nums[i]))
        let j = nums.count - i - 1
        right[j] = (j + 1) % k == 0 ? nums[j] : max(right[j + 1], nums[j])
    }

    var res = [Int]()
    for i in 0..<(nums.count - k + 1) {
        let j = i + k - 1
        res.append(max(right[i], left[j]))
    }
    return res
}
