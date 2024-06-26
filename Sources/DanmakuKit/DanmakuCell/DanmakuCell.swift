//
//  DanmakuCell.swift
//  DanmakuKit
//
//  Created by littleTurnip on 9/3/23.
//

import UIKit

// MARK: - DanmakuCellType

public enum DanmakuCellType {
  case floating
  case top
  case bottom
}

// MARK: - DanmakuCell

open class DanmakuCell: UIView {
  public var model: DanmakuCellModel?

  public internal(set) var animationTime: TimeInterval = 0

  var animationBeginTime: TimeInterval = 0

  override public class var layerClass: AnyClass {
    DanmakuAsyncLayer.self
  }

  override public required init(frame: CGRect) {
    super.init(frame: frame)
    setupLayer()
  }

  public required init?(coder: NSCoder) {
    debugPrint("init(coder:) has not been implemented")
    fatalError("init(coder:) has not been implemented")
  }

  /// Overriding this method, you can get the timing before the content rendering.
  open func willDisplay() {}

  /// Overriding this method to draw danmaku.
  /// - Parameters:
  ///   - context: drawing context
  ///   - size: bounds.size
  ///   - isCancelled: Whether drawing is cancelled
  open func displaying(_ context: CGContext, _ size: CGSize, _ isCancelled: Bool) {}

  /// Overriding this method, you can get the timing after the content rendering.
  /// - Parameter finished: False if draw is cancelled
  open func didDisplay(_ finished: Bool) {}

  /// Overriding this method, you can get th timing of danmaku enter track.
  open func enterTrack() {}

  /// Overriding this method, you can get th timing of danmaku leave track.
  open func leaveTrack() {}

  /// Decide whether to use asynchronous rendering.
  public var displayAsync = true {
    didSet {
      guard let layer = layer as? DanmakuAsyncLayer else { return }
      layer.displayAsync = displayAsync
    }
  }

  /// This method can trigger the rendering process, the content can be re-rendered in the displaying(_:_:_:) method.
  public func redraw() {
    layer.setNeedsDisplay()
  }
}

extension DanmakuCell {
  var realFrame: CGRect {
    if layer.presentation() != nil {
      layer.presentation()!.frame
    } else {
      frame
    }
  }

  func setupLayer() {
    guard let layer = layer as? DanmakuAsyncLayer else { return }

    layer.contentsScale = UIScreen.main.scale

    layer.willDisplay = { [weak self] _ in
      guard let strongSelf = self else { return }
      strongSelf.willDisplay()
    }

    layer.displaying = { [weak self] context, size, isCancelled in
      guard let strongSelf = self else { return }
      strongSelf.displaying(context, size, isCancelled())
    }

    layer.didDisplay = { [weak self] _, finished in
      guard let strongSelf = self else { return }
      strongSelf.didDisplay(finished)
    }
  }
}
