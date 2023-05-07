//
//  1147.longestDecomposition.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/12.
//

import Foundation

/*
 1147. 段式回文
 你会得到一个字符串 text 。你应该把它分成 k 个子字符串 (subtext1, subtext2，…， subtextk) ，要求满足:

 subtexti 是 非空 字符串
 所有子字符串的连接等于 text ( 即subtext1 + subtext2 + ... + subtextk == text )
 对于所有 i 的有效值( 即 1 <= i <= k ) ，subtexti == subtextk - i + 1 均成立
 返回k可能最大值。

 示例 1：

 输入：text = "ghiabcdefhelloadamhelloabcdefghi"
 输出：7
 解释：我们可以把字符串拆分成 "(ghi)(abcdef)(hello)(adam)(hello)(abcdef)(ghi)"。
 示例 2：

 输入：text = "merchant"
 输出：1
 解释：我们可以把字符串拆分成 "(merchant)"。
 示例 3：

 输入：text = "antaprezatepzapreanta"
 输出：11
 解释：我们可以把字符串拆分成 "(a)(nt)(a)(pre)(za)(tpe)(za)(pre)(a)(nt)(a)"。

 提示：

 1 <= text.length <= 1000
 text 仅由小写英文字符组成
 */

func longestDecomposition(_ text: String) -> Int {
    var maxlenght = 0
    var flag = false

    func dfs(_ array: [Character], _ current: Int) {
        if flag == true {
            return
        }

        if array.isEmpty {
            maxlenght = max(maxlenght, current)
            flag = true
            return
        }

        var left = 0
        var right = array.count - 1
        var leftStr = [Character]()
        var rightStr = [Character]()

        while left < right {
            leftStr.append(array[left])
            rightStr.insert(array[right], at: 0)
            //! 如果可以分割，继续分割
            if leftStr == rightStr {
                dfs(Array(array[left + 1 ..< right]), current + 2)
            }
            left += 1
            right -= 1
        }
        maxlenght = max(maxlenght, current + 1)
    }

    dfs(Array(text), 0)
    return maxlenght
}
