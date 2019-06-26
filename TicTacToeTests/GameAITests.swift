//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    /*
     WHEN A FAILURE OCCURS, BEGORE FIXING THE PROBLEM, BE SURE THAT YOU UNDERSTAND WHETHER THE BUG IS IN THE APP'S CODE OR THE TEST CODE. USE THE DEBUGGER IF NEEDED.
 */
//start testing for winning combinations
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingVertical3() {
        var board = GameBoard()
        /*
         - o x
         - o x
         - - x
         */
        
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        /*
         - o -
         x x x
         o - -
         */
        
        //X goes first
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o o
         */
        
        //O moves first
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal3() {
        var board = GameBoard()
        /*
         x x x
         o - -
         o - -
         */
        
        //X goes first
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        
        //X goes first
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        
        //O moves first
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
        
    }
    
    //do I have enough information to complete the following two functions?
    func testIncompleteGame() {
        let board = GameBoard()
        
        //assertion gameboard is full positive positive
        XCTAssertTrue(!board.isFull)
        //assertion gameboard is full negative positive
        XCTAssertFalse(board.isFull)
    }

    func testCatsGame() {
        let board = GameBoard()
       
        //if it is not won by x and it is not won by o then it is a cats game.
        XCTAssertTrue(!game(board: board, isWonBy: .o))
        XCTAssertTrue(!game(board: board, isWonBy: .x))
    }
}
