/*:
# Completing The Plain Component

One of the easiest methods to crack the code is to check all 26 possibilities (for English) and use a human to pick the answer 🤖
 
For that we will need a Caesar cipher implementation!
 
- Note:
 You can implement it below and when tests are passing move it to `Sources/CaesarCipher.swift` so you can access it in the next tasks.
 
*/

import UIKit
import XCTest

// Caesar Cipher implementation
extension Character
{
    var ascii: Int
    {
        guard let scalar = self.unicodeScalars.first else { preconditionFailure() }
        return Int(scalar.value)
    }
}

extension Int
{
    var character: Character
    {
        guard let scalar = Unicode.Scalar(self) else { preconditionFailure() }
        return Character(scalar)
    }
}

public func canCipher(_ ascii: Int) -> Bool
{
    return (ascii >= 65 && ascii <= 90)
}

public func cipher(_ string: String, offset: Int) -> String
{
    return string.map
    {   char -> String in

        let ascii = char.ascii
        guard canCipher(ascii) else { return String(char) }
        
        var shiftedValue = ascii + (offset % 26)
        shiftedValue = (shiftedValue < 65) ? shiftedValue + 26 : shiftedValue
        shiftedValue = (shiftedValue > 90) ? shiftedValue - 26 : shiftedValue

        return String(shiftedValue.character)
    }.joined()
}

// Tests
let testSubject = "SWIFT"

print(cipher(testSubject, offset: 70))

// Cipher and decipher 👉 should be the same as at the beginning
XCTAssertEqual(cipher(testSubject, offset: 4), "WAMJX")
XCTAssertEqual(cipher(cipher(testSubject, offset: -4), offset: 4), testSubject)
XCTAssertEqual(cipher(cipher(testSubject, offset: 70), offset: -70), testSubject)

/*:
 
 ## Bruteforce it 💣
 
*/
let superSecretText = "FAUW QGM ZSNW VGFW AL"

// Check all possibilities and show which offset is the answer

//for i in (1...25)
//{
//    print("\(i): \(cipher(superSecretText, offset: i))")
//}


// The answer is:  

