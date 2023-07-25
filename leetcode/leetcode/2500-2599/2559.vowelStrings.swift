//
//  2559.vowelStrings.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/2.
//

import Foundation

/*
 2559. 统计范围内的元音字符串数
 给你一个下标从 0 开始的字符串数组 words 以及一个二维整数数组 queries 。

 每个查询 queries[i] = [li, ri] 会要求我们统计在 words 中下标在 li 到 ri 范围内（包含 这两个值）并且以元音开头和结尾的字符串的数目。

 返回一个整数数组，其中数组的第 i 个元素对应第 i 个查询的答案。

 注意：元音字母是 'a'、'e'、'i'、'o' 和 'u' 。

 示例 1：

 输入：words = ["aba","bcb","ece","aa","e"], queries = [[0,2],[1,4],[1,1]]
 输出：[2,3,0]
 解释：以元音开头和结尾的字符串是 "aba"、"ece"、"aa" 和 "e" 。
 查询 [0,2] 结果为 2（字符串 "aba" 和 "ece"）。
 查询 [1,4] 结果为 3（字符串 "ece"、"aa"、"e"）。
 查询 [1,1] 结果为 0 。
 返回结果 [2,3,0] 。
 示例 2：

 输入：words = ["a","e","i"], queries = [[0,2],[0,1],[2,2]]
 输出：[3,2,1]
 解释：每个字符串都满足这一条件，所以返回 [3,2,1] 。

 提示：

 1 <= words.length <= 10^5
 1 <= words[i].length <= 40
 words[i] 仅由小写英文字母组成
 sum(words[i].length) <= 3 * 10^5
 1 <= queries.length <= 10^5
 0 <= queries[j][0] <= queries[j][1] < words.length
 */

func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
    let vowelSet: Set<Character> = ["a", "e", "i", "o", "u"]
    func isVowelString(_ word: String) -> Bool {
        return isVowelLetter(word.first!) &&
            isVowelLetter(word.last!)
    }

    func isVowelLetter(_ ch: Character) -> Bool {
        return vowelSet.contains(ch)
    }

    let n = words.count
    var prefixSums = [Int](repeating: 0, count: n + 1)
    for i in 0 ..< n {
        var value = 0
        if isVowelString(words[i]) {
            value = 1
        }
        prefixSums[i + 1] = prefixSums[i] + value
    }

    var ans = [Int](repeating: 0, count: queries.count)
    for i in 0 ..< queries.count {
        let start = queries[i][0]
        let end = queries[i][1]
        ans[i] = prefixSums[end + 1] - prefixSums[start]
    }

    return ans
}
