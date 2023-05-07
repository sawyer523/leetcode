//
//  30.findSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/23.
//

import Foundation

/*
 30. 串联所有单词的子串
 难度
 困难

 693

 收藏

 分享
 切换为英文
 接收动态
 反馈
 给定一个字符串 s 和一些 长度相同 的单词 words 。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。

 注意子串要与 words 中的单词完全匹配，中间不能有其他字符 ，但不需要考虑 words 中单词串联的顺序。

 示例 1：

 输入：s = "barfoothefoobarman", words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 示例 2：

 输入：s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 输出：[]
 示例 3：

 输入：s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 输出：[6,9,12]

 提示：

 1 <= s.length <= 10^4
 s 由小写英文字母组成
 1 <= words.length <= 5000
 1 <= words[i].length <= 30
 words[i] 由小写英文字母组成
 */

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    var dicts: [String: Int] = [:]
    for w in words {
        dicts[w, default: 0] += 1
    }

    var result = [Int]()
    let singleLen = words[0].count
    let totalLen = words.count * singleLen
    let cArray = Array(s)

    for i in 0 ..< singleLen {
        var start = i
        while start + totalLen <= cArray.count {
            var mDicts = dicts
            var curLen = 0
            let end = start + totalLen
            while curLen < totalLen {
                let str = String(cArray[end - curLen - singleLen ..< end - curLen])
                if let val = mDicts[str] {
                    if val > 0 {
                        curLen += singleLen
                        mDicts[str] = val - 1
                        continue
                    }
                }
                break
            }
            if curLen == totalLen {
                result.append(start)
                start += singleLen
            } else {
                start = end - curLen
            }
        }
    }
    return result
}
