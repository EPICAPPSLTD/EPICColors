//
//  UIColor+Extensions.swift
//  EPICColor
//
//  Created by Danny Bravo on 03/06/2015.
//  Copyright (c) 2015 EPIC. All rights reserved.
//

import UIKit

private let MAX_255_COLOR : CGFloat = 255.0

//MARK: - UIColor Extensions
extension UIColor {
    
    //MARK: - Initializers
    // Convenience intializer for creating color objects from 255 RGB values. Alpha still expects default 0-1 values.
    convenience init(red255 red:CGFloat, green255 green:CGFloat, blue255 blue:CGFloat, alpha:CGFloat) {
        assert(red >= 0 && red <= 255, "invalid red value passed, value must be between 0-255, got: \(red)")
        assert(green >= 0 && green <= 255, "invalid green value passed, value must be between 0-255, got: \(green)")
        assert(blue >= 0 && blue <= 255, "invalid blue value passed, value must be between 0-255, got: \(blue)")
        self.init(red: red/MAX_255_COLOR, green: green/MAX_255_COLOR, blue: blue/MAX_255_COLOR, alpha: alpha)
    }
    
    // Convenience intializer for creating color objects 2, 4, 6 and 8 character length hex strings (ignoring the prefixes '#', '0x' or '0X').
    convenience init(var hexString:String) {
        hexString = hexString.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                             .stringByReplacingOccurrencesOfString("0x", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        var alpha : UInt32 = UInt32(MAX_255_COLOR)
        var red = alpha
        var green = alpha
        var blue = alpha
        
        let hexLength = hexString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) //we ignore other string encodings as emoticons and composed character sequence are not valid elements in a hexstring to start with.
        switch hexLength {
        case 2:
            EPICHexStringScanner.scanHex2(hexString, red: &red, green: &green, blue: &blue);
        case 4:
            EPICHexStringScanner.scanHex4(hexString, red: &red, green: &green, blue: &blue, alpha: &alpha);
        case 6:
            EPICHexStringScanner.scanHex6(hexString, red: &red, green: &green, blue: &blue);
        case 8:
            EPICHexStringScanner.scanHex8(hexString, red: &red, green: &green, blue: &blue, alpha: &alpha);
        default:
            assertionFailure("passed hex value is invalid, hex can only contain valid values with 2 (white), 4 (white + alpha), 6 (rgb) or 8 (rgb + alpha) characters and must be composed by characters 0-9, a-z and A-Z. Got: \(hexString)")
        }
        
        self.init(red255: CGFloat(red), green255: CGFloat(green), blue255: CGFloat(blue), alpha: CGFloat(alpha)/MAX_255_COLOR)
    }

}

//MARK: - Hex String Scanner
private class EPICHexStringScanner {
    
    //MARK: - Scanning functions
    /**
    Utility for scanning 2 character hex strings and assigning their values onto RGB equivalent values. The 2 character string sequence is equivalent to a RGB grayscale value without alpha. Usage only allows for the following notation:
    - FF
    And does not cater for the following notations:
    - #FF
    - 0xFF
    - 0XFF
    
    - parameter hexString: The 2 character long hex string to process and pull the color values from.
    - parameter red: An inout `UInt32` pointer to assign the output red value to.
    - parameter green: An inout `UInt32` pointer to assign the output green value to.
    - parameter blue: An inout `UInt32` pointer to assign the output blue value to.
    
    :warning: Characters in the input string must be composed by characters 0-9, a-z or A-Z. Failure to do so will result in an assertion failure. Failure to provide the correct expected `hexString` notation has undefined behaviour.
    */
    class func scanHex2(hexString:String, inout red:UInt32, inout green:UInt32, inout blue:UInt32) {
        let scanner = NSScanner(string: hexString)
        if (!scanner.scanHexInt(&red)) {
            assertionFailure("passed hex value is invalid, hex can only contain valid values with 2 characters and must be composed by characters 0-9, a-z or A-Z. Got: \(hexString)")
        }
        green = red
        blue = red
    }
    
    /**
    Utility for scanning 4 character hex strings and assigning their values onto RGB equivalent values. The 4 character string sequence is equivalent to a RGB grayscale value with alpha. Usage only allows for the following notation (case insensitive):
    - FF00
    And does not cater for the following notations (case insensitive):
    - #FF00
    - 0xFF00
    - 0XFF00
    
    - parameter hexString: The 4 character long hex string to process and pull the color values from.
    - parameter red: An inout `UInt32` pointer to assign the output red value to.
    - parameter green: An inout `UInt32` pointer to assign the output green value to.
    - parameter blue: An inout `UInt32` pointer to assign the output blue value to.
    - parameter alpha: Lorem Lipsum
    
    :warning: Characters in the input string must be composed by characters 0-9, a-z or A-Z. Failure to do so will result in an assertion failure. Failure to provide the correct expected `hexString` notation has undefined behaviour.
    */
    class func scanHex4(hexString:String, inout red:UInt32, inout green:UInt32, inout blue:UInt32, inout alpha:UInt32) {
        if !NSScanner(string: hexString[0..<2]).scanHexInt(&red) ||
            !NSScanner(string: hexString[2..<4]).scanHexInt(&alpha) {
                assertionFailure("passed hex value is invalid, hex can only contain valid values with 4 characters and must be composed by characters 0-9, a-z or A-Z. Got: \(hexString)")
        }
        green = red
        blue = red
    }
    
    /**
    Utility for scanning 6 character hex strings and assigning their values onto RGB equivalent values. The 6 character string sequence is equivalent to a R-G-B value without alpha. Usage only allows for the following notation (case insensitive):
    - FF00CC
    And does not cater for the following notations (case insensitive):
    - #FF00CC
    - 0xFF00CC
    - 0XFF00CC
    
    - parameter hexString: The 6 character long hex string to process and pull the color values from.
    - parameter red: An inout `UInt32` pointer to assign the output red value to.
    - parameter green: An inout `UInt32` pointer to assign the output green value to.
    - parameter blue: An inout `UInt32` pointer to assign the output blue value to.
    - parameter alpha: An inout `UInt32` pointer to assign the output alpha value to.
    
    :warning: Characters in the input string must be composed by characters 0-9, a-z or A-Z. Failure to do so will result in an assertion failure. Failure to provide the correct expected `hexString` notation has undefined behaviour.
    */
    class func scanHex6(hexString:String, inout red:UInt32, inout green:UInt32, inout blue:UInt32) {
        if !NSScanner(string: hexString[0..<2]).scanHexInt(&red) ||
            !NSScanner(string: hexString[2..<4]).scanHexInt(&green) ||
            !NSScanner(string: hexString[4..<6]).scanHexInt(&blue) {
                assertionFailure("passed hex value is invalid, hex can only contain valid values with 6 characters and must be composed by characters 0-9, a-z or A-Z. Got: \(hexString)")
        }
    }
    
    /**
    Utility for scanning 8 character hex strings and assigning their values onto RGB equivalent values. The 8 character string sequence is equivalent to a R-G-B value with alpha. Usage only allows for the following notation (case insensitive):
    - FF00CCAA
    And does not cater for the following notations (case insensitive):
    - #FF00CCAA
    - 0xFF00CCAA
    - 0XFF00CCAA
    
    - parameter hexString: The 8 character long hex string to process and pull the color values from.
    - parameter red: An inout `UInt32` pointer to assign the output red value to.
    - parameter green: An inout `UInt32` pointer to assign the output green value to.
    - parameter blue: An inout `UInt32` pointer to assign the output blue value to.
    - parameter alpha: An inout `UInt32` pointer to assign the output alpha value to.
    
    :warning: Characters in the input string must be composed by characters 0-9, a-z or A-Z. Failure to do so will result in an assertion failure. Failure to provide the correct `hexString` notation has undefined behaviour.
    */
    class func scanHex8(hexString:String, inout red:UInt32, inout green:UInt32, inout blue:UInt32, inout alpha:UInt32) {
        if !NSScanner(string: hexString[0..<2]).scanHexInt(&red) ||
            !NSScanner(string: hexString[2..<4]).scanHexInt(&green) ||
            !NSScanner(string: hexString[4..<6]).scanHexInt(&blue) ||
            !NSScanner(string: hexString[6..<8]).scanHexInt(&alpha) {
                assertionFailure("passed hex value is invalid, hex can only contain valid values with 8 characters and must be composed by characters 0-9, a-z or A-Z. Got: \(hexString)")
        }
    }
    
}