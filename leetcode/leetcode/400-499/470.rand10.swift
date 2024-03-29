//
//  470.rand10.swift
//  470.rand10
//
//  Created by Xiaonan Chen on 2021/8/20.
//

import Foundation

/*
 470. 用 Rand7() 实现 Rand10()
 难度
 中等

 220

 已有方法 rand7 可生成 1 到 7 范围内的均匀随机整数，试写一个方法 rand10 生成 1 到 10 范围内的均匀随机整数。

 不要使用系统的 Math.random() 方法。

 示例 1:

 输入: 1
 输出: [7]
 示例 2:

 输入: 2
 输出: [8,4]
 示例 3:

 输入: 3
 输出: [8,1,10]

 提示:

 rand7 已定义。
 传入参数: n 表示 rand10 的调用次数。

 进阶:

 rand7()调用次数的 期望值 是多少 ?
 你能否尽量少调用 rand7() ?

 */

func rand10() -> Int {
    func rand7() -> Int {
        return 1
    }

    var a = 0
    var b = 0
    var idx = 0
    while true {
        a = rand7()
        b = rand7()
        idx = b + (a - 1) * 7
        if idx <= 40 {
            return 1 + (idx - 1) % 10
        }

        a = idx - 40
        b = rand7()
        idx = b + (a - 1) * 7
        if idx <= 60 {
            return 1 + (idx - 1) % 10
        }

        a = idx - 60
        b = rand7()

        idx = b + (a - 1) * 7
        if idx <= 20 {
            return 1 + (idx - 1) % 10
        }
    }
}
