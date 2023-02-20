//
//  ViewController.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import UIKit

class ViewController: UIViewController, ChessDelegte {
    
    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.chessDelegate = self
        
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()

    }
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        if chessEngine.whitesTurn   {
            infoLabel.text = "White"
        } else{
            infoLabel.text = "Black"
        }
        
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return chessEngine.pieceAt(col: col, row: row)
    }
    
    @IBAction func Reset(_ sender: Any) {
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        infoLabel.text = "White"
    }
}

