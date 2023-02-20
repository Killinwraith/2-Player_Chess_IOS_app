//
//  ChessPiece.swift
//  Chess
//
//  Created by Hetang Mehta on 2023-01-13.
//

import Foundation

struct ChessPiece: Hashable {
    let col: Int
    let row: Int
    let imageName: String
    let isWhite: Bool 
}
