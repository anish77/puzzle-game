//
//  PuzzleViewModel.swift
//  puzzle-game
//
//  Created by Ana Cvasniuc on 11/12/24.
//

import UIKit

class PuzzleViewModel {
    private let puzzle: Puzzle
    private(set) var selectedTileIndex: Int? = nil

    var tiles: [UIImage] {
        return puzzle.tiles
    }

    var isSolved: Bool {
        return puzzle.isSolved()
    }

    init(image: UIImage, rows: Int, cols: Int) {
        self.puzzle = Puzzle(image: image, rows: rows, cols: cols)
    }

    func selectTile(at index: Int) -> Bool {
        if let firstIndex = selectedTileIndex {
            puzzle.swapTiles(at: firstIndex, and: index)
            selectedTileIndex = nil
            return true
        } else {
            selectedTileIndex = index
            return false
        }
    }

    func resetPuzzle() {
        puzzle.reset()
        selectedTileIndex = nil
    }
}


