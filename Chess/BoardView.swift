//
//  BoardView.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import UIKit

class BoardView: UIView {
    
    let ratio: CGFloat = 1.0
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegte? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -10
    var movingPiecey: CGFloat = -10
    
    
    override func draw(_ react: CGRect){
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.width * (1 - ratio) / 2
        
        drawBoard()
        drawPieces()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        fromCol = Int((fingerLocation.x - originX) / cellSide)
        fromRow = Int((fingerLocation.y - originY) / cellSide)
        
        if let fromCol = fromCol, let fromRow = fromRow, let movingPiece = chessDelegate?.pieceAt(col: fromCol, row: fromRow){
            movingImage = UIImage(named: movingPiece.imageName)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPiecey = fingerLocation.y
        movingPieceX = fingerLocation.x
        setNeedsDisplay()

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        print(fingerLocation)
        
        let toCol: Int = Int((fingerLocation.x - originX) / cellSide)
        let toRow: Int = Int((fingerLocation.y - originY) / cellSide)
        
        if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow {
            chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
            
        }
        movingImage = nil
        fromCol = nil
        fromRow = nil
        setNeedsDisplay()
    }
    
    func drawPieces(){
        for piece in shadowPieces where !(fromCol == piece.col && fromRow == piece.row){
            //another way to write it is fromCol != piece.col || fromRow != piece.row
            
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: originX + CGFloat(piece.col) * cellSide, y: originY + CGFloat(piece.row) * cellSide, width: cellSide, height: cellSide))
        }
        
        movingImage?.draw(in: CGRect(x: movingPieceX - cellSide/2, y: movingPiecey - cellSide/2, width: cellSide, height: cellSide))
    }
    
    func drawBoard(){
        for row in 0..<4{
            for col in 0..<4{
                drawSquare(col: col*2, row: row*2, color: UIColor.white)
                drawSquare(col: 1+col*2, row: row*2, color: UIColor.gray)
                drawSquare(col: col*2, row: 1+row*2, color: UIColor.gray)
                drawSquare(col: 1+col*2, row: 1+row*2, color: UIColor.white)
            }
        }
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor){
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        path.fill()
    }
    
}
