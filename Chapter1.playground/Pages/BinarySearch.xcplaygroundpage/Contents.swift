import Foundation


func binarySearch(arr: [Int], key: Int, left: Int, right: Int) -> Int {
    if (left > right) {
        return -1
    }
    var mid: Int = (left + right) / 2
    if arr[mid] == key {
        return mid
    } else if key < arr[mid] {
        return binarySearch(arr: arr, key: key, left: left, right: mid-1)
    } else {
       return binarySearch(arr: arr, key: key, left: mid+1, right: right)
    }
}


var arr: [Int] = [6,1,3,5,9,4,2,10,8,7]
arr.sort()
let key: Int = 10
var left: Int = 0
var right: Int = arr.count - 1
print("\(arr) 배열에서 \(key)의 위치는")
print(binarySearch(arr: arr, key: key, left: left, right: right))
