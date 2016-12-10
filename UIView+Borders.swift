//
//  UIView+Borders.swift
//
//  Created by Aaron Ng on 11/15/15.
//  Copyright © 2015 Aaron Ng. All rights reserved.
//

import UIKit

extension UIView {
    
    enum ViewSide {
        case top
        case right
        case bottom
        case left
    }
    
    func createBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) -> CALayer {
        
        switch side {
        case .top:
            // Bottom Offset Has No Effect
            // Subtract the bottomOffset from the height and the thickness to get our final y position.
            // Add a left offset to our x to get our x position.
            // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
            return _getOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                    y: 0 + topOffset,
                                                    width: self.frame.size.width - leftOffset - rightOffset,
                                                    height: thickness), color: color)
        case .right:
            // Left Has No Effect
            // Subtract bottomOffset from the height to get our end.
            return _getOneSidedBorder(frame: CGRect(x: self.frame.size.width - thickness - rightOffset,
                                                    y: 0 + topOffset,
                                                    width: thickness,
                                                    height: self.frame.size.height), color: color)
        case .bottom:
            // Top has No Effect
            // Subtract the bottomOffset from the height and the thickness to get our final y position.
            // Add a left offset to our x to get our x position.
            // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
            return _getOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                    y: self.frame.size.height-thickness-bottomOffset,
                                                    width: self.frame.size.width - leftOffset - rightOffset,
                                                    height: thickness), color: color)
        case .left:
            // Right Has No Effect
            return _getOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                    y: 0 + topOffset,
                                                    width: thickness,
                                                    height: self.frame.size.height - topOffset - bottomOffset), color: color)
        }
    }
    
    func createViewBackedBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) -> UIView {
        
        switch side {
        case .top:
            return _getViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                              y: 0 + topOffset,
                                                              width: self.frame.size.width - leftOffset - rightOffset,
                                                              height: thickness), color: color)
            
        case .right:
            return _getViewBackedOneSidedBorder(frame: CGRect(x: self.frame.size.width-thickness-rightOffset,
                                                              y: 0 + topOffset, width: thickness,
                                                              height: self.frame.size.height - topOffset - bottomOffset), color: color)
            
        case .bottom:
            return _getViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                              y: self.frame.size.height-thickness-bottomOffset,
                                                              width: self.frame.size.width - leftOffset - rightOffset,
                                                              height: thickness), color: color)
            
        case .left:
            return _getViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                              y: 0 + topOffset,
                                                              width: thickness,
                                                              height: self.frame.size.height - topOffset - bottomOffset), color: color)
        }
    }
    
    func addBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) {
        
        switch side {
        case .top:
            // Add leftOffset to our X to get start X position.
            // Add topOffset to Y to get start Y position
            // Subtract left offset from width to negate shifting from leftOffset.
            // Subtract rightoffset from width to set end X and Width.
            _addOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                             y: 0 + topOffset,
                                             width: self.frame.size.width - leftOffset - rightOffset,
                                             height: thickness), color: color)
        case .right:
            // Subtract the rightOffset from our width + thickness to get our final x position.
            // Add topOffset to our y to get our start y position.
            // Subtract topOffset from our height, so our border doesn't extend past teh view.
            // Subtract bottomOffset from the height to get our end.
            _addOneSidedBorder(frame: CGRect(x: self.frame.size.width-thickness-rightOffset,
                                             y: 0 + topOffset, width: thickness,
                                             height: self.frame.size.height - topOffset - bottomOffset), color: color)
        case .bottom:
            // Subtract the bottomOffset from the height and the thickness to get our final y position.
            // Add a left offset to our x to get our x position.
            // Minus our rightOffset and negate the leftOffset from the width to get our endpoint for the border.
            _addOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                             y: self.frame.size.height-thickness-bottomOffset,
                                             width: self.frame.size.width - leftOffset - rightOffset, height: thickness), color: color)
        case .left:
            _addOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                             y: 0 + topOffset,
                                             width: thickness,
                                             height: self.frame.size.height - topOffset - bottomOffset), color: color)
        }
    }
    
    func addViewBackedBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) {
        
        switch side {
        case .top:
            _addViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                       y: 0 + topOffset,
                                                       width: self.frame.size.width - leftOffset - rightOffset,
                                                       height: thickness), color: color)
        case .right:
            _addViewBackedOneSidedBorder(frame: CGRect(x: self.frame.size.width-thickness-rightOffset,
                                                       y: 0 + topOffset, width: thickness,
                                                       height: self.frame.size.height - topOffset - bottomOffset), color: color)
        case .bottom:
             _addViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                        y: self.frame.size.height-thickness-bottomOffset,
                                                        width: self.frame.size.width - leftOffset - rightOffset,
                                                        height: thickness), color: color)
        case .left:
            _addViewBackedOneSidedBorder(frame: CGRect(x: 0 + leftOffset,
                                                       y: 0 + topOffset,
                                                       width: thickness,
                                                       height: self.frame.size.height - topOffset - bottomOffset), color: color)
        }
    }
    
    //////////
    // Private: Our methods call these to add their borders.
    //////////
    
    fileprivate func _addOneSidedBorder(frame: CGRect, color: UIColor) {
        let border:CALayer = CALayer()
        border.frame = frame
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
    
    fileprivate func _getOneSidedBorder(frame: CGRect, color: UIColor) -> CALayer {
        let border:CALayer = CALayer()
        border.frame = frame
        border.backgroundColor = color.cgColor
        return border
    }
    
    fileprivate func _addViewBackedOneSidedBorder(frame: CGRect, color: UIColor) {
        let border:UIView = UIView.init(frame: frame)
        border.backgroundColor = color
        self.addSubview(border)
    }
    
    fileprivate func _getViewBackedOneSidedBorder(frame: CGRect, color: UIColor) -> UIView {
        let border:UIView = UIView.init(frame: frame)
        border.backgroundColor = color
        return border
    }
    
}
