//
//  05.02.printBin.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 面试题 05.02. 二进制数转字符串
 难度
 中等

 15

 二进制数转字符串。给定一个介于0和1之间的实数（如0.72），类型为double，打印它的二进制表达式。如果该数字无法精确地用32位以内的二进制表示，则打印“ERROR”。

 示例1:

  输入：0.625
  输出："0.101"
 示例2:

  输入：0.1
  输出："ERROR"
  提示：0.1无法被二进制准确表示
 提示：

 32位包括输出中的"0."这两位。
 */

func printBin(_ num: Double) -> String {
    var s = "0."
    var x = num
    while x != 0 {
        if 32 < s.count {
            return "ERROR"
        }
        x *= 2
        s += String(Int(x) & 1)
        if x >= 1 {
            x -= 1
        }
    }
    return s
}
