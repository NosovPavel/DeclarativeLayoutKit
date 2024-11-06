import Foundation

extension UIStackView {

    @available(iOS 9.0, *)
    public enum Distribution : Int, @unchecked Sendable {

        case fill = 0

        case fillEqually = 1

        case fillProportionally = 2

        case equalSpacing = 3

        case equalCentering = 4
    }

    @available(iOS 9.0, *)
    public enum Alignment : Int, @unchecked Sendable {

        case fill = 0

        case leading = 1

        public static var top: UIStackView.Alignment { get }

        case firstBaseline = 2

        case center = 3

        case trailing = 4

        public static var bottom: UIStackView.Alignment { get }

        case lastBaseline = 5
    }

    @available(iOS 11.0, *)
    public class let spacingUseDefault: CGFloat

    @available(iOS 11.0, *)
    public class let spacingUseSystem: CGFloat
}

@available(iOS 9.0, *)
@MainActor open class UIStackView : UIView {

    public init(frame: CGRect)

    public init(coder: NSCoder)

    public convenience init(arrangedSubviews views: [UIView])

    open var arrangedSubviews: [UIView] { get }

    open func addArrangedSubview(_ view: UIView)

    open func removeArrangedSubview(_ view: UIView)

    open func insertArrangedSubview(_ view: UIView, at stackIndex: Int)

    open var axis: NSLayoutConstraint.Axis

    open var distribution: UIStackView.Distribution

    open var alignment: UIStackView.Alignment

    open var spacing: CGFloat

    @available(iOS 11.0, *)
    open func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView)

    @available(iOS 11.0, *)
    open func customSpacing(after arrangedSubview: UIView) -> CGFloat

    open var isBaselineRelativeArrangement: Bool

    open var isLayoutMarginsRelativeArrangement: Bool
}

,
extension UIStackView: Chainable {}
