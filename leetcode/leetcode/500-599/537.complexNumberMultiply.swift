//
//  537.complexNumberMultiply.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/25.
//

import Foundation

/*
 537. 复数乘法
 难度
 中等

 82

 复数 可以用字符串表示，遵循 "实部+虚部i" 的形式，并满足下述条件：

 实部 是一个整数，取值范围是 [-100, 100]
 虚部 也是一个整数，取值范围是 [-100, 100]
 i2 == -1
 给你两个字符串表示的复数 num1 和 num2 ，请你遵循复数表示形式，返回表示它们乘积的字符串。

 示例 1：

 输入：num1 = "1+1i", num2 = "1+1i"
 输出："0+2i"
 解释：(1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i ，你需要将它转换为 0+2i 的形式。
 示例 2：

 输入：num1 = "1+-1i", num2 = "1+-1i"
 输出："0+-2i"
 解释：(1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i ，你需要将它转换为 0+-2i 的形式。

 提示：

 num1 和 num2 都是有效的复数表示。
 */

func complexNumberMultiply(_ num1: String, _ num2: String) -> String {
    func parse(_ num: String) -> (Int, Int) {
        let arr = num.split(separator: "+")
        let real = Int(arr[0])
        var com = Array(arr[1])
        com.removeLast()
        let imag = Int(String(com))
        return (real!, imag!)
    }

    let (r1, i1) = parse(num1)
    let (r2, i2) = parse(num2)
    return String(format: "%d+%di", r1 * r2 - i1 * i2, r1 * i2 + r2 * i1)
}
