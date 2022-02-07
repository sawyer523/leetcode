    //
    //  306.isAdditiveNumber.swift
    //  leetcode
    //
    //  Created by Xiaonan Chen on 2022/1/10.
    //

import Foundation

/*
 306. 累加数
 难度
 中等
 
 215
 
 
 
 
 
 累加数 是一个字符串，组成它的数字可以形成累加序列。
 
 一个有效的 累加序列 必须 至少 包含 3 个数。除了最开始的两个数以外，字符串中的其他数都等于它之前两个数相加的和。
 
 给你一个只包含数字 '0'-'9' 的字符串，编写一个算法来判断给定输入是否是 累加数 。如果是，返回 true ；否则，返回 false 。
 
 说明：累加序列里的数 不会 以 0 开头，所以不会出现 1, 2, 03 或者 1, 02, 3 的情况。
 
 
 
 示例 1：
 
 输入："112358"
 输出：true
 解释：累加序列为: 1, 1, 2, 3, 5, 8 。1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
 示例 2：
 
 输入："199100199"
 输出：true
 解释：累加序列为: 1, 99, 100, 199。1 + 99 = 100, 99 + 100 = 199
 
 
 提示：
 
 1 <= num.length <= 35
 num 仅由数字（0 - 9）组成
 
 */

func isAdditiveNumber(_ num: String) -> Bool {
    var numDigitChars = [Character]()
    let N = num.count
    func check(_ curIdx: Int, _ preVal: Int64, _ prepreVal: Int64) -> Bool {
        let curStr = String(numDigitChars[curIdx...])
        if curIdx == N {
            return true
        }
        
        let nextSum = preVal + prepreVal
        let nextSumStr = "\(nextSum)"
        if !curStr.hasPrefix(nextSumStr) {
            return false
        }
        return check(curIdx + nextSumStr.count, nextSum, preVal)
    }
    
    if N < 3 {
        return false
    }
    numDigitChars = Array(num)
    for i in 1...N-2 {
        let firstNum = Int64(String(numDigitChars[0..<i]))!
        if i > 1, numDigitChars[0] == Character("0") {
            break
        }
        
        for j in i+1...N-1 {
            let secondNum = Int64(String(numDigitChars[i..<j]))!
            if check(j, secondNum, firstNum) {
                return true
            } else {
                if numDigitChars[i] == Character("0") {
                    break
                }
            }
        }
    }
    return false
}
