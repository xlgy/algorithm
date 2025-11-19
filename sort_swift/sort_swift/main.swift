//
//  main.swift
//  sort_swift
//
//  Created by 李雪阳 on 2025/11/18.
//

import Foundation


func bubbleSort(_ array: inout [Int]){
    let count = array.count
    for i in 0..<count{
        var isSwapped = false
        for j in 1..<count-i{
            if array[j]<array[j-1]{
                let temp = array[j]
                array[j] = array[j-1]
                array[j-1] = temp
                isSwapped = true
            }
        }
        if !isSwapped {
            break
        }
    }
}




func bubbleSort1(_ arr: inout [Int]){
    let count = arr.count
    for i in 0..<count{
        for j in 1..<count-i{
            if arr[j]<arr[j-1]{
                arr[j] = arr[j]^arr[j-1]
                arr[j-1] = arr[j]^arr[j-1]
                arr[j] = arr[j]^arr[j-1]
            }
        }
    }
}





var numbers = [5,4,3,2,1]
bubbleSort1(&numbers)
print(numbers)
