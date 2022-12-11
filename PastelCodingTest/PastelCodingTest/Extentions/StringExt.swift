//
//  StringExt.swift
//  PastelCodingTest
//
//  Created by mac on 11/12/2022.
//

import UIKit

extension String {
    
    public var initials: String {
        
        let words = components(separatedBy: .whitespacesAndNewlines)
        
        //to identify letters
        let letters = CharacterSet.letters
        var firstChar : String = ""
        var secondChar : String = ""
        var firstCharFoundIndex : Int = -1
        var firstCharFound : Bool = false
        var secondCharFound : Bool = false
        
        for (index, item) in words.enumerated() {
            
            if item.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                continue
            }
            
            //browse through the rest of the word
            for (_, char) in item.unicodeScalars.enumerated() {
                
                //check if its a aplha
                if letters.contains(char) {
                    
                    if !firstCharFound {
                        firstChar = String(char)
                        firstCharFound = true
                        firstCharFoundIndex = index
                        
                    } else if !secondCharFound {
                        
                        secondChar = String(char)
                        if firstCharFoundIndex != index {
                            secondCharFound = true
                        }
                        
                        break
                    } else {
                        break
                    }
                }
            }
        }
        
        if firstChar.isEmpty && secondChar.isEmpty {
            firstChar = ""
            secondChar = ""
        }
        
        return firstChar + secondChar
    }
    
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func separate(every: Int, with separator: String) -> String {
        return String(stride(from: 0, to: Array(self).count, by: every).map {
            Array(Array(self)[$0..<min($0 + every, Array(self).count)])
        }.joined(separator: separator))
    }
    
    func filterNumbersOnly() -> String {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = self.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return numberFiltered
    }

}

