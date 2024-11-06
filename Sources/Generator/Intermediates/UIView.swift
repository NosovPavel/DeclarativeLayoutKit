import Foundation

extension UIView {

    public enum AnimationCurve : Int, @unchecked Sendable {

        case easeInOut = 0

        case easeIn = 1

        case easeOut = 2

        case linear = 3
    }

    public enum ContentMode : Int, @unchecked Sendable {

        case scaleToFill = 0

        case scaleAspectFit = 1

        case scaleAspectFill = 2

        case redraw = 3

        case center = 4

        case top = 5

        case bottom = 6

        case left = 7

        case right = 8

        case topLeft = 9

        case topRight = 10

        case bottomLeft = 11

        case bottomRight = 12
    }

    public enum AnimationTransition : Int, @unchecked Sendable {

        case none = 0

        case flipFromLeft = 1

        case flipFromRight = 2

        case curlUp = 3

        case curlDown = 4
    }

    public struct AutoresizingMask : OptionSet, @unchecked Sendable {

        public init(rawValue: UInt)

        public static var flexibleLeftMargin: UIView.AutoresizingMask { get }

        public static var flexibleWidth: UIView.AutoresizingMask { get }

        public static var flexibleRightMargin: UIView.AutoresizingMask { get }

        public static var flexibleTopMargin: UIView.AutoresizingMask { get }

        public static var flexibleHeight: UIView.AutoresizingMask { get }

        public static var flexibleBottomMargin: UIView.AutoresizingMask { get }
    }

    @available(iOS 4.0, *)
    public struct AnimationOptions : OptionSet, @unchecked Sendable {

        public init(rawValue: UInt)

        public static var layoutSubviews: UIView.AnimationOptions { get }

        public static var allowUserInteraction: UIView.AnimationOptions { get }

        public static var beginFromCurrentState: UIView.AnimationOptions { get }

        public static var `repeat`: UIView.AnimationOptions { get }

        public static var autoreverse: UIView.AnimationOptions { get }

        public static var overrideInheritedDuration: UIView.AnimationOptions { get }

        public static var overrideInheritedCurve: UIView.AnimationOptions { get }

        public static var allowAnimatedContent: UIView.AnimationOptions { get }

        public static var showHideTransitionViews: UIView.AnimationOptions { get }

        public static var overrideInheritedOptions: UIView.AnimationOptions { get }

        public static var curveEaseInOut: UIView.AnimationOptions { get }

        public static var curveEaseIn: UIView.AnimationOptions { get }

        public static var curveEaseOut: UIView.AnimationOptions { get }

        public static var curveLinear: UIView.AnimationOptions { get }

        public static var transitionFlipFromLeft: UIView.AnimationOptions { get }

        public static var transitionFlipFromRight: UIView.AnimationOptions { get }

        public static var transitionCurlUp: UIView.AnimationOptions { get }

        public static var transitionCurlDown: UIView.AnimationOptions { get }

        public static var transitionCrossDissolve: UIView.AnimationOptions { get }

        public static var transitionFlipFromTop: UIView.AnimationOptions { get }

        public static var transitionFlipFromBottom: UIView.AnimationOptions { get }

        public static var preferredFramesPerSecond60: UIView.AnimationOptions { get }

        public static var preferredFramesPerSecond30: UIView.AnimationOptions { get }
    }

    @available(iOS 7.0, *)
    public struct KeyframeAnimationOptions : OptionSet, @unchecked Sendable {

        public init(rawValue: UInt)

        public static var layoutSubviews: UIView.KeyframeAnimationOptions { get }

        public static var allowUserInteraction: UIView.KeyframeAnimationOptions { get }

        public static var beginFromCurrentState: UIView.KeyframeAnimationOptions { get }

        public static var `repeat`: UIView.KeyframeAnimationOptions { get }

        public static var autoreverse: UIView.KeyframeAnimationOptions { get }

        public static var overrideInheritedDuration: UIView.KeyframeAnimationOptions { get }

        public static var overrideInheritedOptions: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeLinear: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeDiscrete: UIView.KeyframeAnimationOptions { get }

        public static var calculationModePaced: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeCubic: UIView.KeyframeAnimationOptions { get }

        public static var calculationModeCubicPaced: UIView.KeyframeAnimationOptions { get }
    }

    @available(iOS 7.0, *)
    public enum SystemAnimation : UInt, @unchecked Sendable {

        case delete = 0
    }

    @available(iOS 7.0, *)
    public enum TintAdjustmentMode : Int, @unchecked Sendable {

        case automatic = 0

        case normal = 1

        case dimmed = 2
    }

    @available(iOS 6.0, *)
    public class let noIntrinsicMetric: CGFloat

    @available(iOS 6.0, *)
    public class let layoutFittingCompressedSize: CGSize

    @available(iOS 6.0, *)
    public class let layoutFittingExpandedSize: CGSize
}

@available(iOS 9.0, *)
public enum UISemanticContentAttribute : Int, @unchecked Sendable {

    case unspecified = 0

    case playback = 1

    case spatial = 2

    case forceLeftToRight = 3

    case forceRightToLeft = 4
}

@MainActor public protocol UICoordinateSpace : NSObjectProtocol {

    @available(iOS 8.0, *)
    func convert(_ point: CGPoint, to coordinateSpace: any UICoordinateSpace) -> CGPoint

    @available(iOS 8.0, *)
    func convert(_ point: CGPoint, from coordinateSpace: any UICoordinateSpace) -> CGPoint

    @available(iOS 8.0, *)
    func convert(_ rect: CGRect, to coordinateSpace: any UICoordinateSpace) -> CGRect

    @available(iOS 8.0, *)
    func convert(_ rect: CGRect, from coordinateSpace: any UICoordinateSpace) -> CGRect

    @available(iOS 8.0, *)
    var bounds: CGRect { get }
}

@available(iOS 2.0, *)
@MainActor open class UIView : UIResponder, NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate {

    open class var layerClass: AnyClass { get }

    public init(frame: CGRect)

    public init?(coder: NSCoder)

    open var isUserInteractionEnabled: Bool

    open var tag: Int

    open var layer: CALayer { get }

    @available(iOS 9.0, *)
    open var canBecomeFocused: Bool { get }

    @available(iOS 9.0, *)
    open var isFocused: Bool { get }

    //\/ The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
    @available(iOS 14.0, *)
    open var focusGroupIdentifier: String?

    //\/ The priority this item has in its focus group. The higher the priority, the more likely it is to get picked when focus moves into this group.
    //\/ Note: this method can only be used to increase an item's priority, not decrease it. For example if an item is currently selected, the actual priority of this item will be determined by MAX(focusGroupPriority, UIFocusGroupPrioritySelected).
    @available(iOS 15.0, *)
    open var focusGroupPriority: UIFocusGroupPriority

    //\/ Describes a visual effect to apply when this item is focused. If this property is nil no effect will be applied when this view becomes focused.
    @available(iOS 15.0, *)
    @NSCopying open var focusEffect: UIFocusEffect?

    @available(iOS 9.0, *)
    open var semanticContentAttribute: UISemanticContentAttribute

    @available(iOS 9.0, *)
    open class func userInterfaceLayoutDirection(for attribute: UISemanticContentAttribute) -> UIUserInterfaceLayoutDirection

    @available(iOS 10.0, *)
    open class func userInterfaceLayoutDirection(for semanticContentAttribute: UISemanticContentAttribute, relativeTo layoutDirection: UIUserInterfaceLayoutDirection) -> UIUserInterfaceLayoutDirection

    @available(iOS 10.0, *)
    open var effectiveUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection { get }
}

@available(iOS 17.0, tvOS 17.0, *)
extension UIView : UITraitChangeObservable {

    @discardableResult
    @MainActor public func registerForTraitChanges<Self>(_ traits: [UITrait], handler: @escaping UIView.TraitChangeHandler<Self>) -> any UITraitChangeRegistration where Self : UITraitEnvironment

    @discardableResult
    @MainActor public func registerForTraitChanges(_ traits: [UITrait], target: Any, action: Selector) -> any UITraitChangeRegistration

    @discardableResult
    @MainActor public func registerForTraitChanges(_ traits: [UITrait], action: Selector) -> any UITraitChangeRegistration

    @MainActor public func unregisterForTraitChanges(_ registration: any UITraitChangeRegistration)

    @MainActor @preconcurrency public var traitOverrides: UITraitOverrides
}

extension UIView {

    @available(swift 5.1)
    @available(iOS 15, tvOS 15, *)
    @propertyWrapper public struct Invalidating<Value, InvalidationType> where Value : Equatable, InvalidationType : UIViewInvalidating {

        public init(wrappedValue: Value, _ invalidation: InvalidationType)

        public init<InvalidationType1, InvalidationType2>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2) where InvalidationType == UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, InvalidationType3>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, InvalidationType5>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5, InvalidationType6>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5, _ invalidation6: InvalidationType6) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, UIView.Invalidations.Tuple<InvalidationType5, InvalidationType6>>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating, InvalidationType6 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5, InvalidationType6, InvalidationType7>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5, _ invalidation6: InvalidationType6, _ invalidation7: InvalidationType7) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType5, InvalidationType6>, InvalidationType7>>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating, InvalidationType6 : UIViewInvalidating, InvalidationType7 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5, InvalidationType6, InvalidationType7, InvalidationType8>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5, _ invalidation6: InvalidationType6, _ invalidation7: InvalidationType7, _ invalidation8: InvalidationType8) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType5, InvalidationType6>, UIView.Invalidations.Tuple<InvalidationType7, InvalidationType8>>>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating, InvalidationType6 : UIViewInvalidating, InvalidationType7 : UIViewInvalidating, InvalidationType8 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5, InvalidationType6, InvalidationType7, InvalidationType8, InvalidationType9>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5, _ invalidation6: InvalidationType6, _ invalidation7: InvalidationType7, _ invalidation8: InvalidationType8, _ invalidation9: InvalidationType9) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType5, InvalidationType6>, UIView.Invalidations.Tuple<InvalidationType7, InvalidationType8>>>, InvalidationType9>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating, InvalidationType6 : UIViewInvalidating, InvalidationType7 : UIViewInvalidating, InvalidationType8 : UIViewInvalidating, InvalidationType9 : UIViewInvalidating

        public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5, InvalidationType6, InvalidationType7, InvalidationType8, InvalidationType9, InvalidationType10>(wrappedValue: Value, _ invalidation1: InvalidationType1, _ invalidation2: InvalidationType2, _ invalidation3: InvalidationType3, _ invalidation4: InvalidationType4, _ invalidation5: InvalidationType5, _ invalidation6: InvalidationType6, _ invalidation7: InvalidationType7, _ invalidation8: InvalidationType8, _ invalidation9: InvalidationType9, _ invalidation10: InvalidationType10) where InvalidationType == UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType1, InvalidationType2>, UIView.Invalidations.Tuple<InvalidationType3, InvalidationType4>>, UIView.Invalidations.Tuple<UIView.Invalidations.Tuple<InvalidationType5, InvalidationType6>, UIView.Invalidations.Tuple<InvalidationType7, InvalidationType8>>>, UIView.Invalidations.Tuple<InvalidationType9, InvalidationType10>>, InvalidationType1 : UIViewInvalidating, InvalidationType2 : UIViewInvalidating, InvalidationType3 : UIViewInvalidating, InvalidationType4 : UIViewInvalidating, InvalidationType5 : UIViewInvalidating, InvalidationType6 : UIViewInvalidating, InvalidationType7 : UIViewInvalidating, InvalidationType8 : UIViewInvalidating, InvalidationType9 : UIViewInvalidating, InvalidationType10 : UIViewInvalidating
    }
}

extension UIView {

    @available(swift 5.1)
    @available(iOS 15, tvOS 15, *)
    public enum Invalidations {

        public struct Display : UIViewInvalidating {

            public init()

            public func invalidate(view: UIView)
        }

        public struct Layout : UIViewInvalidating {

            public init()

            public func invalidate(view: UIView)
        }

        public struct Constraints : UIViewInvalidating {

            public init()

            public func invalidate(view: UIView)
        }

        public struct IntrinsicContentSize : UIViewInvalidating {

            public init()

            public func invalidate(view: UIView)
        }

        public struct Configuration : UIViewInvalidating {

            public init()

            public func invalidate(view: UIView)
        }

        public struct Tuple<Invalidation1, Invalidation2> : UIViewInvalidating where Invalidation1 : UIViewInvalidating, Invalidation2 : UIViewInvalidating {

            public init(_ invalidation1: Invalidation1, _ invalidation2: Invalidation2)

            public func invalidate(view: UIView)
        }
    }
}

extension UIView {

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @preconcurrency public class func animate(springDuration duration: TimeInterval = 0.5, bounce: CGFloat = 0.0, initialSpringVelocity: CGFloat = 0.0, delay: TimeInterval = 0.0, options: UIView.AnimationOptions = [], animations: () -> Void, completion: ((Bool) -> Void)? = nil)
}

extension UIView {

    open var frame: CGRect

    open var bounds: CGRect

    open var center: CGPoint

    open var transform: CGAffineTransform

    @available(iOS 13.0, *)
    open var transform3D: CATransform3D

    @available(iOS 4.0, *)
    open var contentScaleFactor: CGFloat

    @available(iOS 16.0, *)
    open var anchorPoint: CGPoint

    open var isMultipleTouchEnabled: Bool

    open var isExclusiveTouch: Bool

    open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?

    open func point(inside point: CGPoint, with event: UIEvent?) -> Bool

    open func convert(_ point: CGPoint, to view: UIView?) -> CGPoint

    open func convert(_ point: CGPoint, from view: UIView?) -> CGPoint

    open func convert(_ rect: CGRect, to view: UIView?) -> CGRect

    open func convert(_ rect: CGRect, from view: UIView?) -> CGRect

    open var autoresizesSubviews: Bool

    open var autoresizingMask: UIView.AutoresizingMask

    open func sizeThatFits(_ size: CGSize) -> CGSize

    open func sizeToFit()
}

extension UIView {

    open var superview: UIView? { get }

    open var subviews: [UIView] { get }

    open var window: UIWindow? { get }

    open func removeFromSuperview()

    open func insertSubview(_ view: UIView, at index: Int)

    open func exchangeSubview(at index1: Int, withSubviewAt index2: Int)

    open func addSubview(_ view: UIView)

    open func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView)

    open func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView)

    open func bringSubviewToFront(_ view: UIView)

    open func sendSubviewToBack(_ view: UIView)

    open func didAddSubview(_ subview: UIView)

    open func willRemoveSubview(_ subview: UIView)

    open func willMove(toSuperview newSuperview: UIView?)

    open func didMoveToSuperview()

    open func willMove(toWindow newWindow: UIWindow?)

    open func didMoveToWindow()

    open func isDescendant(of view: UIView) -> Bool

    open func viewWithTag(_ tag: Int) -> UIView?

    open func setNeedsLayout()

    open func layoutIfNeeded()

    open func layoutSubviews()

    @available(iOS 8.0, *)
    open var layoutMargins: UIEdgeInsets

    @available(iOS 11.0, *)
    open var directionalLayoutMargins: NSDirectionalEdgeInsets

    @available(iOS 8.0, *)
    open var preservesSuperviewLayoutMargins: Bool

    @available(iOS 11.0, *)
    open var insetsLayoutMarginsFromSafeArea: Bool

    @available(iOS 8.0, *)
    open func layoutMarginsDidChange()

    @available(iOS 11.0, *)
    open var safeAreaInsets: UIEdgeInsets { get }

    @available(iOS 11.0, *)
    open func safeAreaInsetsDidChange()

    @available(iOS 9.0, *)
    open var layoutMarginsGuide: UILayoutGuide { get }

    //\/ This content guide provides a layout area that you can use to place text and related content whose width should generally be constrained to a size that is easy for the user to read. This guide provides a centered region that you can place content within to get this behavior for this view.
    @available(iOS 9.0, *)
    open var readableContentGuide: UILayoutGuide { get }

    @available(iOS 11.0, *)
    open var safeAreaLayoutGuide: UILayoutGuide { get }

    //\/ Follows the keyboard when on screen and docked. See UIKeyboardLayoutGuide.h for additional options.
    @available(iOS 15.0, *)
    open var keyboardLayoutGuide: UIKeyboardLayoutGuide { get }
}

extension UIView {

    open func draw(_ rect: CGRect)

    open func setNeedsDisplay()

    open func setNeedsDisplay(_ rect: CGRect)

    open var clipsToBounds: Bool

    @NSCopying open var backgroundColor: UIColor?

    open var alpha: CGFloat

    open var isOpaque: Bool

    open var clearsContextBeforeDrawing: Bool

    open var isHidden: Bool

    open var contentMode: UIView.ContentMode

    @available(iOS 8.0, *)
    open var mask: UIView?

    @available(iOS 7.0, *)
    open var tintColor: UIColor!

    @available(iOS 7.0, *)
    open var tintAdjustmentMode: UIView.TintAdjustmentMode

    @available(iOS 7.0, *)
    open func tintColorDidChange()
}

extension UIView {

    open class func setAnimationsEnabled(_ enabled: Bool)

    open class var areAnimationsEnabled: Bool { get }

    @available(iOS 7.0, *)
    open class func performWithoutAnimation(_ actionsWithoutAnimation: () -> Void)

    @available(iOS 9.0, *)
    open class var inheritedAnimationDuration: TimeInterval { get }
}

extension UIView {

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)

    @available(iOS 7.0, *)
    open class func animate(withDuration duration: TimeInterval, delay: TimeInterval, usingSpringWithDamping dampingRatio: CGFloat, initialSpringVelocity velocity: CGFloat, options: UIView.AnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func transition(with view: UIView, duration: TimeInterval, options: UIView.AnimationOptions = [], animations: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    @available(iOS 4.0, *)
    open class func transition(from fromView: UIView, to toView: UIView, duration: TimeInterval, options: UIView.AnimationOptions = [], completion: ((Bool) -> Void)? = nil)

    @available(iOS 7.0, *)
    open class func perform(_ animation: UIView.SystemAnimation, on views: [UIView], options: UIView.AnimationOptions = [], animations parallelAnimations: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    @available(iOS 13.0, *)
    open class func modifyAnimations(withRepeatCount count: CGFloat, autoreverses: Bool, animations: () -> Void)
}

extension UIView {

    @available(iOS 7.0, *)
    open class func animateKeyframes(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.KeyframeAnimationOptions = [], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil)

    @available(iOS 7.0, *)
    open class func animateKeyframes(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.KeyframeAnimationOptions = [], animations: @escaping () -> Void) async -> Bool

    @available(iOS 7.0, *)
    open class func addKeyframe(withRelativeStartTime frameStartTime: Double, relativeDuration frameDuration: Double, animations: @escaping () -> Void)
}

extension UIView {

    @available(iOS 3.2, *)
    open var gestureRecognizers: [UIGestureRecognizer]?

    @available(iOS 3.2, *)
    open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)

    @available(iOS 3.2, *)
    open func removeGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)

    @available(iOS 6.0, *)
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool
}

extension UIView {

    /** Begins applying `effect` to the receiver. The effect's emitted keyPath\/value pairs will be
        applied to the view's presentation layer.
     
        Animates the transition to the motion effect's values using the present UIView animation
        context. */
    @available(iOS 7.0, *)
    open func addMotionEffect(_ effect: UIMotionEffect)

    /** Stops applying `effect` to the receiver. Any affected presentation values will animate to
        their post-removal values using the present UIView animation context. */
    @available(iOS 7.0, *)
    open func removeMotionEffect(_ effect: UIMotionEffect)

    @available(iOS 7.0, *)
    open var motionEffects: [UIMotionEffect]
}

extension NSLayoutConstraint {

    public enum Axis : Int, @unchecked Sendable {

        case horizontal = 0

        case vertical = 1
    }
}

extension UIView {

    @available(iOS 6.0, *)
    open var constraints: [NSLayoutConstraint] { get }

    @available(iOS 6.0, *)
    open func addConstraint(_ constraint: NSLayoutConstraint)

    @available(iOS 6.0, *)
    open func addConstraints(_ constraints: [NSLayoutConstraint])

    @available(iOS 6.0, *)
    open func removeConstraint(_ constraint: NSLayoutConstraint)

    @available(iOS 6.0, *)
    open func removeConstraints(_ constraints: [NSLayoutConstraint])
}

extension UIView {

    @available(iOS 6.0, *)
    open func updateConstraintsIfNeeded()

    @available(iOS 6.0, *)
    open func updateConstraints()

    @available(iOS 6.0, *)
    open func needsUpdateConstraints() -> Bool

    @available(iOS 6.0, *)
    open func setNeedsUpdateConstraints()
}

extension UIView {

    @available(iOS 6.0, *)
    open var translatesAutoresizingMaskIntoConstraints: Bool

    @available(iOS 6.0, *)
    open class var requiresConstraintBasedLayout: Bool { get }
}

extension UIView {

    @available(iOS 6.0, *)
    open func alignmentRect(forFrame frame: CGRect) -> CGRect

    @available(iOS 6.0, *)
    open func frame(forAlignmentRect alignmentRect: CGRect) -> CGRect

    @available(iOS 6.0, *)
    open var alignmentRectInsets: UIEdgeInsets { get }

    @available(iOS, introduced: 6.0, deprecated: 9.0, message: \"Override -viewForFirstBaselineLayout or -viewForLastBaselineLayout as appropriate, instead\")
    open func forBaselineLayout() -> UIView

    @available(iOS 9.0, *)
    open var forFirstBaselineLayout: UIView { get }

    @available(iOS 9.0, *)
    open var forLastBaselineLayout: UIView { get }

    @available(iOS 6.0, *)
    open var intrinsicContentSize: CGSize { get }

    @available(iOS 6.0, *)
    open func invalidateIntrinsicContentSize()

    @available(iOS 6.0, *)
    open func contentHuggingPriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority

    @available(iOS 6.0, *)
    open func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis)

    @available(iOS 6.0, *)
    open func contentCompressionResistancePriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority

    @available(iOS 6.0, *)
    open func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis)
}

extension UIView {

    @available(iOS 6.0, *)
    open func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize

    @available(iOS 8.0, *)
    open func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize
}

extension UIView {

    @available(iOS 9.0, *)
    open var layoutGuides: [UILayoutGuide] { get }

    @available(iOS 9.0, *)
    open func addLayoutGuide(_ layoutGuide: UILayoutGuide)

    @available(iOS 9.0, *)
    open func removeLayoutGuide(_ layoutGuide: UILayoutGuide)
}

extension UIView {

    @available(iOS 9.0, *)
    open var leadingAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var trailingAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var leftAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var rightAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var topAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var bottomAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var widthAnchor: NSLayoutDimension { get }

    @available(iOS 9.0, *)
    open var heightAnchor: NSLayoutDimension { get }

    @available(iOS 9.0, *)
    open var centerXAnchor: NSLayoutXAxisAnchor { get }

    @available(iOS 9.0, *)
    open var centerYAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var firstBaselineAnchor: NSLayoutYAxisAnchor { get }

    @available(iOS 9.0, *)
    open var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView {

    @available(iOS 6.0, *)
    open func constraintsAffectingLayout(for axis: NSLayoutConstraint.Axis) -> [NSLayoutConstraint]

    @available(iOS 6.0, *)
    open var hasAmbiguousLayout: Bool { get }

    @available(iOS 6.0, *)
    open func exerciseAmbiguityInLayout()
}

extension UILayoutGuide {

    @available(iOS 10.0, *)
    open func constraintsAffectingLayout(for axis: NSLayoutConstraint.Axis) -> [NSLayoutConstraint]

    @available(iOS 10.0, *)
    open var hasAmbiguousLayout: Bool { get }
}

extension UIView {

    @available(iOS 6.0, *)
    open var restorationIdentifier: String?

    @available(iOS 6.0, *)
    open func encodeRestorableState(with coder: NSCoder)

    @available(iOS 6.0, *)
    open func decodeRestorableState(with coder: NSCoder)
}

extension UIView {

    @available(iOS 7.0, *)
    open func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView?

    @available(iOS 7.0, *)
    open func resizableSnapshotView(from rect: CGRect, afterScreenUpdates afterUpdates: Bool, withCapInsets capInsets: UIEdgeInsets) -> UIView?

    @available(iOS 7.0, *)
    open func drawHierarchy(in rect: CGRect, afterScreenUpdates afterUpdates: Bool) -> Bool
}

extension UIView {

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func beginAnimations(_ animationID: String?, context: UnsafeMutableRawPointer?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func commitAnimations()

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDelegate(_ delegate: Any?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationWillStart(_ selector: Selector?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDidStop(_ selector: Selector?)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDuration(_ duration: TimeInterval)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationDelay(_ delay: TimeInterval)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationStart(_ startDate: Date)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationCurve(_ curve: UIView.AnimationCurve)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationRepeatCount(_ repeatCount: Float)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationRepeatAutoreverses(_ repeatAutoreverses: Bool)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationBeginsFromCurrentState(_ fromCurrentState: Bool)

    @available(iOS, introduced: 2.0, deprecated: 13.0, message: \"Use the block-based animation API instead\")
    open class func setAnimationTransition(_ transition: UIView.AnimationTransition, for view: UIView, cache: Bool)
}

extension UIView {

    @available(iOS 13.0, *)
    open var overrideUserInterfaceStyle: UIUserInterfaceStyle
}

extension UIView {

    //\/ Specify content size category limits. Setting one or both of these properties will limit the
    //\/ content size category for this view (and its subviews) to a minimum or a maximum value.
    //\/ You can use this to limit the support content size categories on part of your view hierarchy.
    //\/ Setting this to nil removes the limit on the minimum or maximum.
    //\/ Limits will be applied immediately and when future content size category updates occur.
    //\/
    //\/ Specifying a minimum limit that is greater than the maximum limit (or vice versa) will effectively
    //\/ only use the maximum limit.
    //\/
    //\/ Example:
    //\/
    //\/     // limit the support content size categories between .medium and .accessibilityExtraLarge (included).
    //\/     view.minimumContentSizeCategory = UIContentSizeCategoryMedium;
    //\/     view.maximumContentSizeCategory = UIContentSizeCategoryAccessibilityExtraLarge;
    @available(iOS 15.0, *)
    open var minimumContentSizeCategory: UIContentSizeCategory?

    @available(iOS 15.0, *)
    open var maximumContentSizeCategory: UIContentSizeCategory?

    //\/ Will return a string with a log of all the superviews of this view, alongside with what
    //\/ content size category each view has and if that view has limits applied.
    //\/ This is for debugging purposes only.
    @available(iOS 15.0, *)
    open var appliedContentSizeCategoryLimitsDescription: String { get }
}

@available(iOS 17.0, *)
extension UIView {

    //\/ Forces an immediate trait update for this view (and its view controller, if applicable) and any subviews,
    //\/ including any view controllers or views in its subtree. Any trait change callbacks are sent synchronously.
    @available(iOS 17.0, *)
    open func updateTraitsIfNeeded()
}

,
extension UIView: Chainable {}
