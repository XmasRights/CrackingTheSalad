/*:
 # The Ultimate
 
 Let's use frequency and make computer seek for the right offset to crack the cipher 🔥
 */

import Foundation

// Implementation
func breakCaesarCipher(text: String) -> String
{
    let mostFrequentEnglishCharacter = "E"
    let mostFrequent = text.mostFrequentCharacter
    
    let offset = mostFrequent.ascii - mostFrequentEnglishCharacter.ascii
    
    return cipher(text, offset: -offset)
}


// Test Data

let cipherText = "XIVRK, XFFU AFS! KYRKJ RCC WFCBJ. KYREB PFL WFI YRIU NFIB REU YFGV KF JVV PFL EVOK KZDV FE REFKYVI JNZWK GLQQCV VMVEK! ZW PFL YRMV REP FKYVI HLVJKZFE GCVRJV IVRTY FLK MZR KNZKKVI"

let result = breakCaesarCipher(text: cipherText)
print(result)

