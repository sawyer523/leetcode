//
//  412.fizzBuzz.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/13.
//

import Foundation

/*
 412. Fizz Buzz
 难度
 简单

 115

 写一个程序，输出从 1 到 n 数字的字符串表示。

 1. 如果 n 是3的倍数，输出“Fizz”；

 2. 如果 n 是5的倍数，输出“Buzz”；

 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。

 示例：

 n = 15,

 返回:
 [
 "1",
 "2",
 "Fizz",
 "4",
 "Buzz",
 "Fizz",
 "7",
 "8",
 "Fizz",
 "Buzz",
 "11",
 "Fizz",
 "13",
 "14",
 "FizzBuzz"
 ]
 */

func fizzBuzz(_ n: Int) -> [String] {
    var ans: [String] = []
    var tp = ""
    for i in 1 ... n {
        tp = ""
        if i % 3 == 0 {
            tp.append("Fizz")
        }

        if i % 5 == 0 {
            tp.append("Buzz")
        }

        if tp.isEmpty {
            tp = String(i)
        }

        ans.append(tp)
    }

    return ans
}
