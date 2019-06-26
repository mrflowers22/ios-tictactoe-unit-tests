//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Michael Flowers on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    //to get the diamond in the gutter we have to start the func name with "test"
    func testCreatingEmptyBoard(){
        //get board/ this is creating the board
        let board = GameBoard()
        
        //we need to create nine boxes
        for x in 0..<3 {
            
            for y in 0..<3 {
                //this is testing to see that they are all empty
                XCTAssertNil(board[(x,y)])
            }
        }
    }
    
    //putting marks on the board
    func testPlacingMarks() {
        
        var board = GameBoard()
        //try to put o on (0,0)
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        //test to see if o is on (0,0)
        XCTAssertEqual(board[(0, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 0)))
        XCTAssertEqual(board[(1, 0)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 0)))
        XCTAssertEqual(board[(2, 0)], .o)
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0, 1)))
        XCTAssertEqual(board[(0, 1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (1, 1)))
        XCTAssertEqual(board[(1, 1)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 1)))
        XCTAssertEqual(board[(2, 1)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 2)))
        XCTAssertEqual(board[(0, 2)], .o)
        
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (1, 2)))
        XCTAssertEqual(board[(1, 2)], .x)
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .o)
        
        
        //test to prevent placing two marks on the same coordination
        //this passes, means that its incorrect which means its correct
        //look into TDD. TDD makes it fail instead of pass when its incorrect.
        XCTAssertThrowsError(try board.place(mark: .x, on: (0,0))){
            error in
            XCTAssertEqual(error as? GameBoardError, .invalidSquare)
        }
    }
    
    func testIsFull() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertFalse(board.isFull) //theyre 8 places so this is false, which means the test passes
        
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull) //now they're 9 places so this is true
    }
}





















