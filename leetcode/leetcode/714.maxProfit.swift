//
//  maxProfit.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/17.
//

import Foundation

/*
 714. 买卖股票的最佳时机含手续费
 难度
 中等

 361





 给定一个整数数组 prices，其中第 i 个元素代表了第 i 天的股票价格 ；非负整数 fee 代表了交易股票的手续费用。

 你可以无限次地完成交易，但是你每笔交易都需要付手续费。如果你已经购买了一个股票，在卖出它之前你就不能再继续购买股票了。

 返回获得利润的最大值。

 注意：这里的一笔交易指买入持有并卖出股票的整个过程，每笔交易你只需要为支付一次手续费。

 示例 1:

 输入: prices = [1, 3, 2, 8, 4, 9], fee = 2
 输出: 8
 解释: 能够达到的最大利润:
 在此处买入 prices[0] = 1
 在此处卖出 prices[3] = 8
 在此处买入 prices[4] = 4
 在此处卖出 prices[5] = 9
 总利润: ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
 注意:

 0 < prices.length <= 50000.
 0 < prices[i] < 50000.
 0 <= fee < 50000.
 */

func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
    let length = prices.count
    if length < 2 {
        return 0
    }
    var sell = 0
    var buy = -prices[0] - fee
    
    var pre_sell = sell
    var pre_buy = buy
    
    for i in 1..<length {
        sell = max(pre_sell, pre_buy + prices[i])
        buy = max(buy, pre_sell - prices[i] - fee)
        pre_sell = sell
        pre_buy = buy
    }
    
    return sell
}
