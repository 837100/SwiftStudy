import Foundation

func solution(_ my_string:String, _ k:Int) -> String {
    var output: String = ""
    for i in 0..<k {
        output.append(my_string)
    }
    return output
}

print(solution("string", 3))

