//
//  UIImageViewExt.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//


import UIKit
import SDWebImage

extension UIImageView {
    
    func rounded() {
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
    
    //Change image view color
    func tintImage(color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
    

    
    func loadImage(fromURL url: String, placeholder: UIImage? = nil) {
        sd_setImage(with: URL(string: "\(url)"), placeholderImage: placeholder)
    }
    
    public func setImage(string: String?,
                       color: UIColor? = nil,
                       circular: Bool = false,
                       stroke: Bool = false,
                       textAttributes: [NSAttributedString.Key: Any]? = nil) {
        
        let image = imageSnap(text: string != nil ? string?.initials.safelyLimitedTo(length: 1) : "",
                              color: color ?? .random,
                              circular: circular,
                              stroke: stroke,
                              textAttributes:textAttributes)
        
        if let newImage = image {
            self.image = newImage
        }
    }
    
    public func setImageInitials(string: String?,
                       color: UIColor? = nil,
                       circular: Bool = false,
                       stroke: Bool = false,
                       textAttributes: [NSAttributedString.Key: Any]? = nil) {
        
        let image = imageSnap(text: string != nil ? string?.initials.safelyLimitedTo(length: 2) : "",
                              color: color ?? .random,
                              circular: circular,
                              stroke: stroke,
                              textAttributes:textAttributes)
        
        if let newImage = image {
            self.image = newImage
        }
    }
    
    private func imageSnap(text: String?,
                           color: UIColor,
                           circular: Bool,
                           stroke: Bool,
                           textAttributes: [NSAttributedString.Key: Any]?) -> UIImage? {
        
        let scale = Float(UIScreen.main.scale)
        var size = bounds.size
        if contentMode == .scaleToFill || contentMode == .scaleAspectFill || contentMode == .scaleAspectFit || contentMode == .redraw {
            size.width = CGFloat(floorf((Float(size.width) * scale) / scale))
            size.height = CGFloat(floorf((Float(size.height) * scale) / scale))
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, CGFloat(scale))
        let context = UIGraphicsGetCurrentContext()
        if circular {
            let path = CGPath(ellipseIn: bounds, transform: nil)
            context?.addPath(path)
            context?.clip()
        }
        
        // Fill
        
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let attributes = textAttributes ?? [NSAttributedString.Key.foregroundColor: UIColor.white,
                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)]
        
        //stroke color
        if stroke {
            
            //outer circle
            context?.setStrokeColor((attributes[NSAttributedString.Key.foregroundColor] as! UIColor).cgColor)
            context?.setLineWidth(4)
            var rectangle : CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            context?.addEllipse(in: rectangle)
            context?.drawPath(using: .fillStroke)
            
            //inner circle
            context?.setLineWidth(1)
            rectangle = CGRect(x: 4, y: 4, width: size.width - 8, height: size.height - 8)
            context?.addEllipse(in: rectangle)
            context?.drawPath(using: .fillStroke)
        }
        
        // Text
        if let text = text {
            let textSize = text.size(withAttributes: attributes)
            let bounds = self.bounds
            let rect = CGRect(x: bounds.size.width/2 - textSize.width/2, y: bounds.size.height/2 - textSize.height/2, width: textSize.width, height: textSize.height)
            
            text.draw(in: rect, withAttributes: attributes)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
   
    
}

extension UIImage {
    
    convenience init?(color: UIColor, iv: UIImageView) {
        //size: CGSize = CGSize(width: 350, height: 350)
        let rect = CGRect(origin: .zero, size: CGSize(width: iv.frame.width, height: iv.frame.height))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
}


