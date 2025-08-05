import Foundation

//let inp = readLine()!.components(separatedBy: [" "]).map { $0 }
//let (s1, s2) = (inp[0], inp[1])

let (s1, s2) = ("apple", "pen")

var noSpacesS1 = s1.replacingOccurrences(of: " ", with: "")
var noSpacesS2 = s2.replacingOccurrences(of: " ", with: "")

print(noSpacesS1)
print(noSpacesS2)
print("s1 = \(s1)")
print("s2 = \(s2)")
print(s1+s2)
