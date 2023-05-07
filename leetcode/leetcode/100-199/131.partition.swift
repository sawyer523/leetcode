//
//  131.partition.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/7.
//

import Foundation

/*
 131. 分割回文串
 难度
 中等

 554

 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

 返回 s 所有可能的分割方案。

 示例:

 输入: "aab"
 输出:
 [
    ["aa","b"],
    ["a","a","b"]
 ]
 */

func partition(_ s: String) -> [[String]] {
    func backtracking(_ result: inout [[String]], _ candidate: inout [String], _ characters: [Character], _ start: Int) {
        if start == characters.count {
            result.append(candidate)
        } else {
            for i in start ..< characters.count {
                if isPalindrome(characters, start, i) {
                    let character = String(characters[start ... i])
                    candidate.append(character)
                    backtracking(&result, &candidate, characters, i + 1)
                    candidate.removeLast()
                }
            }
        }
    }

    func isPalindrome(_ characters: [Character], _ low: Int, _ high: Int) -> Bool {
        var low = low
        var high = high

        while low < high {
            if characters[low] != characters[high] {
                return false
            }
            low += 1
            high -= 1
        }

        return true
    }

    var result = [[String]]()
    var candidate = [String]()

    backtracking(&result, &candidate, Array(s), 0)

    return result

//    func process(s: String, result: inout [[String]]) -> Void {
//        var res = [[Bool]](repeating: [Bool](repeating: false, count:s.count), count: s.count)
//
//        for line in 0..<s.count {
//            for column in 0..<s.count {
//                if line == column {
//                    res[line][column] = true
//                }
//            }
//        }
//
//        let chars = Array(s)
//
//        for i in (0..<s.count ).reversed() {
//            for j in (i + 1)..<(s.count) {
//                if j - i == 1 {
//                    res[i][j] = chars[i] == chars[j]
//                } else {
//                    res[i][j] = res[i + 1][j - 1] && chars[i] == chars[j]
//                }
//            }
//        }
//
//        find(res: res, start: 0, paths: &result, path: [String](), s: s)
//    }
//
//
//    func find(res:[[Bool]], start: Int, paths: inout [[String]], path: [String],s: String) -> Void {
//        if start == s.count {
//            paths.append(path)
//            return
//        }
//
//        for i in start..<s.count {
//            if res[start][i] {
//                var newPath = path
//                newPath.append(String(Array(s)[start...i]))
//                find(res: res, start: i + 1, paths: &paths, path: newPath, s: s)
//                newPath.removeLast()
//            }
//        }
//    }
//
//    var ret = [[String]]()
//    if s.count <= 1 {
//        return [[s]]
//    }
//    process(s: s, result: &ret)
//    return ret
}
