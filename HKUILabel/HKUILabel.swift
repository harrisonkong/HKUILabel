//
//  HKLabel.swift
//  HK Enhanced UILabel
//

///  MIT License
///
///  Copyright (c) 2020 Harrison Kong
///
///  Permission is hereby granted, free of charge, to any person obtaining a copy
///  of this software and associated documentation files (the "Software"), to deal
///  in the Software without restriction, including without limitation the rights
///  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell/
///  copies of the Software, and to permit persons to whom the Software is
///  furnished to do so, subject to the following conditions:
///
///  The above copyright notice and this permission notice shall be included in all
///  copies or substantial portions of the Software.
///
///  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
///  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
///  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
///  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
///  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
///  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
///  SOFTWARE.

//  Version: 1.0.0
//
//  Version History
//  -----------------------------------------------------------------
//  1.0.0     - 2020/02/05  initial release

//  Dependencies
//  -----------------------------------------------------------------
//  HKLengthSizeCalculationBasis    >= 1.0.0

import UIKit
import HKUIViewLengthCalculationBasis
import HKUIViewUtilities

@IBDesignable public class HKUILabel : UILabel {

    // MARK: - IB Inspectable Properties
    // MARK: -
    
    @IBInspectable public var autoSizeFont : Bool = false {
        didSet {
            updateFontSize()
        }
    }
    
    // unfortunately IB inspectable does not support enum, we have to use
    // an integer:
    //
    // 1 = .width
    // 2 = .height
    // 3 = .shorterEdge
    // 4 = .longerEdge
    // 5 = .constant   (not used here, since we can just use the IB font size)
    
    var fontBasis : LengthCalculationBasis = .height
    
    @IBInspectable public var autoSizeFontBasis : Int {
        get {
            return fontBasis.rawValue
        }
        set(index) {
            
            var newIndex = index
            if newIndex < 0 { newIndex = 1 }
            if newIndex > 4 { newIndex = 4 }
            fontBasis = LengthCalculationBasis(rawValue: newIndex) ?? .shorterEdge
            updateFontSize()
        }
    }
    
    @IBInspectable public var autoSizefontFactor : CGFloat = 0.5 {
        didSet {
            updateFontSize()
        }
    }
    
    // MARK: - Overridden Methods
    // MARK: -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
  
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateFontSize()
    }
    
    override public func prepareForInterfaceBuilder() {
        commonInit()
    }
    
    // MARK: - Private Methods
    // MARK: -
    
    private func commonInit() {
        updateFontSize()
    }
    
    private func updateFontSize() {
        
        if autoSizeFont {
            switch fontBasis {
                
            case .width:
                font = font.withSize(frame.width / autoSizefontFactor)
            
            case .height:
                font = font.withSize(frame.height / autoSizefontFactor)

            case .shorterEdge:
                font = font.withSize(shorterEdgeLength() / autoSizefontFactor)

            case .longerEdge:
                font = font.withSize(longerEdgeLength() / autoSizefontFactor)

            case .constant:
                // do nothing (same as setting autoSizeFont to false)
                break
            }
        }
    }
}

