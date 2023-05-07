//
//  591.isValid.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/2.
//

import Foundation

/*
 591. 标签验证器
 难度
 困难

 90

 给定一个表示代码片段的字符串，你需要实现一个验证器来解析这段代码，并返回它是否合法。合法的代码片段需要遵守以下的所有规则：

 代码必须被合法的闭合标签包围。否则，代码是无效的。
 闭合标签（不一定合法）要严格符合格式：<TAG_NAME>TAG_CONTENT</TAG_NAME>。其中，<TAG_NAME>是起始标签，</TAG_NAME>是结束标签。起始和结束标签中的 TAG_NAME 应当相同。当且仅当 TAG_NAME 和 TAG_CONTENT 都是合法的，闭合标签才是合法的。
 合法的 TAG_NAME 仅含有大写字母，长度在范围 [1,9] 之间。否则，该 TAG_NAME 是不合法的。
 合法的 TAG_CONTENT 可以包含其他合法的闭合标签，cdata （请参考规则7）和任意字符（注意参考规则1）除了不匹配的<、不匹配的起始和结束标签、不匹配的或带有不合法 TAG_NAME 的闭合标签。否则，TAG_CONTENT 是不合法的。
 一个起始标签，如果没有具有相同 TAG_NAME 的结束标签与之匹配，是不合法的。反之亦然。不过，你也需要考虑标签嵌套的问题。
 一个<，如果你找不到一个后续的>与之匹配，是不合法的。并且当你找到一个<或</时，所有直到下一个>的前的字符，都应当被解析为 TAG_NAME（不一定合法）。
 cdata 有如下格式：<![CDATA[CDATA_CONTENT]]>。CDATA_CONTENT 的范围被定义成 <![CDATA[ 和后续的第一个 ]]>之间的字符。
 CDATA_CONTENT 可以包含任意字符。cdata 的功能是阻止验证器解析CDATA_CONTENT，所以即使其中有一些字符可以被解析为标签（无论合法还是不合法），也应该将它们视为常规字符。
 合法代码的例子:

 输入: "<DIV>This is the first line <![CDATA[<div>]]></DIV>"

 输出: True

 解释:

 代码被包含在了闭合的标签内： <DIV> 和 </DIV> 。

 TAG_NAME 是合法的，TAG_CONTENT 包含了一些字符和 cdata 。

 即使 CDATA_CONTENT 含有不匹配的起始标签和不合法的 TAG_NAME，它应该被视为普通的文本，而不是标签。

 所以 TAG_CONTENT 是合法的，因此代码是合法的。最终返回True。

 输入: "<DIV>>>  ![cdata[]] <![CDATA[<div>]>]]>]]>>]</DIV>"

 输出: True

 解释:

 我们首先将代码分割为： start_tag|tag_content|end_tag 。

 start_tag -> "<DIV>"

 end_tag -> "</DIV>"

 tag_content 也可被分割为： text1|cdata|text2 。

 text1 -> ">>  ![cdata[]] "

 cdata -> "<![CDATA[<div>]>]]>" ，其中 CDATA_CONTENT 为 "<div>]>"

 text2 -> "]]>>]"

 start_tag 不是 "<DIV>>>" 的原因参照规则 6 。
 cdata 不是 "<![CDATA[<div>]>]]>]]>" 的原因参照规则 7 。
 不合法代码的例子:

 输入: "<A>  <B> </A>   </B>"
 输出: False
 解释: 不合法。如果 "<A>" 是闭合的，那么 "<B>" 一定是不匹配的，反之亦然。

 输入: "<DIV>  div tag is not closed  <DIV>"
 输出: False

 输入: "<DIV>  unmatched <  </DIV>"
 输出: False

 输入: "<DIV> closed tags with invalid tag name  <b>123</b> </DIV>"
 输出: False

 输入: "<DIV> unmatched tags with invalid tag name  </1234567890> and <CDATA[[]]>  </DIV>"
 输出: False

 输入: "<DIV>  unmatched start tag <B>  and unmatched end tag </C>  </DIV>"
 输出: False
 注意:

 为简明起见，你可以假设输入的代码（包括提到的任意字符）只包含数字, 字母, '<','>','/','!','[',']'和' '。

 */

func isValid(_ code: String) -> Bool {
    func RegularExpression(regex: String, validateString: String) -> [String] {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regex, options: [])
            let matches = regex.matches(in: validateString, options: [], range: NSMakeRange(0, validateString.count))
            var data: [String] = Array()
            for item in matches {
                let string = (validateString as NSString).substring(with: item.range)

                data.append(string)
            }

            return data
        } catch {
            return []
        }
    }
    // Match CDATA as short as possible
    func removeCdatas(of code: inout String) {
        RegularExpression(regex: "<!\\[CDATA\\[.*?\\]\\]>", validateString: code).forEach {
            code = code.replacingOccurrences(of: $0, with: "a")
        }
    }

    func getTags(of code: String) -> Set<String> {
        return Set<String>(RegularExpression(regex: "<[A-Z]{1,9}>", validateString: code))
    }

    func getTagsQueue(of code: String) -> [String] {
        return RegularExpression(regex: "</?[A-Z]{1,9}>", validateString: code)
    }
    // <TAG_NAME>  ---> </TAG_NAME>
    func getEndTag(of startTags: Set<String>) -> (endTags: Set<String>, endToStart: [String: String]) {
        var ans = Set<String>()
        var map = [String: String]()
        for startTag in startTags {
            var t = startTag
            t.insert("/", at: t.index(after: t.startIndex))
            ans.insert(t)
            map[t] = startTag
        }
        return (ans, map)
    }

    // Rule2
    func checkTagPair(_ startTags: Set<String>, _: Set<String>, _ tagQueue: [String], _ map: [String: String]) -> Bool {
        var stack = [String]()
        for idx in 0 ..< tagQueue.count {
            let tag = tagQueue[idx]
            if startTags.contains(tag) {
                stack.append(tag)
            } else {
                guard let st = map[tag], let lt = stack.last, st == lt else {
                    return false
                }
                stack.removeLast()
                // Rule1
                if idx != tagQueue.count - 1 {
                    guard !stack.isEmpty else {
                        return false
                    }
                }
            }
        }
        return stack.isEmpty
    }

    // Check whether additional '<' in code
    func checkContains(_ character: Character, source str: String, _ startTags: Set<String>, _ endTags: Set<String>) -> Bool {
        var temp = str
        startTags.forEach { temp = temp.replacingOccurrences(of: $0, with: "") }
        endTags.forEach { temp = temp.replacingOccurrences(of: $0, with: "") }
        return temp.contains(character)
    }

    var codeCopy = code
    removeCdatas(of: &codeCopy)
    // Invalid TAG_NAME
    guard RegularExpression(regex: "</?[A-Z]{10,}>", validateString: codeCopy).isEmpty else {
        return false
    }
    // Get all <TAG_NAME>
    let startTags = getTags(of: codeCopy)
    guard !startTags.isEmpty else {
        return false
    }
    let (endTags, map) = getEndTag(of: startTags)
    let tagQueue = getTagsQueue(of: codeCopy)
    // Rule1
    guard codeCopy.hasSuffix(tagQueue.last!) && codeCopy.hasPrefix(tagQueue.first!) else {
        return false
    }
    // Rule4 about '<'
    guard !checkContains("<", source: codeCopy, startTags, endTags) else {
        return false
    }
    return checkTagPair(startTags, endTags, tagQueue, map)
}
