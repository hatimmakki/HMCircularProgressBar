//
//  CircularProgressView.swift
//  MHCircularProgress
//
//  Created by Hatim Hoho on 2018-02-22.
//  Copyright © 2018 HatimMakki.SA. All rights reserved.
//

import UIKit

@IBDesignable
public class CircularProgressView: UIView {

    @IBInspectable
   private var _barOneColor: UIColor = UIColor(rgb: 0x49D5B2)
    public var barOneColor: UIColor {
        set { _barOneColor = newValue
            setNeedsDisplay()
        }
        get { return _barOneColor}
    }
    @IBInspectable
   private var _barTwoColor: UIColor = UIColor(rgb: 0x00BDFF)
    public var barTwoColor: UIColor {
        set { _barTwoColor = newValue
            setNeedsDisplay()
        }
        get { return _barTwoColor}
    }

    @IBInspectable
   private var _baseColor: UIColor = .gray
    public var baseColor: UIColor {
        set { _baseColor = newValue
            setNeedsDisplay()
        }
        get { return _baseColor}
    }

    @IBInspectable
    private var _barThickness: CGFloat = 6
    public var barThickness: CGFloat {
        set { _barThickness = newValue
            setNeedsDisplay()
        }
        get { return _barThickness}
    }

    @IBInspectable
    private var _scale: CGFloat = 1
    public var scale: CGFloat {
        set { _scale = newValue
            setNeedsDisplay()
        }
        get { return _scale}
    }

    @IBInspectable
    private var _progress: CGFloat = 0.68
    public var progress: CGFloat {
        set { _progress = newValue
            setNeedsDisplay()
        }
        get { return _progress}
    }

    @IBInspectable
    private var _progress2: CGFloat = 0.32
    public var progress2: CGFloat {
        set { _progress2 = newValue
            setNeedsDisplay()
        }
        get { return _progress2}
    }
    
    @IBInspectable
    private var _gap: CGFloat = 1
    public var gap: CGFloat {
        set { _gap = newValue
            setNeedsDisplay()
        }
        get { return _gap}
    }
    
    @IBInspectable
    private var _baseThickness: CGFloat = 1
    public var baseThickness: CGFloat {
        set { _baseThickness = newValue
            setNeedsDisplay()
        }
        get { return _baseThickness}
    }

    override public func draw(_ rect: CGRect){
        CircularProgress.drawHMCircularProgress(frame: self.bounds, resizing: .aspectFit, barOne: barOneColor, guide: baseColor, barTwo: barTwoColor, thickness: barThickness, scale: scale, progress: progress, progress_2: progress2, gap: gap, baseThickness: baseThickness)
    }
}
