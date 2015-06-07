//
//  UIColorExtensionsTests.swift
//  EPICColor
//
//  Created by Danny Bravo on 03/06/2015.
//  Copyright (c) 2015 EPIC. All rights reserved.
//

import UIKit
import XCTest

class UIColorExtensionsTests: XCTestCase {

    func test255Colors() {
        var color = UIColor(red255: 255, green255: 0, blue255: 0, alpha: 1.0)
        var red : CGFloat = 0
        var green : CGFloat = red
        var blue : CGFloat = red
        var alpha : CGFloat = red
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 1.0)
        
        color = UIColor(red255: 0, green255: 51, blue255: 0, alpha: 0.5)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0.2)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 0.5)
        
        color = UIColor(red255: 0, green255: 0, blue255: 102, alpha: 0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0.4)
        XCTAssertEqual(alpha, 0)
    }
    
    func testHex2StringColor() {
        let hex1 = "33"
        let hex2 = "#33"
        let hex3 = "0xCc"
        let hex4 = "0XcC"

        var color = UIColor(hexString: hex1)
        var red : CGFloat = 0
        var green : CGFloat = red
        var blue : CGFloat = red
        var alpha : CGFloat = red
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.2)
        XCTAssertEqual(green, 0.2)
        XCTAssertEqual(blue, 0.2)
        XCTAssertEqual(alpha, 1.0)

        color = UIColor(hexString: hex2)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.2)
        XCTAssertEqual(green, 0.2)
        XCTAssertEqual(blue, 0.2)
        XCTAssertEqual(alpha, 1.0)

        color = UIColor(hexString: hex3)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.8)
        XCTAssertEqual(green, 0.8)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
        
        color = UIColor(hexString: hex4)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.8)
        XCTAssertEqual(green, 0.8)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
    }
    
    func testHex4StringColor() {
        let hex1 = "6600"
        let hex2 = "#6633"
        let hex3 = "0x6699"
        let hex4 = "0X66Ff"
        
        var color = UIColor(hexString: hex1)
        var red : CGFloat = 0
        var green : CGFloat = red
        var blue : CGFloat = red
        var alpha : CGFloat = red
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.4)
        XCTAssertEqual(green, 0.4)
        XCTAssertEqual(blue, 0.4)
        XCTAssertEqual(alpha, 0.0)
        
        color = UIColor(hexString: hex2)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.4)
        XCTAssertEqual(green, 0.4)
        XCTAssertEqual(blue, 0.4)
        XCTAssertEqual(alpha, 0.2)
        
        color = UIColor(hexString: hex3)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.4)
        XCTAssertEqual(green, 0.4)
        XCTAssertEqual(blue, 0.4)
        XCTAssertEqual(alpha, 0.6)
        
        color = UIColor(hexString: hex4)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0.4)
        XCTAssertEqual(green, 0.4)
        XCTAssertEqual(blue, 0.4)
        XCTAssertEqual(alpha, 1.0)
    }
    
    func testHex6StringColor() {
        let hex1 = "FF99CC"
        let hex2 = "#fF99CC"
        let hex3 = "0xff99cc"
        let hex4 = "0XFF99cc"
        
        var color = UIColor(hexString: hex1)
        var red : CGFloat = 0
        var green : CGFloat = red
        var blue : CGFloat = red
        var alpha : CGFloat = red
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
        
        color = UIColor(hexString: hex2)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
        
        color = UIColor(hexString: hex3)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
        
        color = UIColor(hexString: hex4)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
    }
    
    func testHex8StringColor() {
        let hex1 = "fF99CC00"
        let hex2 = "#Ff99Cc33"
        let hex3 = "0xfF99cC99"
        let hex4 = "0XFf99CcFF"
        
        var color = UIColor(hexString: hex1)
        var red : CGFloat = 0
        var green : CGFloat = red
        var blue : CGFloat = red
        var alpha : CGFloat = red
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 0.0)
        
        color = UIColor(hexString: hex2)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 0.2)
        
        color = UIColor(hexString: hex3)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 0.6)
        
        color = UIColor(hexString: hex4)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1.0)
        XCTAssertEqual(green, 0.6)
        XCTAssertEqual(blue, 0.8)
        XCTAssertEqual(alpha, 1.0)
    }

}
