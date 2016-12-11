# UIView+Borders

**Add borders to everything!** A quick and simple UIView extension to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible. Supports one-sided borders with offset amounts for top, right, bottom and left sides! Also supports autoresizing.

## Installation

### Carthage
    github "aaronn/UIView-Borders-Swift"


### Manual
Just add "UIView+Borders.swift” to your project. 

## Usage
Import "UIView+Borders.swift” and call any of the following on your UIView, specifying the side, thickness, and color to get a CALayer backed border which you can then set into a property and add as a sublayer (or subview). You can also specify a view-backed border instead of CALayer if you need it (check the source).

    let view: UIView = UIView()
    view.addBorder(side: .bottom, color: UIColor.black)

UIView+Borders supports offsets, but invalid offsets won’t do anything (if you set a left offset on a right sided border, for example).

    let view: UIView = UIView()
    view.addBorder(side: .bottom, color: UIColor.black, leftOffset: 15.0)
    
-

    enum ViewSide {
        case top
        case right
        case bottom
        case left
    }
    
    func createBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0) -> CALayer


Alternatively, if you just want a quick border dropped into your UIView, use these methods which just add a border to the current view:

    enum ViewSide {
        case top
        case right
        case bottom
        case left
    }
    
    func addBorder(side: ViewSide, thickness: CGFloat, color: UIColor, leftOffset: CGFloat = 0, rightOffset: CGFloat = 0, topOffset: CGFloat = 0, bottomOffset: CGFloat = 0)

## Why One Sided Borders?
One sided borders are an awesome tool for highlighting, recessing or separating various UI elements. For example, a light top-border with a dark bottom-border can be used to make something appear raised while a dark top-border makes the element look recessed. It's also handy for visually separating two views next to each other-- using a traditional layer border means doubling up on the width where the two views meet.
