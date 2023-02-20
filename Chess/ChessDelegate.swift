//
//  ChessDelegate.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-02-20.
//

import Foundation


protocol ChessDelegte {
    func movePiece(fromCol:Int, fromRow:Int, toCol:Int, toRow:Int)
    func pieceAt(col: Int, row: Int) -> ChessPiece?
}
