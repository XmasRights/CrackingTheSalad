/*:
# Frequency Distribution Graph
 
 You can visualise the data but you will also need a human (🤖)
 
 Check the frequency distribution of a normal English sentence and then compare the graph to the cipher.
 Which letters occur the most and which the least? Count the offset of the highest to get your Caesar cipher offset number.
*/

import Foundation

// Implementation - you can move it later to `Sources/FrequencyDistribution.swift`

public func emptyDistributionAnalyse() -> [String : Int]
{
    return "ABCDEFGHIJKLMNOPQRSTUVWXYZ".reduce([String : Int]())
    {
        var dict = $0
        dict[String($1)] = 0
        return dict
    }
}

public func frequencyDistributionAnalyse(text: String) -> [String: Int] {

    var dictionary = emptyDistributionAnalyse()
    for char in text
    {
        let key = String(char).uppercased()
        guard let count = dictionary[key] else { continue }
        dictionary[key] = count + 1
    }
    
    return dictionary
}

// Test Data
let englishText = "Guess who originally said the following? Experience is the teacher of all things. I love the name of honor, more than I fear death. Fortune, which has a great deal of power in other matters but especially in war, can bring about great changes in a situation through very slight forces. Without training, they lacked knowledge. Without knowledge, they lacked confidence. Without confidence, they lacked victory."
let englishAnalyse = frequencyDistributionAnalyse(text: englishText)

let cipherText = "JHLZHY VUJL ZHPK 'PA PZ ILAALY AV JYLHAL AOHU AV SLHYU! JYLHAPUN PZ AOL LZZLUJL VM SPML.' JVUNYHAZ, FVB THUHNLK AV IYLHR AOL JVKL! XBPAL BUPXBL LEWLYPLUJL, PZU'A PA? FVB JHU UVD TVCL AV AOL ULEA AHZR DOPJO DPSS YLTVCL AOL ULLK VM H OBTHU."

let cipherAnalyse = frequencyDistributionAnalyse(text: cipherText)

/*:
 ## Visualise the data

 How to prepare data set for the Graph class?
 
 Feed it with an array of tuples `(key: String, value: Int)` and call `draw()` method to get an `UIImage`.
 
 [Tip: Click on the square on the right hand side to see the graph]
 
 Example:
 ````
 let dataset = [(key: "a", value: 10), (key: "b", value: 2), (key: "c", value: 20)]
 Graph(dataSet: dataset).draw()
 ````
 */

// Implementation - you can move it later to `Sources/FrequencyDistribution.swift`
public func prepareDataSetForFrequencyDistribution(from analyse: [String: Int]) -> [(key: String, value: Int)]
{
    return analyse.sorted(by: { $0.key < $1.key })
}

let englishAnalyseDataset = prepareDataSetForFrequencyDistribution(from: englishAnalyse)
Graph(dataSet: englishAnalyseDataset).draw()

let cipherAnalyseDataset = prepareDataSetForFrequencyDistribution(from: cipherAnalyse)
Graph(dataSet: cipherAnalyseDataset).draw()

// The offset is: 
// print(cipher(cipherText, offset: ))





