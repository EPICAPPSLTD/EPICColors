//
//  String+Subscripts.swift
//  EPICStringSubscripts
//
//  Created by Danny Bravo on 03/06/2015.
//  Copyright (c) 2015 EPIC. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information
//

import Foundation

/*
    NOTE: this class was imported from snippets belonging to the project EPICStringSubscripts that can be found here: https://github.com/EPICAPPSLTD/EPICStringSubscripts
    Only the relevants sections of the original class were mantained in order to keep the focus on the main classes of the tutorial. For a full explanation of the class plus other niceties, feel free to read our tutorial @ http://epic-apps.uk/2015/06/03/subscripting-shortcuts/
*/


extension String {
  
    //MARK: - subscripts
    subscript(index: Int) -> String {
        let index = advance(self.startIndex, index)
        return String(self[index])
    }
    
    subscript(range: Range<Int>) -> String {
        let indexStart = advance(self.startIndex, range.startIndex)
        let indexEnd = advance(self.startIndex, range.endIndex)
        return self[indexStart..<indexEnd]
    }
    
}
