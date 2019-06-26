//
//  Game.swift
//  TicTacToe
//
//  Created by Michael Flowers on 6/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard
    var activePlayer: GameBoard.Mark?
    var gameIsOver: Bool
    var winningPlayer: GameBoard.Mark?
    
    
    mutating func restart(){
        
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        
    }
    
    
}
