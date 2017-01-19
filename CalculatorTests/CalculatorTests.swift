//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Riyad Shauk on 1/9/17.
//  Copyright © 2017 Riyad Shauk. All rights reserved.
//  NOTE: Most of these test-cases were written using the English test-cases for a calculator app provided in Assignment 1 of Stanford's CS 193p iOS/Swift programming course (the PDF can be found on iTunesU).
//  I added a few more tests (i.e.: testBrainCAfterOperation, testBrainCWhileUserIsTyping, testBrainRand, testBrainMultipleConsecutiveConstantOperations).
//  These tests to the CalculatorBrain should serve as regressional tests.
//  @TODO refactor simplifying (make: more concise, less coupled, more direct) the CalculatorBrain and ViewController without breaking the main functionalities.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /* NOTE: There's currently no testing of the linking of the Main.storyboard to the ViewController (the controller), but perhaps only manual test/verification is needed at this point in order to ensure the correct buttons and displays are hooked up to the correct properties in the ViewController. Hence, I commented out my below attempt to access private properties. */
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let b1 = UIButton()
//        b1.setTitle("1", for: UIControlState.normal)
//        b1.sendActions(for: .touchUpInside)
////        Calculator.ViewController.touchDigit(b1)
////        assert(Calculator.ViewController.display.text! == "1")
//        
//    }
    
    func testBrain7Plus() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        assert(brain.description == "7+")
        assert(brain.result == 7.0)
    }
    
    func testBrain7Plus9() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        assert(brain.lastDescription == "7+")
        assert(brain.result == 9.0)
    }
    
    func testBrain7Plus9Equals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "=")
        assert(brain.description == "7+9")
        assert(brain.result == 16.0)
    }
    
    func testBrain7Plus9EqualsSqrt() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "=")
        brain.performOperation(symbol: "√")
        assert(brain.description == "√(7+9)")
        assert(brain.result == 4.0)
    }
    
    func testBrain7Plus9Sqrt() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "√")
        assert(brain.description == "7+√(9)")
        assert(brain.result == 3.0)
    }
    
    func testBrain7Plus9SqrtEquals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "√")
        brain.performOperation(symbol: "=")
        assert(brain.description == "7+√(9)")
        assert(brain.result == 10.0)
    }
    
    func testBrain7Plus9EqualsPlus6Plus3Equals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "=")
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 6.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 3.0)
        brain.performOperation(symbol: "=")
        assert(brain.description == "7+9+6+3")
        assert(brain.result == 25.0)
    }
    
    func testBrain7Plus9EqualsSqrt6Plus3Equals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 9.0)
        brain.performOperation(symbol: "=")
        brain.performOperation(symbol: "√")
        brain.setOperand(operand: 6.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 3.0)
        brain.performOperation(symbol: "=")
        assert(brain.description == "6+3")
        assert(brain.result == 9.0)
    }
    
    func testBrain5Plus6Equals73() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 5.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 6.0)
        brain.performOperation(symbol: "=")
        brain.setOperand(operand: 73.0)
        assert(brain.lastDescription == "5+6")
        assert(brain.result == 73.0)
    }
    
    func testBrain7PlusEquals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 7.0)
        brain.performOperation(symbol: "+")
        brain.performOperation(symbol: "=")
        assert(brain.description == "7+7")
        assert(brain.result == 14.0)
    }
    
    func testBrain7TimesPiEquals() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 4.0)
        brain.performOperation(symbol: "×")
        brain.performOperation(symbol: "π") // (π is an Operation.Constant)
        brain.performOperation(symbol: "=")
        assert(brain.description == "4×π")
        assert(brain.result == 12.566370614359172)
    }
    
    func testBrain4Plus5Times3() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 4.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 5.0)
        brain.performOperation(symbol: "×")
        brain.setOperand(operand: 3.0)
        brain.performOperation(symbol: "=")
        assert(brain.description == "4+5×3")
        assert(brain.result == 27.0)
    }
    
    func testBrainCAfterOperation() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 4.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 5.0)
        brain.performOperation(symbol: "=")
        brain.performOperation(symbol: "c")
        assert(brain.description == "")
        assert(brain.result == 0.0)
    }
    
    func testBrainCWhileUserIsTyping() {
        let brain = calculatorBrain()
        brain.setOperand(operand: 4.0)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 5.0)
        brain.performOperation(symbol: "c")
        assert(brain.description == "")
        assert(brain.result == 0.0)
    }
    
    func testBrainRand() {
        let brain = calculatorBrain()
        brain.performOperation(symbol: "rand")
        let r1 = brain.result
        brain.performOperation(symbol: "rand")
        let r2 = brain.result
        XCTAssertNotEqual(r1, r2)
        XCTAssert(brain.description == "rand")
    }
    
    func testBrainMultipleConsecutiveConstantOperations() {
        let brain = calculatorBrain()
        brain.performOperation(symbol: "π")
        brain.performOperation(symbol: "π")
        XCTAssertEqual(brain.result, 3.1415926535897931)
        XCTAssertEqual(brain.description, "π")
    }
    
    /* NOTE: As of when the backspace tests were attempted, backspace was only implemented on the ViewController layer (from the controller), so the public CalculatorBrain API can't access the actual view... Hence, the attempted tests, below, are commented out for now. */
    
//    func testBrainBackspaceWithNumberLeftover() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "+")
//        assert(brain.description == "4+")
//        assert(brain.result == 4.0)
//    }
    
//    func testBrainBackspaceWithNumberLeftoverThenTouchAnotherNumber() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.setOperand(operand: 6.0)
////        assert(brain.lastDescription == "")
//        assert(brain.result == 46.0)
//    }
    
//    func testBrainBackspaceJustEnoughToDeleteNumber() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
////        assert(brain.description == "")
//        assert(brain.result == 0.0)
//    }
    
//    func testBrainBackspaceJustEnoughToDeleteNumberThenTouchAnotherNumber() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.setOperand(operand: 6.0)
//        brain.performOperation(symbol: "=")
////        assert(brain.description == "6")
//        assert(brain.result == 6.0)
//    }
    
//    func testBrainBackspaceMoreThanEnoughToDeleteNumber() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "=")
////        assert(brain.lastDescription == "")
//        assert(brain.result == 0.0)
//    }
    
//    func testBrainBackspaceMoreThanEnoughToDeleteNumberThenTouchAnotherNumber() {
//        let brain = calculatorBrain()
//        brain.setOperand(operand: 4.0)
//        brain.setOperand(operand: 5.0)
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.performOperation(symbol: "del")
//        brain.setOperand(operand: 6.0)
//        brain.performOperation(symbol: "=")
////        assert(brain.description == "6")
//        assert(brain.result == 6.0)
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
