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




var numbers = [5,4,3,2,1]
selectionSort(&numbers)
print(numbers)
