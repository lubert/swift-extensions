//
//  UIImage+AverageColor.swift
//

extension UIImage {
  func averageColor() -> UIColor {
    let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
    var rgba: [CUnsignedChar] = [0,0,0,0]
    let bitmapInfo: CGBitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedLast.rawValue | CGBitmapInfo.ByteOrder32Big.rawValue)
    let context = CGBitmapContextCreate(&rgba, UInt(1), UInt(1), UInt(8), UInt(4), colorSpace, bitmapInfo)
    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), self.CGImage)
    if(rgba[3] > 0) {
      let alpha = (Float(rgba[3]))/255.0;
      let multiplier = alpha/255.0;
      return UIColor(red: CGFloat(Float(rgba[0]) * multiplier), green: CGFloat(Float(rgba[1]) * multiplier), blue: CGFloat(Float(rgba[2]) * multiplier), alpha: CGFloat(alpha))
    } else {
      return UIColor(red: CGFloat(Float(rgba[0])), green: CGFloat(Float(rgba[1])), blue: CGFloat(Float(rgba[2])), alpha: CGFloat(Float(rgba[3])))
    }
  }
}
