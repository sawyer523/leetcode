//
//  1108.defangIPaddr.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/21.
//

import Foundation

/*
 1108. IP 地址无效化
 难度
 简单

 91





 给你一个有效的 IPv4 地址 address，返回这个 IP 地址的无效化版本。

 所谓无效化 IP 地址，其实就是用 "[.]" 代替了每个 "."。

  

 示例 1：

 输入：address = "1.1.1.1"
 输出："1[.]1[.]1[.]1"
 示例 2：

 输入：address = "255.100.50.0"
 输出："255[.]100[.]50[.]0"
  

 提示：

 给出的 address 是一个有效的 IPv4 地址
 */

func defangIPaddr(_ address: String) -> String {
    return address.replacingOccurrences(of: ".", with: "[.]")
}
