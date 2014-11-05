//
//  UIColor+isDarkColor.swift
//

extension UIColor {
  func isDarkColor() -> Bool {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0
    self.getRed(&r, green: &g, blue: &b, alpha: &a)
    
    let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
    
    // Change to your liking
    return lum < 0.3
  }
}
