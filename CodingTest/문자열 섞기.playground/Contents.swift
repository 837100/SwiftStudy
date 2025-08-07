//길이가 같은 두 문자열 str1과 str2가 주어집니다.
//두 문자열의 각 문자가 앞에서부터 서로 번갈아가면서 한 번씩 등장하는 문자열을 만들어 return 하는 solution 함수를 완성해 주세요.

import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    var result: String = ""
    let arr1 = Array(str1)
    let arr2 = Array(str2)
    for i in 0..<str1.count {
        result.append(arr1[i])
        result.append(arr2[i])
    }
    return result
}

print(solution("aaaaa", "bbbbb"))
