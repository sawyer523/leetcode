//
//  745.wordFilter.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/14.
//

import Foundation

/*
 745. 前缀和后缀搜索
 难度
 困难

 105

 设计一个包含一些单词的特殊词典，并能够通过前缀和后缀来检索单词。

 实现 WordFilter 类：

 WordFilter(string[] words) 使用词典中的单词 words 初始化对象。
 f(string pref, string suff) 返回词典中具有前缀 prefix 和后缀 suff 的单词的下标。如果存在不止一个满足要求的下标，返回其中 最大的下标 。如果不存在这样的单词，返回 -1 。

 示例：

 输入
 ["WordFilter", "f"]
 [[["apple"]], ["a", "e"]]
 输出
 [null, 0]
 解释
 WordFilter wordFilter = new WordFilter(["apple"]);
 wordFilter.f("a", "e"); // 返回 0 ，因为下标为 0 的单词：前缀 prefix = "a" 且 后缀 suff = "e" 。

 提示：

 1 <= words.length <= 10^4
 1 <= words[i].length <= 7
 1 <= pref.length, suff.length <= 7
 words[i]、pref 和 suff 仅由小写英文字母组成
 最多对函数 f 执行 10^4 次调用
 */

class WordFilter {
    private class Trie {
        var children: [String: Trie]
        var weight: [String: Int]
        init() {
            children = [:]
            weight = [:]
        }
    }

    private var trie: Trie? = Trie()
    private let weightKey = "##"
    init(_ words: [String]) {
        for i in 0 ..< words.count {
            let word = words[i]
            var cur = trie
            let n = word.count
            for j in 0 ..< n {
                var tmp = cur
                for k in j ..< n {
                    let idx = word.index(word.startIndex, offsetBy: k)
                    let key = String(word[idx]) + "#"
                    if tmp?.children[key] == nil {
                        tmp?.children[key] = Trie()
                    }
                    tmp = tmp?.children[key]
                    tmp?.weight[weightKey] = i
                }

                tmp = cur
                for k in j ..< n {
                    let idx = word.index(word.endIndex, offsetBy: -k - 1)
                    let key = "#" + String(word[idx])
                    if tmp?.children[key] == nil {
                        tmp?.children[key] = Trie()
                    }
                    tmp = tmp?.children[key]
                    tmp?.weight[weightKey] = i
                }

                let idx1 = word.index(word.startIndex, offsetBy: j)
                let idx2 = word.index(word.endIndex, offsetBy: -j - 1)
                let key = String(word[idx1]) + String(word[idx2])
                if cur?.children[key] == nil {
                    cur?.children[key] = Trie()
                }
                cur = cur?.children[key]
                cur?.weight[weightKey] = i
            }
        }
    }

    func f(_ pref: String, _ suff: String) -> Int {
        var cur = trie
        let n = max(pref.count, suff.count)
        for i in 0 ..< n {
            let c1 = i < pref.count ? pref[pref.index(pref.startIndex, offsetBy: i)] : Character("#")
            let c2 = i < suff.count ? suff[suff.index(suff.endIndex, offsetBy: -1 - i)] : Character("#")
            let key = String(c1) + String(c2)
            if cur?.children[key] == nil {
                cur?.children[key] = Trie()
            }
            cur = cur?.children[key]
        }
        return cur?.weight[weightKey] ?? -1
    }
}
