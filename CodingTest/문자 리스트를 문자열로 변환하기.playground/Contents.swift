import Foundation

func solution(_ arr:[String]) -> String {
    var output:String = ""
    for i in arr {
        output.append(i)
    }
    return output
}

print(solution(["a","b","c"]))
