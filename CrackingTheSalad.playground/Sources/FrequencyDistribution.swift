import Foundation

public extension String
{
    var mostFrequentCharacter: String
    {
        let analysis = frequencyDistributionAnalyse(text: self)
        let dataSet = prepareDataSetForFrequencyDistribution(from: analysis)
        return mostFrequentChar(distribution: dataSet)
    }
}

// Paste you frequency distribution solution here when ready
public func frequencyDistributionAnalyse(text: String) -> [String : Int] {
    
    var dictionary = [String : Int]()
    for char in text
    {
        let key = String(char).uppercased()
        guard key.canCipher else { continue }
        
        let count = dictionary[key] ?? 0
        dictionary[key] = count + 1
    }
    
    return dictionary
}

public func prepareDataSetForFrequencyDistribution(from analyse: [String: Int]) -> [(key: String, value: Int)]
{
    return analyse.sorted(by: { $0.key < $1.key })
}

func mostFrequentChar(distribution: [(key: String, value: Int)]) -> String
{
    guard let entry = distribution.sorted(by: { $0.value > $1.value }).first else { return "" }
    return entry.key
}
