import Foundation

@available(iOS 17.0, *)
public enum UILabelVibrancy : Int, @unchecked Sendable {

    case none = 0

    case automatic = 1
}

@available(iOS 2.0, *)
@MainActor open class UILabel : UIView, NSCoding, UIContentSizeCategoryAdjusting, UILetterformAwareAdjusting {

    open var text: String?

    open var font: UIFont!

    open var textColor: UIColor!

    @available(iOS 17.0, *)
    open var preferredVibrancy: UILabelVibrancy

    open var shadowColor: UIColor?

    open var shadowOffset: CGSize

    open var textAlignment: NSTextAlignment

    open var lineBreakMode: NSLineBreakMode

    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString?

    open var highlightedTextColor: UIColor?

    open var isHighlighted: Bool

    open var isUserInteractionEnabled: Bool

    open var isEnabled: Bool

    open var numberOfLines: Int

    open var adjustsFontSizeToFitWidth: Bool

    open var baselineAdjustment: UIBaselineAdjustment

    @available(iOS 6.0, *)
    open var minimumScaleFactor: CGFloat

    @available(iOS 9.0, *)
    open var allowsDefaultTighteningForTruncation: Bool

    @available(iOS 14.0, *)
    open var lineBreakStrategy: NSParagraphStyle.LineBreakStrategy

    open func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect

    open func drawText(in rect: CGRect)

    @available(iOS 6.0, *)
    open var preferredMaxLayoutWidth: CGFloat

    //\/ Indicates whether expansion text will be shown when the view is too small to show all the contents. Defaults to NO.
    open var showsExpansionTextWhenTruncated: Bool
}

,
extension UILabel: Chainable {}
