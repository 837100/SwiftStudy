import Foundation

let A = [ 30, 20, 40, 35, 5,10,45,50,25,15]

func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array
    let n = arr.count
    
    for i in 0..<n-1 {
        var minIndex = i
        for j in i+1..<n {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            arr.swapAt(i, minIndex)
        }
    }
    
    return arr
}

print("Original array: \(A)")
let sortedArray = selectionSort(A)
print("Sorted array: \(sortedArray)")
