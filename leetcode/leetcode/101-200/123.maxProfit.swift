//
//  123.maxProfit.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/9.
//

import Foundation

/*
 123. 买卖股票的最佳时机 III
 难度
 困难

 637





 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

  

 示例 1:

 输入：prices = [3,3,5,0,0,3,1,4]
 输出：6
 解释：在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
      随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。
 示例 2：

 输入：prices = [1,2,3,4,5]
 输出：4
 解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
      因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
 示例 3：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这个情况下, 没有交易完成, 所以最大利润为 0。
 示例 4：

 输入：prices = [1]
 输出：0
  

 提示：

 1 <= prices.length <= 105
 0 <= prices[i] <= 105

 */

func maxProfit(_ prices: [Int]) -> Int {
        let len = prices.count
        var profitOne0 = 0
        var profitOne1 = -prices[0]
        var profitTwo0 = 0
        var profitTwo1 = -prices[0]
        for i in 1..<len {
            profitTwo0 = max(profitTwo0, profitTwo1 + prices[i])
            profitTwo1 = max(profitTwo1, profitOne0 - prices[i])
            profitOne0 = max(profitOne0, profitOne1 + prices[i])
            profitOne1 = max(profitOne1, -prices[i])
        }
        return profitTwo0

    /*
     * dp
     *
     
     if prices.isEmpty {
             return 0
         }
         // profit[i][k][j] i: 天数(0...prices.count-1), k:交易多少次(0...k) j:是否拥有股票(0...1)
         var profit = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: 3), count: prices.count)
         
         profit[0][0][0] = 0
         profit[0][0][1] = -prices[0]

         profit[0][1][0] = -Int(Int16.max)
         profit[0][1][1] = -Int(Int16.max)

         profit[0][2][0] = -Int(Int16.max)
         profit[0][2][1] = -Int(Int16.max)
         
         for i in 1..<prices.count {
             profit[i][0][0] = profit[i-1][0][0] // 不动
             profit[i][0][1] = max(profit[i-1][0][1], profit[i-1][0][0] - prices[i])
             
             profit[i][1][0] = max(profit[i-1][1][0], profit[i-1][0][1] + prices[i])
             profit[i][1][1] = max(profit[i-1][1][1], profit[i-1][1][0] - prices[i])
             
             profit[i][2][0] = max(profit[i-1][2][0], profit[i-1][1][1] + prices[i])
         }
         
         let end = prices.count - 1
         return max(profit[end][0][0], profit[end][1][0], profit[end][2][0])
     */
}
