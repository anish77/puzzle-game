//
//  PuzzleViewController.swift
//  puzzle-game
//
//  Created by Ana Cvasniuc on 11/12/24.
//

import UIKit

class PuzzleViewController: UIViewController {
    private var viewModel: PuzzleViewModel!
    private var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "image")!
        viewModel = PuzzleViewModel(image: image, rows: 3, cols: 3)
        setupPuzzlePieces()
    }

    private func setupPuzzlePieces() {
        let gridSize = 3
        let tileSize = view.frame.width / CGFloat(gridSize)

        for (index, tile) in viewModel.tiles.enumerated() {
            let row = index / gridSize
            let col = index % gridSize
            let button = UIButton(frame: CGRect(x: CGFloat(col) * tileSize,
                                                y: CGFloat(row) * tileSize,
                                                width: tileSize,
                                                height: tileSize))
            button.setImage(tile, for: .normal)
            button.tag = index
            button.addTarget(self, action: #selector(tileTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            view.addSubview(button)
        }
    }

    @objc private func tileTapped(_ sender: UIButton) {
        if viewModel.selectTile(at: sender.tag) {
            updateUI()
            if viewModel.isSolved {
                showSuccessAlert()
            }
        }
    }

    private func updateUI() {
        for (index, button) in buttons.enumerated() {
            button.setImage(viewModel.tiles[index], for: .normal)
        }
    }

    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Congratulations!", message: "You solved the puzzle!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}


