import UIKit

public class CircularProgress : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawHMCircularProgress(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 196), resizing: ResizingBehavior = .aspectFit, barOne: UIColor = UIColor(red: 1.000, green: 0.033, blue: 0.033, alpha: 1.000), guide: UIColor = UIColor(red: 0.872, green: 0.872, blue: 0.872, alpha: 1.000), barTwo: UIColor = UIColor(red: 0.947, green: 0.379, blue: 0.582, alpha: 1.000), thickness: CGFloat = 4, scale: CGFloat = 1, progress: CGFloat = 0.908, progress_2: CGFloat = 0.745, gap: CGFloat = 2, baseThickness: CGFloat = 5) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 196), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 196)



        //// Variable Declarations
        let startAngl: CGFloat = 90
        let endAngl: CGFloat = 91
        let canvasWidth: CGFloat = 150
        let oval_1_width: CGFloat = canvasWidth - 20
        let dashes: CGFloat = oval_1_width * 3.14 * progress - thickness
        let oval_1_offset: CGFloat = oval_1_width / -2
        let oval_1_position: CGFloat = canvasWidth / 2.0
        let oval_2_height: CGFloat = oval_1_width - thickness * 2 * gap
        let dashes_2: CGFloat = oval_2_height * 3.14 * progress_2 - thickness
        let oval_2_offset: CGFloat = oval_2_height / -2

        //// Oval_1_back Drawing
        context.saveGState()
        context.translateBy(x: oval_1_position, y: oval_1_position)
        context.scaleBy(x: scale, y: scale)

        let oval_1_backPath = UIBezierPath(ovalIn: CGRect(x: oval_1_offset, y: (oval_1_offset + 1), width: oval_1_width, height: oval_1_width))
        guide.setStroke()
        oval_1_backPath.lineWidth = baseThickness
        oval_1_backPath.lineCapStyle = .round
        oval_1_backPath.lineJoinStyle = .round
        oval_1_backPath.stroke()

        context.restoreGState()


        //// Oval_1_back 2 Drawing
        context.saveGState()
        context.translateBy(x: oval_1_position, y: oval_1_position)
        context.scaleBy(x: scale, y: scale)

        let oval_1_back2Path = UIBezierPath(ovalIn: CGRect(x: oval_2_offset, y: (oval_2_offset + 0.876923076923), width: oval_2_height, height: oval_2_height))
        guide.setStroke()
        oval_1_back2Path.lineWidth = baseThickness
        oval_1_back2Path.lineCapStyle = .round
        oval_1_back2Path.lineJoinStyle = .round
        oval_1_back2Path.stroke()

        context.restoreGState()


        //// Oval_1 Drawing
        context.saveGState()
        context.translateBy(x: oval_1_position, y: oval_1_position)
        context.scaleBy(x: scale, y: scale)

        let oval_1Rect = CGRect(x: oval_1_offset, y: (oval_1_offset + 1), width: oval_1_width, height: oval_1_width)
        let oval_1Path = UIBezierPath()
        oval_1Path.addArc(withCenter: CGPoint(x: oval_1Rect.midX, y: oval_1Rect.midY), radius: oval_1Rect.width / 2, startAngle: -startAngl * CGFloat.pi/180, endAngle: -endAngl * CGFloat.pi/180, clockwise: true)

        barOne.setStroke()
        oval_1Path.lineWidth = thickness
        oval_1Path.lineCapStyle = .round
        oval_1Path.lineJoinStyle = .round
        context.saveGState()
        context.setLineDash(phase: 0, lengths: [dashes, 5000])
        oval_1Path.stroke()
        context.restoreGState()

        context.restoreGState()


        //// Oval_2 Drawing
        context.saveGState()
        context.translateBy(x: oval_1_position, y: oval_1_position)
        context.scaleBy(x: scale, y: scale)

        let oval_2Rect = CGRect(x: oval_2_offset, y: (oval_2_offset + 0.876923076923), width: oval_2_height, height: oval_2_height)
        let oval_2Path = UIBezierPath()
        oval_2Path.addArc(withCenter: CGPoint(x: oval_2Rect.midX, y: oval_2Rect.midY), radius: oval_2Rect.width / 2, startAngle: -startAngl * CGFloat.pi/180, endAngle: -endAngl * CGFloat.pi/180, clockwise: true)

        barTwo.setStroke()
        oval_2Path.lineWidth = thickness
        oval_2Path.lineCapStyle = .round
        oval_2Path.lineJoinStyle = .round
        context.saveGState()
        context.setLineDash(phase: 0, lengths: [dashes_2, 5000])
        oval_2Path.stroke()
        context.restoreGState()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(CircularProgressResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
