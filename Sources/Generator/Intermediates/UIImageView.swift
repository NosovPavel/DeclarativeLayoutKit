import Foundation

@available(iOS 2.0, *)
@MainActor open class UIImageView : UIView {

    public init(image: UIImage?)

    @available(iOS 3.0, *)
    public init(image: UIImage?, highlightedImage: UIImage?)

    open var image: UIImage?

    @available(iOS 3.0, *)
    open var highlightedImage: UIImage?

    @available(iOS 13.0, *)
    open var preferredSymbolConfiguration: UIImage.SymbolConfiguration?

    open var isUserInteractionEnabled: Bool

    @available(iOS 3.0, *)
    open var isHighlighted: Bool

    open var animationImages: [UIImage]?

    @available(iOS 3.0, *)
    open var highlightedAnimationImages: [UIImage]?

    open var animationDuration: TimeInterval

    open var animationRepeatCount: Int

    @available(iOS 7.0, *)
    open var tintColor: UIColor!

    open func startAnimating()

    open func stopAnimating()

    open var isAnimating: Bool { get }

    //\/ The preferred treatment to use for HDR images. By default the image view will defer to the value from its traitCollection.
    open var preferredImageDynamicRange: UIImage.DynamicRange

    //\/ The resolved treatment to use for HDR images.
    open var imageDynamicRange: UIImage.DynamicRange { get }
}

@available(iOS 17.0, tvOS 17.0, *)
extension UIImageView {

    @MainActor @preconcurrency public func addSymbolEffect(_ effect: some DiscreteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func addSymbolEffect(_ effect: some IndefiniteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func addSymbolEffect(_ effect: some DiscreteSymbolEffect & IndefiniteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func removeSymbolEffect(ofType effect: some DiscreteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func removeSymbolEffect(ofType effect: some IndefiniteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func removeSymbolEffect(ofType effect: some DiscreteSymbolEffect & IndefiniteSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, animated: Bool = true, completion: UISymbolEffectCompletion? = nil)

    @MainActor @preconcurrency public func removeAllSymbolEffects(options: SymbolEffectOptions = .default, animated: Bool = true)

    @MainActor @preconcurrency public func setSymbolImage(_ image: UIImage, contentTransition: some ContentTransitionSymbolEffect & SymbolEffect, options: SymbolEffectOptions = .default, completion: UISymbolEffectCompletion? = nil)
}

,
extension UIImageView: Chainable {}
