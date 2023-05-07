//
//  535.codec.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/29.
//

import Foundation

/*
 535. TinyURL 的加密与解密
 难度
 中等

 168

 收藏

 分享
 切换为英文
 接收动态
 反馈
 TinyURL 是一种 URL 简化服务， 比如：当你输入一个 URL https://leetcode.com/problems/design-tinyurl 时，它将返回一个简化的URL http://tinyurl.com/4e9iAk 。请你设计一个类来加密与解密 TinyURL 。

 加密和解密算法如何设计和运作是没有限制的，你只需要保证一个 URL 可以被加密成一个 TinyURL ，并且这个 TinyURL 可以用解密方法恢复成原本的 URL 。

 实现 Solution 类：

 Solution() 初始化 TinyURL 系统对象。
 String encode(String longUrl) 返回 longURL 对应的 TinyURL 。
 String decode(String shortUrl) 返回 shortURL 原本的 URL 。题目数据保证给定的 shortURL 是由同一个系统对象加密的。

 示例：

 输入：url = "https://leetcode.com/problems/design-tinyurl"
 输出："https://leetcode.com/problems/design-tinyurl"

 解释：
 Solution obj = new Solution();
 string tiny = obj.encode(url); // 返回加密后得到的 TinyURL 。
 string ans = obj.decode(tiny); // 返回解密后得到的原本的 URL 。

 提示：

 1 <= url.length <= 10^4
 题目数据保证 url 是一个有效的 URL
 */

class Codec535 {
    private var m: [String: String] = [:]
    // Encodes a URL to a shortened URL.
    func encode(_ longURL: String) -> String {
        let key = "http://tinyurl.com/" + "\(longURL.hashValue)"
        m[key] = longURL
        return key
    }

    // Decodes a shortened URL to its original URL.
    func decode(_ shortURL: String) -> String {
        return m[shortURL]!
    }
}
