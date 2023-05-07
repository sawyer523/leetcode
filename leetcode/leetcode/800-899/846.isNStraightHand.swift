//
//  846.isNStraightHand.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/30.
//

import Foundation

/*
 846. 一手顺子
 难度
 中等

 134

 Alice 手中有一把牌，她想要重新排列这些牌，分成若干组，使每一组的牌数都是 groupSize ，并且由 groupSize 张连续的牌组成。

 给你一个整数数组 hand 其中 hand[i] 是写在第 i 张牌，和一个整数 groupSize 。如果她可能重新排列这些牌，返回 true ；否则，返回 false 。

 示例 1：

 输入：hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
 输出：true
 解释：Alice 手中的牌可以被重新排列为 [1,2,3]，[2,3,4]，[6,7,8]。
 示例 2：

 输入：hand = [1,2,3,4,5], groupSize = 4
 输出：false
 解释：Alice 手中的牌无法被重新排列成几个大小为 4 的组。

 提示：

 1 <= hand.length <= 10^4
 0 <= hand[i] <= 10^9
 1 <= groupSize <= hand.length

 */

func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
    if hand.count % groupSize > 0 {
        return false
    }

    let hand = hand.sorted()

    var cnt: [Int: Int] = [:]
    for h in hand {
        cnt[h, default: 0] += 1
    }

    for x in hand {
        if cnt[x] == 0 {
            continue
        }

        for num in x ..< x + groupSize {
            if cnt[num, default: 0] <= 0 {
                return false
            }
            cnt[num, default: 0] -= 1
        }
    }

    return true
}
