//
//  188.maxProfit.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/28.
//

import Foundation

/*
 188. 买卖股票的最佳时机 IV
 难度
 困难

 352

 给定一个整数数组 prices ，它的第 i 个元素 prices[i] 是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 示例 1：

 输入：k = 2, prices = [2,4,1]
 输出：2
 解释：在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。
 示例 2：

 输入：k = 2, prices = [3,2,6,5,0,3]
 输出：7
 解释：在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
 随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 。

 提示：

 0 <= k <= 109
 0 <= prices.length <= 1000
 0 <= prices[i] <= 1000
 */

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    if prices.count < 2 || k == 0 {
        return 0
    }
    if k >= prices.count {
        var res = 0
        for i in 1 ..< prices.count {
            if prices[i] > prices[i - 1] {
                res += prices[i] - prices[i - 1]
            }
        }
        return res
    } else {
        // profit[i][k][j] i: 天数(0...prices.count-1), k:交易多少次(0...k) j:是否拥有股票(0...1)
        var profit = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: -Int(Int16.max), count: 2), count: k + 1), count: prices.count)
        for i in 0 ..< prices.count {
            profit[i][0][0] = 0
        }
        for kk in 1 ... k {
            profit[0][kk][0] = 0
            profit[0][kk][1] = -prices[0]
        }
        for i in 1 ..< prices.count {
            for kk in 1 ... k {
                profit[i][kk][0] = max(profit[i - 1][kk][0], profit[i - 1][kk][1] + prices[i])
                profit[i][kk][1] = max(profit[i - 1][kk][1], profit[i - 1][kk - 1][0] - prices[i])
            }
        }

        let end = prices.count - 1
        var res = 0
        for kk in 0 ... k {
            res = max(res, profit[end][kk][0])
        }
        return res
    }
}

func maxProfit1(_ k: Int, _ prices: [Int]) -> Int {
    if prices.count < 2 || k == 0 {
        return 0
    }

    var buy = [Int](repeating: Int.min, count: k)
    var sell = [Int](repeating: 0, count: k)
    for i in 0 ..< prices.count {
        for j in 0 ..< k {
            if j == 0 {
                (buy[j], sell[j]) = (max(buy[j], -prices[i]), max(sell[j], buy[j] + prices[i]))
            } else {
                (buy[j], sell[j]) = (max(buy[j], sell[j - 1] - prices[i]), max(sell[j], buy[j] + prices[i]))
            }
        }
    }

    return sell[k - 1]
}
