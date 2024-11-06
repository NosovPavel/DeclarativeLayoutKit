import Foundation

extension UIButton {

    public enum ButtonType : Int, @unchecked Sendable {

        case custom = 0

        @available(iOS 7.0, *)
        case system = 1

        case detailDisclosure = 2

        case infoLight = 3

        case infoDark = 4

        case contactAdd = 5

        @available(iOS 13.0, *)
        case close = 7

        public static var roundedRect: UIButton.ButtonType { get }
    }

    @available(iOS 14.0, *)
    public enum Role : Int, @unchecked Sendable {

        case normal = 0

        case primary = 1

        case cancel = 2

        case destructive = 3
    }

    @available(iOS 15.0, *)
    public typealias ConfigurationUpdateHandler = (UIButton) -> Void
}

@available(iOS 13.4, *)
public typealias UIButtonPointerStyleProvider = (UIButton, __UIPointerEffect, __UIPointerShape) -> UIPointerStyle?

@available(iOS 2.0, *)
@MainActor open class UIButton : UIControl, NSCoding {

    public init(frame: CGRect)

    public init?(coder: NSCoder)

    //\/ Initializes a custom button, registers primaryAction for the UIControlEventPrimaryActionTriggered control event, and uses primaryAction's title & image as the button's title & image.
    @available(iOS 14.0, *)
    public convenience init(frame: CGRect, primaryAction: UIAction?)

    public convenience init(type buttonType: UIButton.ButtonType)

    @available(iOS 13.0, *)
    open class func systemButton(with image: UIImage, target: Any?, action: Selector?) -> Self

    //\/ Requests the view update its configuration for its current state. This method is called automatically when the button's state may have changed, as well as in other circumstances where an update may be required. Multiple requests may be coalesced into a single update at the appropriate time.
    @available(iOS 15.0, *)
    open func setNeedsUpdateConfiguration()

    //\/ Subclasses should override this method and update the button's `configuration`. This method should not be called directly, use `setNeedsUpdateConfiguration` to request an update.
    @available(iOS 15.0, *)
    open func updateConfiguration()

    //\/ Block-based equivalent to overriding -updateConfiguration in a subclass. Setting this handler will force the button into configuration-based behavior (see the `configuration` property). This block is called after `-updateConfiguration`
    @available(iOS 15.0, *)
    open var configurationUpdateHandler: UIButton.ConfigurationUpdateHandler?

    //\/ When YES, the button will automatically call -updatedConfigurationForButton: on its `configuration ` when the button's state changes, and apply the updated configuration to the button. The default value is YES.
    @available(iOS 15.0, *)
    open var automaticallyUpdatesConfiguration: Bool

    @available(iOS 5.0, *)
    open var tintColor: UIColor!

    open var buttonType: UIButton.ButtonType { get }

    //\/ If pointer effects are enabled for the button, this will return true when an effect is active.
    @available(iOS 15.0, *)
    open var isHovered: Bool { get }

    //\/ Returns true while the button is presenting a menu.
    @available(iOS 15.0, *)
    open var isHeld: Bool { get }

    @available(iOS 14.0, *)
    open var role: UIButton.Role

    //\/ Enables this button's built-in pointer interaction.
    @available(iOS 13.4, *)
    open var isPointerInteractionEnabled: Bool

    //\/ An optional menu for the button to display. The button will automatically enable or disable its contextMenuInteraction when a non-nil or nil menu is set. Defaults to nil.
    @available(iOS 14.0, *)
    @NSCopying open var menu: UIMenu?

    //\/ Preferred menu element ordering strategy for menus displayed by this button.
    @available(iOS 16.0, *)
    open var preferredMenuElementOrder: UIContextMenuConfiguration.ElementOrder

    //\/ Indicates if the button changes selection as its primary action.
    //\/ This shows the menu as options for selection if a menu is populated and showsMenuAsPrimaryAction is enabled.
    //\/ If no menu is provided or it is not the primary action, UIControlStateSelected is toggled on and off for the primary action.
    @available(iOS 15.0, *)
    open var changesSelectionAsPrimaryAction: Bool

    open func setTitle(_ title: String?, for state: UIControl.State)

    open func setTitleColor(_ color: UIColor?, for state: UIControl.State)

    open func setTitleShadowColor(_ color: UIColor?, for state: UIControl.State)

    open func setImage(_ image: UIImage?, for state: UIControl.State)

    open func setBackgroundImage(_ image: UIImage?, for state: UIControl.State)

    @available(iOS 13.0, *)
    open func setPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State)

    @available(iOS 6.0, *)
    open func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State)

    open func title(for state: UIControl.State) -> String?

    open func titleColor(for state: UIControl.State) -> UIColor?

    open func titleShadowColor(for state: UIControl.State) -> UIColor?

    open func image(for state: UIControl.State) -> UIImage?

    open func backgroundImage(for state: UIControl.State) -> UIImage?

    @available(iOS 13.0, *)
    open func preferredSymbolConfigurationForImage(in state: UIControl.State) -> UIImage.SymbolConfiguration?

    @available(iOS 6.0, *)
    open func attributedTitle(for state: UIControl.State) -> NSAttributedString?

    open var currentTitle: String? { get }

    open var currentTitleColor: UIColor { get }

    open var currentTitleShadowColor: UIColor? { get }

    open var currentImage: UIImage? { get }

    open var currentBackgroundImage: UIImage? { get }

    @available(iOS 13.0, *)
    open var currentPreferredSymbolConfiguration: UIImage.SymbolConfiguration? { get }

    @available(iOS 6.0, *)
    open var currentAttributedTitle: NSAttributedString? { get }

    @available(iOS 3.0, *)
    open var titleLabel: UILabel? { get }

    @available(iOS 3.0, *)
    open var imageView: UIImageView? { get }

    //\/ The label used to display the subtitle, when present.
    @available(iOS 15.0, *)
    open var subtitleLabel: UILabel? { get }
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton {

    public struct Configuration : Hashable {

        public enum Size {

            case mini

            case small

            case medium

            case large

            //\/ Returns a Boolean value indicating whether two values are equal.
            //\/
            //\/ Equality is the inverse of inequality. For any values `a` and `b`,
            //\/ `a == b` implies that `a != b` is `false`.
            //\/
            //\/ - Parameters:
            //\/   - lhs: A value to compare.
            //\/   - rhs: Another value to compare.
            public static func == (a: UIButton.Configuration.Size, b: UIButton.Configuration.Size) -> Bool

            //\/ Hashes the essential components of this value by feeding them into the
            //\/ given hasher.
            //\/
            //\/ Implement this method to conform to the `Hashable` protocol. The
            //\/ components used for hashing must be the same as the components compared
            //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
            //\/ with each of these components.
            //\/
            //\/ - Important: In your implementation of `hash(into:)`,
            //\/   don't call `finalize()` on the `hasher` instance provided,
            //\/   or replace it with a different instance.
            //\/   Doing so may become a compile-time error in the future.
            //\/
            //\/ - Parameter hasher: The hasher to use when combining the components
            //\/   of this instance.
            public func hash(into hasher: inout Hasher)

            //\/ The hash value.
            //\/
            //\/ Hash values are not guaranteed to be equal across different executions of
            //\/ your program. Do not save hash values to use during a future execution.
            //\/
            //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            //\/   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public enum TitleAlignment {

            case automatic

            case leading

            case center

            case trailing

            //\/ Returns a Boolean value indicating whether two values are equal.
            //\/
            //\/ Equality is the inverse of inequality. For any values `a` and `b`,
            //\/ `a == b` implies that `a != b` is `false`.
            //\/
            //\/ - Parameters:
            //\/   - lhs: A value to compare.
            //\/   - rhs: Another value to compare.
            public static func == (a: UIButton.Configuration.TitleAlignment, b: UIButton.Configuration.TitleAlignment) -> Bool

            //\/ Hashes the essential components of this value by feeding them into the
            //\/ given hasher.
            //\/
            //\/ Implement this method to conform to the `Hashable` protocol. The
            //\/ components used for hashing must be the same as the components compared
            //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
            //\/ with each of these components.
            //\/
            //\/ - Important: In your implementation of `hash(into:)`,
            //\/   don't call `finalize()` on the `hasher` instance provided,
            //\/   or replace it with a different instance.
            //\/   Doing so may become a compile-time error in the future.
            //\/
            //\/ - Parameter hasher: The hasher to use when combining the components
            //\/   of this instance.
            public func hash(into hasher: inout Hasher)

            //\/ The hash value.
            //\/
            //\/ Hash values are not guaranteed to be equal across different executions of
            //\/ your program. Do not save hash values to use during a future execution.
            //\/
            //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            //\/   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public enum CornerStyle {

            case fixed

            case dynamic

            case small

            case medium

            case large

            case capsule

            //\/ Returns a Boolean value indicating whether two values are equal.
            //\/
            //\/ Equality is the inverse of inequality. For any values `a` and `b`,
            //\/ `a == b` implies that `a != b` is `false`.
            //\/
            //\/ - Parameters:
            //\/   - lhs: A value to compare.
            //\/   - rhs: Another value to compare.
            public static func == (a: UIButton.Configuration.CornerStyle, b: UIButton.Configuration.CornerStyle) -> Bool

            //\/ Hashes the essential components of this value by feeding them into the
            //\/ given hasher.
            //\/
            //\/ Implement this method to conform to the `Hashable` protocol. The
            //\/ components used for hashing must be the same as the components compared
            //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
            //\/ with each of these components.
            //\/
            //\/ - Important: In your implementation of `hash(into:)`,
            //\/   don't call `finalize()` on the `hasher` instance provided,
            //\/   or replace it with a different instance.
            //\/   Doing so may become a compile-time error in the future.
            //\/
            //\/ - Parameter hasher: The hasher to use when combining the components
            //\/   of this instance.
            public func hash(into hasher: inout Hasher)

            //\/ The hash value.
            //\/
            //\/ Hash values are not guaranteed to be equal across different executions of
            //\/ your program. Do not save hash values to use during a future execution.
            //\/
            //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            //\/   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public enum MacIdiomStyle {

            case automatic

            case bordered

            case borderless

            case borderlessTinted

            //\/ Returns a Boolean value indicating whether two values are equal.
            //\/
            //\/ Equality is the inverse of inequality. For any values `a` and `b`,
            //\/ `a == b` implies that `a != b` is `false`.
            //\/
            //\/ - Parameters:
            //\/   - lhs: A value to compare.
            //\/   - rhs: Another value to compare.
            public static func == (a: UIButton.Configuration.MacIdiomStyle, b: UIButton.Configuration.MacIdiomStyle) -> Bool

            //\/ Hashes the essential components of this value by feeding them into the
            //\/ given hasher.
            //\/
            //\/ Implement this method to conform to the `Hashable` protocol. The
            //\/ components used for hashing must be the same as the components compared
            //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
            //\/ with each of these components.
            //\/
            //\/ - Important: In your implementation of `hash(into:)`,
            //\/   don't call `finalize()` on the `hasher` instance provided,
            //\/   or replace it with a different instance.
            //\/   Doing so may become a compile-time error in the future.
            //\/
            //\/ - Parameter hasher: The hasher to use when combining the components
            //\/   of this instance.
            public func hash(into hasher: inout Hasher)

            //\/ The hash value.
            //\/
            //\/ Hash values are not guaranteed to be equal across different executions of
            //\/ your program. Do not save hash values to use during a future execution.
            //\/
            //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            //\/   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        @available(iOS 16.0, tvOS 16.0, *)
        public enum Indicator {

            case automatic

            case none

            case popup

            //\/ Returns a Boolean value indicating whether two values are equal.
            //\/
            //\/ Equality is the inverse of inequality. For any values `a` and `b`,
            //\/ `a == b` implies that `a != b` is `false`.
            //\/
            //\/ - Parameters:
            //\/   - lhs: A value to compare.
            //\/   - rhs: Another value to compare.
            public static func == (a: UIButton.Configuration.Indicator, b: UIButton.Configuration.Indicator) -> Bool

            //\/ Hashes the essential components of this value by feeding them into the
            //\/ given hasher.
            //\/
            //\/ Implement this method to conform to the `Hashable` protocol. The
            //\/ components used for hashing must be the same as the components compared
            //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
            //\/ with each of these components.
            //\/
            //\/ - Important: In your implementation of `hash(into:)`,
            //\/   don't call `finalize()` on the `hasher` instance provided,
            //\/   or replace it with a different instance.
            //\/   Doing so may become a compile-time error in the future.
            //\/
            //\/ - Parameter hasher: The hasher to use when combining the components
            //\/   of this instance.
            public func hash(into hasher: inout Hasher)

            //\/ The hash value.
            //\/
            //\/ Hash values are not guaranteed to be equal across different executions of
            //\/ your program. Do not save hash values to use during a future execution.
            //\/
            //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
            //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
            //\/   The compiler provides an implementation for `hashValue` for you.
            public var hashValue: Int { get }
        }

        public static func plain() -> UIButton.Configuration

        public static func tinted() -> UIButton.Configuration

        public static func gray() -> UIButton.Configuration

        public static func filled() -> UIButton.Configuration

        public static func borderless() -> UIButton.Configuration

        public static func bordered() -> UIButton.Configuration

        public static func borderedTinted() -> UIButton.Configuration

        public static func borderedProminent() -> UIButton.Configuration

        public func updated(for button: UIButton) -> UIButton.Configuration

        public var background: UIBackgroundConfiguration

        public var cornerStyle: UIButton.Configuration.CornerStyle

        public var buttonSize: UIButton.Configuration.Size

        public var macIdiomStyle: UIButton.Configuration.MacIdiomStyle

        public var baseForegroundColor: UIColor?

        public var baseBackgroundColor: UIColor?

        public var image: UIImage?

        public var imageColorTransformer: UIConfigurationColorTransformer?

        public var preferredSymbolConfigurationForImage: UIImage.SymbolConfiguration?

        public var showsActivityIndicator: Bool

        public var activityIndicatorColorTransformer: UIConfigurationColorTransformer?

        public var title: String?

        public var attributedTitle: AttributedString?

        public var titleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?

        public var subtitle: String?

        public var attributedSubtitle: AttributedString?

        public var subtitleTextAttributesTransformer: UIConfigurationTextAttributesTransformer?

        @available(iOS 16.0, tvOS 16.0, *)
        public var indicator: UIButton.Configuration.Indicator

        @available(iOS 16.0, tvOS 16.0, *)
        public var indicatorColorTransformer: UIConfigurationColorTransformer?

        public var contentInsets: NSDirectionalEdgeInsets

        public mutating func setDefaultContentInsets()

        public var imagePlacement: NSDirectionalRectEdge

        public var imagePadding: CGFloat

        public var titlePadding: CGFloat

        public var titleAlignment: UIButton.Configuration.TitleAlignment

        public var automaticallyUpdateForSelection: Bool

        //\/ Hashes the essential components of this value by feeding them into the
        //\/ given hasher.
        //\/
        //\/ Implement this method to conform to the `Hashable` protocol. The
        //\/ components used for hashing must be the same as the components compared
        //\/ in your type's `==` operator implementation. Call `hasher.combine(_:)`
        //\/ with each of these components.
        //\/
        //\/ - Important: In your implementation of `hash(into:)`,
        //\/   don't call `finalize()` on the `hasher` instance provided,
        //\/   or replace it with a different instance.
        //\/   Doing so may become a compile-time error in the future.
        //\/
        //\/ - Parameter hasher: The hasher to use when combining the components
        //\/   of this instance.
        public func hash(into hasher: inout Hasher)

        //\/ Returns a Boolean value indicating whether two values are equal.
        //\/
        //\/ Equality is the inverse of inequality. For any values `a` and `b`,
        //\/ `a == b` implies that `a != b` is `false`.
        //\/
        //\/ - Parameters:
        //\/   - lhs: A value to compare.
        //\/   - rhs: Another value to compare.
        public static func == (a: UIButton.Configuration, b: UIButton.Configuration) -> Bool

        //\/ The hash value.
        //\/
        //\/ Hash values are not guaranteed to be equal across different executions of
        //\/ your program. Do not save hash values to use during a future execution.
        //\/
        //\/ - Important: `hashValue` is deprecated as a `Hashable` requirement. To
        //\/   conform to `Hashable`, implement the `hash(into:)` requirement instead.
        //\/   The compiler provides an implementation for `hashValue` for you.
        public var hashValue: Int { get }
    }

    @MainActor @preconcurrency public convenience init(configuration: UIButton.Configuration, primaryAction: UIAction? = nil)

    @MainActor @preconcurrency public var configuration: UIButton.Configuration?
}

extension UIButton {

    @available(iOS 14.0, tvOS 14.0, *)
    @MainActor @preconcurrency public convenience init(type buttonType: UIButton.ButtonType = .system, primaryAction: UIAction?)
}

@available(iOS 13.4, *)
extension UIButton {

    public typealias PointerStyleProvider = (_ button: UIButton, _ proposedEffect: UIPointerEffect, _ proposedShape: UIPointerShape) -> UIPointerStyle?

    @MainActor @preconcurrency public var pointerStyleProvider: UIButton.PointerStyleProvider?
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration {

    public var titleLineBreakMode: NSLineBreakMode

    public var subtitleLineBreakMode: NSLineBreakMode

    public var imageReservation: CGFloat
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.Size : Equatable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.Size : Hashable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.TitleAlignment : Equatable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.TitleAlignment : Hashable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.CornerStyle : Equatable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.CornerStyle : Hashable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.MacIdiomStyle : Equatable {
}

@available(iOS 15.0, tvOS 15.0, *)
extension UIButton.Configuration.MacIdiomStyle : Hashable {
}

@available(iOS 16.0, tvOS 16.0, *)
extension UIButton.Configuration.Indicator : Equatable {
}

@available(iOS 16.0, tvOS 16.0, *)
extension UIButton.Configuration.Indicator : Hashable {
}

extension UIButton {

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration\")
    open var contentEdgeInsets: UIEdgeInsets

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration\")
    open var titleEdgeInsets: UIEdgeInsets

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration\")
    open var imageEdgeInsets: UIEdgeInsets

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration, you may customize to replicate this behavior via a configurationUpdateHandler\")
    open var reversesTitleShadowWhenHighlighted: Bool

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration, you may customize to replicate this behavior via a configurationUpdateHandler\")
    open var adjustsImageWhenHighlighted: Bool

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration, you may customize to replicate this behavior via a configurationUpdateHandler\")
    open var adjustsImageWhenDisabled: Bool

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This property is ignored when using UIButtonConfiguration\")
    open var showsTouchWhenHighlighted: Bool

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"Override layoutSubviews, call super, and position views as you desire.\")
    open func backgroundRect(forBounds bounds: CGRect) -> CGRect

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"Override layoutSubviews, call super, and position views as you desire.\")
    open func contentRect(forBounds bounds: CGRect) -> CGRect

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"Override layoutSubviews, call super, and position views as you desire.\")
    open func titleRect(forContentRect contentRect: CGRect) -> CGRect

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"Override layoutSubviews, call super, and position views as you desire.\")
    open func imageRect(forContentRect contentRect: CGRect) -> CGRect
}

extension UIButton : UISpringLoadedInteractionSupporting {
}

,
extension UIButton: Chainable {}
