//
//  ChessEngine.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import Foundation

struct ChessEngine {
    var pieces: Set<ChessPiece> = Set<ChessPiece>()
    
    mutating func initializeGame() {
        pieces.removeAll()
        
        pieces.insert(ChessPiece(col: 0, row: 0, imageName: "Rook-black"))
        pieces.insert(ChessPiece(col: 7, row: 0, imageName: "Rook-black"))
        pieces.insert(ChessPiece(col: 0, row: 7, imageName: "Rook-white"))
        pieces.insert(ChessPiece(col: 7, row: 7, imageName: "Rook-white"))
        
        pieces.insert(ChessPiece(col: 1, row: 0, imageName: "Knight-black"))
        pieces.insert(ChessPiece(col: 6, row: 0, imageName: "Knight-black"))
        pieces.insert(ChessPiece(col: 1, row: 7, imageName: "Knight-white"))
        pieces.insert(ChessPiece(col: 6, row: 7, imageName: "Knight-white"))
        
        pieces.insert(ChessPiece(col: 2, row: 0, imageName: "Bishop-black"))
        pieces.insert(ChessPiece(col: 5, row: 0, imageName: "Bishop-black"))
        pieces.insert(ChessPiece(col: 2, row: 7, imageName: "Bishop-white"))
        pieces.insert(ChessPiece(col: 5, row: 7, imageName: "Bishop-white"))
        
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: "Queen-Black"))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: "Queen-white"))
        
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: "King-black"))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: "King-white"))
        
        for i in 0..<8 {
            pieces.insert(ChessPiece(col: i, row: 1, imageName: "Pawn-black"))
            pieces.insert(ChessPiece(col: i, row: 6, imageName: "Pawn-white"))
        }
        
        
    }
}
