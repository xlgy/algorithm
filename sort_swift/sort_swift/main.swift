//
//  main.swift
//  sort_swift
//
//  Created by 李雪阳 on 2025/11/18.
//

import Foundation

/**
 冒泡排序（英语：Bubble Sort）
 又称为泡式排序，是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
 
 时间平均复杂度：O(n^2) 最坏复杂度:O(n^2) 最好复杂度: O(n) 空间复杂度: O(n) 需要辅助空间O(1)
 
 冒泡排序算法的运作如下：

 比较相邻的元素。如果第一个比第二个大，就交换它们两个。
 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
 针对所有的元素重复以上的步骤，除了最后一个。
 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 */

func bubbleSort(_ array: inout [Int]){
    let count = array.count
    for i in 0..<count{
        for j in 1..<count-i{
            if array[j]<array[j-1]{
                ///>元素交换
                let temp = array[j]
                array[j] = array[j-1]
                array[j-1] = temp
            }
        }
    }
}

func bubbleSortBetter(_ array: inout [Int]){
    let count = array.count
    for i in 0..<count{
        var isChanged = false
        for j in 1..<count-i{
            if array[j]<array[j-1]{
                ///>元素交换(炫技版)
                array[j] = array[j]^array[j-1]
                array[j-1] = array[j]^array[j-1]
                array[j] = array[j]^array[j-1]
                isChanged = true
            }
        }
        if isChanged{
            break
        }
    }
}


/**
 选择排序（英语：Selection sort）
 是一种简单直观的排序算法。它的工作原理如下。首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。
 
 时间平均复杂度：O(n^2) 最坏复杂度:O(n^2) 最好复杂度: O(n^2) 空间复杂度: O(n) 需要辅助空间O(1)
 */


func selectionSort(_ array:inout [Int]) {
    let count = array.count
    for i in 0..<count{
        var min = i
        for j in i+1..<count{
            if array[j]<array[min]{
                min = j
            }
        }
        if i != min{
            ///>元素交换
            let temp = array[i]
            array[i] = array[min]
            array[min] = temp
        }
        
    }
}


/**
 插入排序（英语：Insertion Sort）
 是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。
 
 Insertion Sort 和打扑克牌时，从牌桌上逐一拿起扑克牌，在手上排序的过程相同。

 举例：

 输入： {5 2 4 6 1 3}。

 首先拿起第一张牌, 手上有 {5}。

 拿起第二张牌 2, 把 2 insert 到手上的牌 {5}, 得到 {2 5}。

 拿起第三张牌 4, 把 4 insert 到手上的牌 {2 5}, 得到 {2 4 5}。

 以此类推。
 
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：

 1. 从第一个元素开始，该元素可以认为已经被排序
 2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
 3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
 4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
 5. 将新元素插入到该位置后
 6. 重复步骤2~5
 
 
 如果目标是把n个元素的序列升序排列，那么采用插入排序存在最好情况和最坏情况。最好情况就是，序列已经是升序排列了，在这种情况下，需要进行的比较操作需
 n−1次即可。最坏情况就是，序列是降序排列，那么此时需要进行的比较共有1/2n(n−1)次。插入排序的赋值操作是比较操作的次数减去n−1次，（因为n−1次循环中，每一次循环的比较都比赋值多一个，多在最后那一次比较并不带来赋值）。平均来说插入排序算法复杂度为
 O(n^2)。

 */

func insertionSort(_ array:inout [Int]){
    for i in 1..<array.count{
        var j = i-1
        let current = array[i]
        while j>=0,array[j]>current{
            array[j+1] = array[j]
            j-=1
        }
        array[j+1] = current
    }
}

var numbers = [5,4,3,2,1]
insertionSort(&numbers)
print(numbers)
