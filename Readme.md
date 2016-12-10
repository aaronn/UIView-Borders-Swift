# UIView+Borders

**Swift 3 Version of [UIView+Borders](https://github.com/aaronn/UIView-Borders)**

**Add borders to everything!** A quick and simple UIView category to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible. Supports one-sided borders with offset amounts for top, right, bottom and left sides!

## Installation
Just add "UIView+Borders.swift” to your project. 

## Usage
Import "UIView+Borders.swift” and call any of the following on your UIView, specifying the thickness and color to get a CALayer backed border which you can then set into a property and add as a sublayer (or subview). There are also UIView-backed versions: check out UIView+Borders.h.

    // Top
    func createTopBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0) -> CALayer

    // Right
    func createRightBorder(thickness: CGFloat, color: UIColor, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) -> CALayer

    // Bottom
    func createBottomBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, bottomOffset:CGFloat = 0) -> CALayer

    // Left
    func createLeftBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) -> CALayer


Alternatively, if you just want a quick border dropped into your UIView, use these methods which just add a border to the current view:

    // Top Border
    func addViewBackedTopBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0)

    // Right Border
    func addViewBackedRightBorder(thickness: CGFloat, color: UIColor, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0)

    // Bottom Border
    func addViewBackedBottomBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, bottomOffset:CGFloat = 0)

    // Left Border
    func addViewBackedLeftBorder(thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0)

## Why One Sided Borders?
One sided borders are an awesome tool for highlighting, recessing or separating various UI elements. For example, a light top-border with a dark bottom-border can be used to make something appear raised while a dark top-border makes the element look recessed. It's also handy for visually separating two views next to each other-- using a traditional layer border means doubling up on the width where the two views meet.
