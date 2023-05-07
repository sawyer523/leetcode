//
//  65.isNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/17.
//

import Foundation

/*
 65. 有效数字
 难度
 困难

 204

 有效数字（按顺序）可以分成以下几个部分：

 一个 小数 或者 整数
 （可选）一个 'e' 或 'E' ，后面跟着一个 整数
 小数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 下述格式之一：
 至少一位数字，后面跟着一个点 '.'
 至少一位数字，后面跟着一个点 '.' ，后面再跟着至少一位数字
 一个点 '.' ，后面跟着至少一位数字
 整数（按顺序）可以分成以下几个部分：

 （可选）一个符号字符（'+' 或 '-'）
 至少一位数字
 部分有效数字列举如下：

 ["2", "0089", "-0.1", "+3.14", "4.", "-.9", "2e10", "-90E3", "3e+7", "+6e-1", "53.5e93", "-123.456e789"]
 部分无效数字列举如下：

 ["abc", "1a", "1e", "e3", "99e2.5", "--6", "-+3", "95a54e53"]
 给你一个字符串 s ，如果 s 是一个 有效数字 ，请返回 true 。

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

 输入：s = ".1"
 输出：true

 提示：

 1 <= s.length <= 20
 s 仅含英文字母（大写和小写），数字（0-9），加号 '+' ，减号 '-' ，或者点 '.' 。

 */

func isNumber(_ s: String) -> Bool {
//    class Token {
//        enum TokenType {
//            case digit // 0-9
//            case exponent //"e"
//            case positiveSign // "+"
//            case negativeSign // "-"
//            case space // " "
//            case decimalPoint // "."
//            case unknown
//        }
//
//        let type: TokenType
//        let value: Character
//
//        init(_ character: Character) {
//            self.value = character
//
//            switch character {
//                case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
//                    self.type = .digit
//                case "e", "E":
//                    self.type = .exponent
//                case "+":
//                    self.type = .positiveSign
//                case "-":
//                    self.type = .negativeSign
//                case " ":
//                    self.type = .space
//                case ".":
//                    self.type = .decimalPoint
//                default:
//                    self.type = .unknown
//            }
//        }
//    }
//
//    class Evaluator {
//
//        var currentIndex = 0
//        var tokens: [Token]
//
//        init(_ string: String) {
//            let array = Array<Character>(string)
//
//            self.tokens = array.map(Token.init)
//        }
//
//        func evaluate() -> Bool {
//            var index = 0
//            return isNumber(from: &index) && index == tokens.count
//        }
//
//        func isType(_ type: Token.TokenType, at index: inout Int) -> Bool {
//            if index < tokens.count && tokens[index].type == type {
//                index += 1
//                return true
//            }
//
//            return false
//        }
//
//        func isNumber(from index: inout Int) -> Bool {
//            var tempIndex = index
//
//            while isType(.space, at: &tempIndex) {}
//
//            if isType(.negativeSign, at: &tempIndex) || isType(.positiveSign, at: &tempIndex) {}
//
//            if  (!isExponential(from: &tempIndex) && !isDecimalNumber(from: &tempIndex) && !areDigits(from: &tempIndex)) {
//
//                return false
//            }
//
//            while isType(.space, at: &tempIndex) {}
//
//            index = tempIndex
//            return true
//        }
//
//        func isExponential(from index: inout Int) -> Bool {
//            var tempIndex = index
//            if isDecimalNumber(from: &tempIndex) && isType(.exponent, at: &tempIndex) {
//
//                if isType(.positiveSign, at: &tempIndex) || isType(.negativeSign, at: &tempIndex) {}
//
//                if areDigits(from: &tempIndex) {
//                    index = tempIndex
//                    return true
//                }
//
//                return false
//            }
//
//            return false
//        }
//
//        func isDecimalNumber(from index: inout Int) -> Bool {
//            var tempIndex = index
//
//            if !areDigits(from: &tempIndex) {
//                if isType(.decimalPoint, at: &tempIndex) && areDigits(from: &tempIndex) {
//                    index = tempIndex
//                    return true
//                }
//
//                return false
//            }
//
//            if isType(.decimalPoint, at: &tempIndex) {
//
//                if areDigits(from: &tempIndex) {}
//
//                index = tempIndex
//                return true
//            }
//
//            index = tempIndex
//            return true
//        }
//
//        func areDigits(from index: inout Int) -> Bool {
//            var tempIndex = index
//
//            if !isType(.digit, at: &tempIndex) {
//                return false
//            }
//
//            while isType(.digit, at: &tempIndex) {}
//
//            index = tempIndex
//            return true
//        }
//    }
//    return Evaluator(s).evaluate()
    let s = Array(s)
    var i = 0
    var exp = false
    var dec = false
    var min = false
    var minExp = false
    var began = true
    var beganExp = false
    var beganDec = false
    var space = false
    while i < s.count {
        if s[i].isWholeNumber == false {
            if s[i] == " " {
                if min && began {
                    return false
                }
                space = true
                i += 1
                continue
            }
            if s[i] == "-" || s[i] == "+" {
                if ((space == true && !began) || dec == true) && !beganExp {
                    return false
                }
                if began && !min {
                    min = true
                    i += 1
                    continue
                } else if beganExp && !minExp {
                    minExp = true
                    i += 1
                    continue
                }
            }
            if s[i] == "." && dec == false && exp == false {
                if space && !began {
                    return false
                }
                dec = true
                beganDec = true
                space = false
                i += 1
                continue
            }
            if s[i].lowercased() == "e" && exp == false {
                if began == true {
                    return false
                }
                exp = true
                beganExp = true
                i += 1
                continue
            }
            return false
        } else {
            if space && (!began || beganDec) {
                return false
            }
            if exp && beganExp {
                beganExp = false
            }
            if dec && beganDec {
                beganDec = false
            }
            space = false
            began = false
        }
        i += 1
    }
    if exp && beganExp {
        return false
    }
    return !began
}
