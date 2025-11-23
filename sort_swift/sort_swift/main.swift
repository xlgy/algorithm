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
 鸡尾酒排序（英语：Cocktail shaker sort）
 亦为定向冒泡排序，鸡尾酒搅拌排序，搅拌排序也可以视作选择排序的一种变形），涟漪排序，来回排序或快乐小时排序，是冒泡排序的一种变形。此算法与冒泡排序的不同处在于排序时是以双向在序列中进行排序。
 鸡尾酒排序最糟或是平均所花费的次数都是O(n^2)，但如果序列在一开始已经大部分排序过的话，会接近O(n)
 */
func cocktailSort(_ array:inout [Int]){
    var left = 0
    var right = array.count-1
    
    while left<right{
        for i in left...right-1{
            if(array[i]>array[i+1]){
                ///>元素交换
                let temp = array[i]
                array[i] = array[i+1]
                array[i+1] = temp
            }
        }
        right-=1
        for i in (left+1...right).reversed(){
            if(array[i]<array[i-1]){
                ///>元素交换
                let temp = array[i]
                array[i] = array[i-1]
                array[i-1] = temp
            }
        }
        left+=1
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
        print(array)
    }
}



/**
 希尔排序（英语：Shellsort），也称递减增量排序算法，是插入排序的一种更高效的改进版本。希尔排序是非稳定排序算法。
 希尔排序是基于插入排序的以下两点性质而提出改进方法的：

 插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率
 但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位
 
 时间平均复杂度：O(n^1.3) 最坏复杂度:O(n^2) 最好复杂度: O(n) 空间复杂度: O(1) 不稳定
 */


func insertionSortStep(_ array:inout [Int]){
    let step = 1
    for i in step..<array.count{
        var j = i-step
        let current = array[i]
        while j>=0,array[j]>current{
            array[j+step] = array[j]
            j-=step
        }
        array[j+step] = current
        print(array)
    }
}

func shellSort(_ array:inout [Int]){
    var step = array.count/2
    while step>=1{
        print("步长：\(step)")
        for i in step..<array.count{
            var j = i-step
            let current = array[i]
            while j>=0,array[j]>current{
                array[j+step] = array[j]
                j-=step
            }
            array[j+step] = current
            
            print(array)
        }
        
        step = step/2
    }
}




/**
 归并排序（英语：Merge sort，或mergesort），是建立在归并操作上的一种有效的排序算法，效率为O(log n)。1945年由约翰·冯·诺伊曼首次提出。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用，且各层分治递归可以同时进行。
 */

func merge(_ arr1:[Int],_ arr2:[Int]) -> [Int]{
    var i = 0
    var j = 0
    var result:[Int] = []
    while i<arr1.count,j<arr2.count{
        if arr1[i] <= arr2[j] {
            result.append(arr1[i])
            i += 1
        } else {
            result.append(arr2[j])
            j += 1
        }
    }
    if i<arr1.count{
        result.append(contentsOf: arr1[i..<arr1.count])
    }else if j<arr2.count{
        result.append(contentsOf: arr2[j..<arr2.count])
    }
    return result
}

/**
 递归法（Top-down）
 1.把数组一再拆成两半
 2.直到每段长度为 1
 3.然后一路向上合并
 
 */
func mergeSortTopDown(_ array: [Int]) -> [Int] {
    // 如果数组长度 <= 1，则无需排序
    guard array.count > 1 else { return array }

    let middle = array.count / 2
    let left = mergeSortTopDown(Array(array[0..<middle]))
    let right = mergeSortTopDown(Array(array[middle..<array.count]))

    return merge(left,right)
}


/**
 迭代版（Bottom-Up）：
 1. 从最小的区段开始（长度 1）两两合并成长度 2 的有序段
 2. 然后合并成长度 4 的有序段
 再成为长度 8、16…
 */
func mergeSortBottomUp(_ array: [Int]) -> [Int] {
    var result:[Int] = array
    let n = array.count

    var size = 1
    var round = 1

    while size < n {
        var mArr:[Int] = []
        print("===== Round \(round), size = \(size) =====")
        var leftStart = 0
        
        while leftStart + size < n {
            let arr1 = Array(result[leftStart..<leftStart+size])
            let arr2 = Array(result[leftStart+size..<min(leftStart+2*size, n)])
            
            mArr.append(contentsOf: merge(arr1, arr2))
            leftStart += 2 * size
        }
        
        ///>合并操作完之后，原数组有剩余元素
        if n - leftStart>0{
            mArr.append(contentsOf: Array(result[leftStart..<result.count]))
        }

        print("After round \(round): \(mArr)\n")
        size *= 2
        round += 1
        result = mArr
    }

    return result
}



private func partition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
    let pivot = arr[high]    // 1️⃣ pivot 选右边最后一个
    var i = low              // 2️⃣ i 是“下一个要放小元素的位置”

    for j in low..<high {    // 3️⃣ j 用来扫描整个区间
        if arr[j] < pivot {  // 4️⃣ 找到比 pivot 小的
            arr.swapAt(i, j) // 放到左区
            i += 1           // i 往右移一格
        }
    }

    arr.swapAt(i, high)      // 5️⃣ 最后把 pivot 放到正确位置
    return i                 // 6️⃣ 返回 pivot 的位置
}

func quickSort(_ array:inout [Int], _ low: Int, _ high: Int){
    if low >= high{
        return
    }
    
    let p = partition(&array, low, high)
    quickSort(&array, low, p-1)
    quickSort(&array, p+1, high)
}


var numbers = [7,6,5,44,3,6,7,8,55,3,9,2,7,4,1]

quickSort(&numbers,0,numbers.count-1)
print("结果数组：\(numbers)")


var a = [9,8,7,6,5,4,3,2,1]
partition(&a, 0, 8)

