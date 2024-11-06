import Foundation

@available(iOS 2.0, *)
@MainActor open class UISlider : UIControl, NSCoding {

    open var value: Float

    open var minimumValue: Float

    open var maximumValue: Float

    open var minimumValueImage: UIImage?

    open var maximumValueImage: UIImage?

    open var isContinuous: Bool

    @available(iOS 5.0, *)
    open var minimumTrackTintColor: UIColor?

    @available(iOS 5.0, *)
    open var maximumTrackTintColor: UIColor?

    @available(iOS 5.0, *)
    open var thumbTintColor: UIColor?

    open func setValue(_ value: Float, animated: Bool)

    open func setThumbImage(_ image: UIImage?, for state: UIControl.State)

    open func setMinimumTrackImage(_ image: UIImage?, for state: UIControl.State)

    open func setMaximumTrackImage(_ image: UIImage?, for state: UIControl.State)

    open func thumbImage(for state: UIControl.State) -> UIImage?

    open func minimumTrackImage(for state: UIControl.State) -> UIImage?

    open func maximumTrackImage(for state: UIControl.State) -> UIImage?

    open var currentThumbImage: UIImage? { get }

    open var currentMinimumTrackImage: UIImage? { get }

    open var currentMaximumTrackImage: UIImage? { get }

    open func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect

    open func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect

    open func trackRect(forBounds bounds: CGRect) -> CGRect

    open func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect
}

,
extension UISlider: Chainable {}
