import Foundation

class Errand{
    var egg: Int = 5
    var milk: Int = 0
    func cart () {
        milk = 1
        if egg > 0 {
            milk = 6
        }
    }
}
let myErrand = Errand()
print(myErrand.milk)

