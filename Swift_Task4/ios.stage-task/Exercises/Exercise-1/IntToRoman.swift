import Foundation

public extension Int {
    
    var roman: String? {
        var intValue = self
        if intValue <= 0 { return nil }
        else {
            var numStr = ""
            let mappingList: [(Int, String)] = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
            for i in mappingList {
                while (intValue >= i.0) {
                    intValue -= i.0
                    numStr += i.1
                }
            }
            return numStr
        }
    }
}
