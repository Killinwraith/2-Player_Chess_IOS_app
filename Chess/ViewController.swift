//
//  ViewController.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import UIKit

class ViewController: UIViewController {

    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
    }


}

