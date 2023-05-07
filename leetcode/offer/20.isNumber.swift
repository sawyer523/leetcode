//
//  20.isNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/5.
//

import Foundation

/*
 剑指 Offer 20. 表示数值的字符串
 请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。

 数值（按顺序）可以分成以下几个部分：

 若干空格
 一个 小数 或者 整数
 （可选）一个 'e' 或 'E' ，后面跟着一个 整数
 若干空格
 小数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 下述格式之一：
 至少一位数字，后面跟着一个点 '.'
 至少一位数字，后面跟着一个点 '.' ，后面再跟着至少一位数字
 一个点 '.' ，后面跟着至少一位数字
 整数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 至少一位数字
 部分数值列举如下：

 ["+100", "5e2", "-123", "3.1416", "-1E-16", "0123"]
 部分非数值列举如下：

 ["12e", "1a3.14", "1.2.3", "+-5", "12e+5.4"]

 示例 1：

 输入：s = "0"
 输出：true
 示例 2：

 输入：s = "e"
 输出：false
 示例 3：

 输入：s = "."
 输出：false
 示例 4：

 输入：s = "    .1  "
 输出：true

 提示：

 1 <= s.length <= 20
 s 仅含英文字母（大写和小写），数字（0-9），加号 '+' ，减号 '-' ，空格 ' ' 或者点 '.' 。
 */

func isNumber2(_ s: String) -> Bool {
    enum State: Int {
        case startBlank = 0
        case sign = 1
        case digit = 2
        case dotDigit = 3
        case dotDigitAfterBlank = 4
        case e = 5
        case eSign = 6
        case sDigit = 7
        case endBlank = 8

        func apply(input: Character) -> State? {
            if input.isWhitespace {
                return applyBlank()
            } else if input == "+" || input == "-" {
                return applySign()
            } else if input.isNumber {
                return applyDigit()
            } else if input == "." {
                return applyDot()
            } else if input == "e" || input == "E" {
                return applyE()
            } else {
                return nil
            }
        }

        func applyBlank() -> State? {
            switch self {
            case .startBlank: return .startBlank
            case .digit: return .endBlank
            case .dotDigit: return .endBlank
            case .sDigit: return .endBlank
            case .endBlank: return .endBlank
            default: return nil
            }
        }

        func applySign() -> State? {
            switch self {
            case .startBlank: return .sign
            case .e: return .eSign
            default: return nil
            }
        }

        func applyDigit() -> State? {
            switch self {
            case .startBlank: return .digit
            case .sign: return .digit
            case .digit: return .digit
            case .dotDigit: return .dotDigit
            case .dotDigitAfterBlank: return .dotDigit
            case .e: return .sDigit
            case .eSign: return .sDigit
            case .sDigit: return .sDigit
            default: return nil
            }
        }

        func applyDot() -> State? {
            switch self {
            case .startBlank: return .dotDigitAfterBlank
            case .sign: return .dotDigitAfterBlank
            case .digit: return .dotDigit
            default: return nil
            }
        }

        func applyE() -> State? {
            switch self {
            case .digit: return .e
            case .dotDigit: return .e
            default: return nil
            }
        }
    }

    var state: State? = State.startBlank
    for ch in s {
        state = state!.apply(input: ch)
        guard state != nil else {
            return false
        }
    }
    return state! == .digit || state! == .dotDigit || state! == .sDigit || state! == .endBlank
}
