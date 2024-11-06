import Foundation

extension UIScrollView {

    public enum IndicatorStyle : Int, @unchecked Sendable {

        case `default` = 0

        case black = 1

        case white = 2
    }

    @available(iOS 7.0, *)
    public enum KeyboardDismissMode : Int, @unchecked Sendable {

        case none = 0

        case onDrag = 1

        case interactive = 2

        case onDragWithAccessory = 3

        case interactiveWithAccessory = 4
    }

    public enum IndexDisplayMode : Int, @unchecked Sendable {

        case automatic = 0

        case alwaysHidden = 1
    }

    @available(iOS 11.0, *)
    public enum ContentInsetAdjustmentBehavior : Int, @unchecked Sendable {

        case automatic = 0

        case scrollableAxes = 1

        case never = 2

        case always = 3
    }

    public struct DecelerationRate : Hashable, Equatable, RawRepresentable, @unchecked Sendable {

        public init(rawValue: CGFloat)
    }
}

extension UIScrollView.DecelerationRate {

    @available(iOS 3.0, *)
    public static let normal: UIScrollView.DecelerationRate

    @available(iOS 3.0, *)
    public static let fast: UIScrollView.DecelerationRate
}

@available(iOS 2.0, *)
@MainActor open class UIScrollView : UIView, NSCoding, UIFocusItemScrollableContainer {

    open var contentOffset: CGPoint

    open var contentSize: CGSize

    open var contentInset: UIEdgeInsets

    @available(iOS 17.4, *)
    open var contentAlignmentPoint: CGPoint

    @available(iOS 11.0, *)
    open var adjustedContentInset: UIEdgeInsets { get }

    @available(iOS 11.0, *)
    open func adjustedContentInsetDidChange()

    @available(iOS 11.0, *)
    open var contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior

    @available(iOS 13.0, *)
    open var automaticallyAdjustsScrollIndicatorInsets: Bool

    @available(iOS 11.0, *)
    open var contentLayoutGuide: UILayoutGuide { get }

    @available(iOS 11.0, *)
    open var frameLayoutGuide: UILayoutGuide { get }

    weak open var delegate: (any UIScrollViewDelegate)?

    open var isDirectionalLockEnabled: Bool

    open var bounces: Bool

    @available(iOS 17.4, *)
    open var bouncesHorizontally: Bool

    @available(iOS 17.4, *)
    open var bouncesVertically: Bool

    open var alwaysBounceVertical: Bool

    open var alwaysBounceHorizontal: Bool

    open var isPagingEnabled: Bool

    open var isScrollEnabled: Bool

    @available(iOS 17.4, *)
    open var transfersHorizontalScrollingToParent: Bool

    @available(iOS 17.4, *)
    open var transfersVerticalScrollingToParent: Bool

    open var showsVerticalScrollIndicator: Bool

    open var showsHorizontalScrollIndicator: Bool

    open var indicatorStyle: UIScrollView.IndicatorStyle

    @available(iOS 11.1, *)
    open var verticalScrollIndicatorInsets: UIEdgeInsets

    @available(iOS 11.1, *)
    open var horizontalScrollIndicatorInsets: UIEdgeInsets

    open var scrollIndicatorInsets: UIEdgeInsets

    @available(iOS 3.0, *)
    open var decelerationRate: UIScrollView.DecelerationRate

    open var indexDisplayMode: UIScrollView.IndexDisplayMode

    open func setContentOffset(_ contentOffset: CGPoint, animated: Bool)

    open func scrollRectToVisible(_ rect: CGRect, animated: Bool)

    open func flashScrollIndicators()

    @available(iOS 17.4, *)
    open func withScrollIndicatorsShown(forContentOffsetChanges changes: () -> Void)

    open var isTracking: Bool { get }

    open var isDragging: Bool { get }

    open var isDecelerating: Bool { get }

    @available(iOS 17.4, *)
    open var isScrollAnimating: Bool { get }

    open var delaysContentTouches: Bool

    open var canCancelContentTouches: Bool

    open func touchesShouldBegin(_ touches: Set<UITouch>, with event: UIEvent?, in view: UIView) -> Bool

    open func touchesShouldCancel(in view: UIView) -> Bool

    open var minimumZoomScale: CGFloat

    open var maximumZoomScale: CGFloat

    @available(iOS 3.0, *)
    open var zoomScale: CGFloat

    @available(iOS 3.0, *)
    open func setZoomScale(_ scale: CGFloat, animated: Bool)

    @available(iOS 3.0, *)
    open func zoom(to rect: CGRect, animated: Bool)

    open var bouncesZoom: Bool

    open var isZooming: Bool { get }

    open var isZoomBouncing: Bool { get }

    @available(iOS 17.4, *)
    open var isZoomAnimating: Bool { get }

    open var scrollsToTop: Bool

    @available(iOS 17.4, *)
    open func stopScrollingAndZooming()

    @available(iOS 5.0, *)
    open var panGestureRecognizer: UIPanGestureRecognizer { get }

    @available(iOS 5.0, *)
    open var pinchGestureRecognizer: UIPinchGestureRecognizer? { get }

    open var directionalPressGestureRecognizer: UIGestureRecognizer { get }

    @available(iOS 7.0, *)
    open var keyboardDismissMode: UIScrollView.KeyboardDismissMode

    @available(iOS 10.0, *)
    open var refreshControl: UIRefreshControl?

    //\/ Set this to YES to make the scroll view animate its content offset in response to keys like Page Up\/Down, Home\/End, and the arrow keys.
    //\/ The scroll view must be focused or first responder in order to receive these key events. Default is YES for apps linked after iOS 17.0.
    @available(iOS 17.0, *)
    open var allowsKeyboardScrolling: Bool
}

@MainActor public protocol UIScrollViewDelegate : NSObjectProtocol {

    @available(iOS 2.0, *)
    optional func scrollViewDidScroll(_ scrollView: UIScrollView)

    @available(iOS 3.2, *)
    optional func scrollViewDidZoom(_ scrollView: UIScrollView)

    @available(iOS 2.0, *)
    optional func scrollViewWillBeginDragging(_ scrollView: UIScrollView)

    @available(iOS 5.0, *)
    optional func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)

    @available(iOS 2.0, *)
    optional func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)

    @available(iOS 2.0, *)
    optional func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView)

    @available(iOS 2.0, *)
    optional func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)

    @available(iOS 2.0, *)
    optional func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)

    @available(iOS 2.0, *)
    optional func viewForZooming(in scrollView: UIScrollView) -> UIView?

    @available(iOS 3.2, *)
    optional func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?)

    @available(iOS 2.0, *)
    optional func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat)

    @available(iOS 2.0, *)
    optional func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool

    @available(iOS 2.0, *)
    optional func scrollViewDidScrollToTop(_ scrollView: UIScrollView)

    @available(iOS 11.0, *)
    optional func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView)
}

,
extension UIScrollView: Chainable {}
