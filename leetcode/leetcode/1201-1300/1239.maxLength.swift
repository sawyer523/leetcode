//
//  1239.maxLenght.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/19.
//

import Foundation

/*
 1239. 串联字符串的最大长度
 难度
 中等
 
 155
 
 
 
 
 
 给定一个字符串数组 arr，字符串 s 是将 arr 某一子序列字符串连接所得的字符串，如果 s 中的每一个字符都只出现过一次，那么它就是一个可行解。
 
 请返回所有可行解 s 中最长长度。
 
 
 
 示例 1：
 
 输入：arr = ["un","iq","ue"]
 输出：4
 解释：所有可能的串联组合是 "","un","iq","ue","uniq" 和 "ique"，最大长度为 4。
 示例 2：
 
 输入：arr = ["cha","r","act","ers"]
 输出：6
 解释：可能的解答有 "chaers" 和 "acters"。
 示例 3：
 
 输入：arr = ["abcdefghijklmnopqrstuvwxyz"]
 输出：26
 
 
 提示：
 
 1 <= arr.length <= 16
 1 <= arr[i].length <= 26
 arr[i] 中只含有小写英文字母
 */

func maxLength(_ arr: [String]) -> Int {
    var maxVal = Int.min

    func helper(_ arr: [String], _ index: Int, _ current: inout Set<Character>) {
        maxVal = max(maxVal, current.count)
        if index == arr.count { return }
        let item = arr[index]
        var found = false
        for char in item {
            if current.contains(char) {
                found = true
                break
            }
        }
        if found == false {
            for char in item { current.insert(char) }
            helper(arr, index+1, &current)
            for char in item { current.remove(char) }
        }
        helper(arr, index+1, &current)
    }

    func isUniqu(_ item: String) -> Bool {
        var set: Set<Character> = Set()
        for char in item {
            if set.contains(char) {return false}
            set.insert(char)
        }
        return true
    }
    

    var sArr: [String] = []
    for item in arr {
        if isUniqu(item) { sArr.append(item)}
    }
    
    var set: Set<Character> = Set()
    helper(sArr, 0, &set)
    
    return maxVal
}
