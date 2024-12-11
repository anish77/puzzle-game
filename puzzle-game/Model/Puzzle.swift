//
//  Puzzle.swift
//  puzzle-game
//
//  Created by Ana Cvasniuc on 11/12/24.
//

import UIKit

class Puzzle {
    private(set) var tiles: [UIImage]
    private let correctTiles: [UIImage]

    init(image: UIImage, rows: Int, cols: Int) {
        self.correctTiles = Puzzle.splitImageIntoTiles(image: image, rows: rows, cols: cols)
        self.tiles = correctTiles.shuffled()
    }

    static func splitImageIntoTiles(image: UIImage, rows: Int, cols: Int) -> [UIImage] {
        let width = image.size.width / CGFloat(cols)
        let height = image.size.height / CGFloat(rows)
        var tiles: [UIImage] = []

        for row in 0..<rows {
            for col in 0..<cols {
                let rect = CGRect(x: CGFloat(col) * width,
                                  y: CGFloat(row) * height,
                                  width: width,
                                  height: height)
                if let cropped = image.cgImage?.cropping(to: rect) {
                    tiles.append(UIImage(cgImage: cropped))
                }
            }
        }

        return tiles
    }

    func isSolved() -> Bool {
        return tiles == correctTiles
    }

    func swapTiles(at firstIndex: Int, and secondIndex: Int) {
        tiles.swapAt(firstIndex, secondIndex)
    }

    func reset() {
        tiles = correctTiles.shuffled()
    }
}


