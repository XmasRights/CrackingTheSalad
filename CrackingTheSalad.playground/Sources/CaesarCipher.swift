import Foundation

public extension String
{
    var ascii: Int
    {
        guard let scalar = self.unicodeScalars.first else { print("FAUKED ON \(self)"); preconditionFailure() }
        return Int(scalar.value)
    }
    
    var canCipher: Bool
    {
        return self.ascii.canCipher
    }
}

public extension Int
{
    var character: String
    {
        guard let scalar = Unicode.Scalar(self) else { preconditionFailure() }
        let char = Character(scalar)
        return String(char)
    }
    
    var canCipher: Bool
    {
        return (self >= 65 && self <= 90)
    }
}

public func cipher(_ string: String, offset: Int) -> String
{
    return string.uppercased()
                 .map { String($0) }
                 .map
        {   char -> String in
            
            guard char.canCipher else { return char }
            
            let ascii = char.ascii
            var shiftedValue = ascii + (offset % 26)
            shiftedValue = (shiftedValue < 65) ? shiftedValue + 26 : shiftedValue
            shiftedValue = (shiftedValue > 90) ? shiftedValue - 26 : shiftedValue
            
            return String(shiftedValue.character)
        }.joined()
}
