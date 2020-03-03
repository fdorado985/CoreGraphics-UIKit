//
//  ViewController.swift
//  CoreGraphics-UIKit
//
//  Created by Juan Francisco Dorado Torres on 02/03/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!

  // MARK: - Properties

  var currentDrawType = 0

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    drawRectangle()
  }

  // MARK: - Actions

  @IBAction func redrawButtonTapped(_ sender: UIButton) {
    currentDrawType += 1

    if currentDrawType > 5 {
      currentDrawType = 0
    }

    switch currentDrawType {
    case 0:
      drawRectangle()
    case 1:
      drawCircle()
    case 2:
      drawCheckerboard()
    default:
      break
    }
  }

  // MARK: - Methods

  func drawRectangle() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

    let img = renderer.image { ctx in
      let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)

      ctx.cgContext.setFillColor(UIColor.red.cgColor)
      ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
      ctx.cgContext.setLineWidth(10)

      ctx.cgContext.addRect(rectangle)
      ctx.cgContext.drawPath(using: .fillStroke)
    }

    imageView.image = img
  }

  func drawCircle() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

    let img = renderer.image { ctx in
      let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)

      ctx.cgContext.setFillColor(UIColor.red.cgColor)
      ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
      ctx.cgContext.setLineWidth(10)

      ctx.cgContext.addEllipse(in: rectangle)
      ctx.cgContext.drawPath(using: .fillStroke)
    }

    imageView.image = img
  }

  func drawCheckerboard() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))

    let img = renderer.image { ctx in
      ctx.cgContext.setFillColor(UIColor.black.cgColor)

      for row in 0..<8 {
        for col in 0 ..< 8 where (row + col) % 2 == 0 {
          ctx.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
        }
      }
    }

    imageView.image = img
  }
}
