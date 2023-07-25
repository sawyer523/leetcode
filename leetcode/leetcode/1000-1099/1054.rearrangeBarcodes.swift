//
// Created by Xiaonan Chen on 2023/5/14.
//

import Foundation

/*
  1054. 距离相等的条形码
 在一个仓库里，有一排条形码，其中第 i 个条形码为 barcodes[i]。

 请你重新排列这些条形码，使其中任意两个相邻的条形码不能相等。 你可以返回任何满足该要求的答案，此题保证存在答案。

 示例 1：

 输入：barcodes = [1,1,1,2,2,2]
 输出：[2,1,2,1,2,1]
 示例 2：

 输入：barcodes = [1,1,1,1,2,2,3,3]
 输出：[1,3,1,3,2,1,2,1]

 提示：

 1 <= barcodes.length <= 10000
 1 <= barcodes[i] <= 10000
  */

func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
    let n = barcodes.count
    if n < 2 {
        return barcodes
    }

    var counts: [Int: Int] = [:]
    var maxCount = 0
    for b in barcodes {
        counts[b, default: 0] += 1
        maxCount = max(maxCount, counts[b]!)
    }

    var evenIndex = 0
    var oddIndex = 1
    let halfLen = n / 2
    var res = [Int](repeating: 0, count: n)
    for (x, count) in counts {
        var count = count
        while 0 < count, count <= halfLen, oddIndex < n {
            res[oddIndex] = x
            count -= 1
            oddIndex += 2
        }
        while 0 < count {
            res[evenIndex] = x
            count -= 1
            evenIndex += 2
        }
    }
    return res
}
