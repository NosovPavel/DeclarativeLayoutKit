import Foundation

@MainActor public protocol UITextViewDelegate : UIScrollViewDelegate {

    @available(iOS 2.0, *)
    optional func textViewShouldBeginEditing(_ textView: UITextView) -> Bool

    @available(iOS 2.0, *)
    optional func textViewShouldEndEditing(_ textView: UITextView) -> Bool

    @available(iOS 2.0, *)
    optional func textViewDidBeginEditing(_ textView: UITextView)

    @available(iOS 2.0, *)
    optional func textViewDidEndEditing(_ textView: UITextView)

    @available(iOS 2.0, *)
    optional func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool

    @available(iOS 2.0, *)
    optional func textViewDidChange(_ textView: UITextView)

    @available(iOS 2.0, *)
    optional func textViewDidChangeSelection(_ textView: UITextView)

    /**
     * @abstract Asks the delegate for the menu to be shown for the specified text range.
     *
     * @param textView                     The text view requesting the menu.
     * @param range                            The text range for which the menu is presented for.
     * @param suggestedActions   The actions and commands that the system suggests.
     *
     * @return Return a UIMenu describing the desired menu hierarchy. Return @c nil to present the default system menu.
     */
    @available(iOS 16.0, *)
    optional func textView(_ textView: UITextView, editMenuForTextIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu?

    /**
     * @abstract Called when the text view is about to present the edit menu.
     *
     * @param textView      The text view displaying the menu.
     * @param animator      Appearance animator. Add animations to this object to run them alongside the appearance transition.
     */
    @available(iOS 16.0, *)
    optional func textView(_ textView: UITextView, willPresentEditMenuWith animator: any UIEditMenuInteractionAnimating)

    /**
     * @abstract Called when the text view is about to dismiss the edit menu.
     *
     * @param textView      The text view displaying the menu.
     * @param animator      Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
     */
    @available(iOS 16.0, *)
    optional func textView(_ textView: UITextView, willDismissEditMenuWith animator: any UIEditMenuInteractionAnimating)

    /**
     * Asks the delegate for the action to be performed when interacting with a text item. If a nil action is provided, the text view
     * will request a menu to be presented on primary action if possible.
     *
     * @param textView  The text view requesting the primary action.
     * @param textItem  The text item for performing said action.
     * @param defaultAction The default action for the text item. Return this to perform the default action.
     *
     * @return Return a UIAction to be performed when the text item is interacted with. Return @c nil to prevent the action from being performed.
     */
    @available(iOS 17.0, *)
    optional func textView(_ textView: UITextView, primaryActionFor textItem: UITextItem, defaultAction: UIAction) -> UIAction?

    /**
     * Asks the delegate for the menu configuration to be performed when interacting with a text item.
     *
     * @param textView  The text view requesting the menu.
     * @param textItem  The text item for performing said action.
     * @param defaultMenu  The default menu for the specified text item.
     *
     * @return Return a menu configuration to be presented when the text item is interacted with. Return @c nil to prevent the menu from being presented.
     */
    @available(iOS 17.0, *)
    optional func textView(_ textView: UITextView, menuConfigurationFor textItem: UITextItem, defaultMenu: UIMenu) -> UITextItem.MenuConfiguration?

    /**
     * Informs the delegate that a text item menu is about to be presented with the specified animator.
     *
     * @param textView  The text view showing the menu.
     * @param textItem  The text item for performing said action.
     * @param animator  Appearance animator. Add animations to this object to run them alongside the appearance transition.
     */
    @available(iOS 17.0, *)
    optional func textView(_ textView: UITextView, textItemMenuWillDisplayFor textItem: UITextItem, animator: any UIContextMenuInteractionAnimating)

    /**
     * Informs the delegate that a text item menu is about to be dismissed with the specified animator.
     *
     * @param textView  The text view showing the menu.
     * @param textItem  The text item for performing said action.
     * @param animator  Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
     */
    @available(iOS 17.0, *)
    optional func textView(_ textView: UITextView, textItemMenuWillEndFor textItem: UITextItem, animator: any UIContextMenuInteractionAnimating)

    /**
     * @abstract Informs the delegate that Writing Tools will begin manipulating the text view
     *
     * @param textView  The text view interacting with Writing Tools
     */
    @available(iOS 18.0, *)
    optional func textViewWritingToolsWillBegin(_ textView: UITextView)

    /**
     * @abstract Informs the delegate that Writing Tools has finished manipulating the text view
     *
     * @param textView  The text view interacting with Writing Tools
     */
    @available(iOS 18.0, *)
    optional func textViewWritingToolsDidEnd(_ textView: UITextView)

    /**
     * @abstract Allows the delegate to specify ranges of text to be ignored by Writing Tools
     *
     * @param textView  The text view interacting with Writing Tools
     * @param enclosingRange
     *
     * @return Return an array of ranges in the attributed substring of the textView storage with the enclosing range representing portions of text to be ignored by Writing Tools when evaluating the text for proofreading, summarization, rewrites, and so forth.
     */
    @available(iOS 18.0, *)
    optional func textView(_ textView: UITextView, writingToolsIgnoredRangesInEnclosingRange enclosingRange: NSRange) -> [NSValue]

    @available(iOS, introduced: 10.0, deprecated: 17.0, message: \"Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.\")
    optional func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool

    @available(iOS, introduced: 10.0, deprecated: 17.0, message: \"Replaced by primaryActionForTextItem: and menuConfigurationForTextItem: for additional customization options.\")
    optional func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool

    @available(iOS, introduced: 7.0, deprecated: 10.0)
    optional func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool

    @available(iOS, introduced: 7.0, deprecated: 10.0)
    optional func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool

    /**
     * @abstract Informs the delegate that text formatting controller is about to be presented.
     *
     * @param viewController  The text formatting controller that is being presented.
     */
    @available(iOS 18.0, *)
    optional func textView(_ textView: UITextView, willBeginFormattingWith viewController: UITextFormattingViewController)

    /**
     * @abstract Informs the delegate that text formatting controller has been presented.
     *
     * @param viewController  The text formatting controller that is being presented.
     */
    @available(iOS 18.0, *)
    optional func textView(_ textView: UITextView, didBeginFormattingWith viewController: UITextFormattingViewController)

    /**
     * @abstract Informs the delegate that text formatting controller is about to be dismissed.
     *
     * @param viewController  The text formatting controller that is being presented.
     */
    @available(iOS 18.0, *)
    optional func textView(_ textView: UITextView, willEndFormattingWith viewController: UITextFormattingViewController)

    /**
     * @abstract Informs the delegate that text formatting controller has been dismissed.
     *
     * @param viewController  The text formatting controller that is being presented.
     */
    @available(iOS 18.0, *)
    optional func textView(_ textView: UITextView, didEndFormattingWith viewController: UITextFormattingViewController)
}

extension UITextView {

    //\/ The type of border around the text view.
    @available(iOS 17.0, *)
    public enum BorderStyle : Int, @unchecked Sendable {

        //\/ The text view does not display a border.
        case none = 0
    }

    nonisolated public class let textDidBeginEditingNotification: NSNotification.Name

    nonisolated public class let textDidChangeNotification: NSNotification.Name

    nonisolated public class let textDidEndEditingNotification: NSNotification.Name
}

@available(iOS 2.0, *)
@MainActor open class UITextView : UIScrollView, UITextInput, UIContentSizeCategoryAdjusting, UILetterformAwareAdjusting {

    weak open var delegate: (any UITextViewDelegate)?

    open var text: String!

    open var font: UIFont?

    open var textColor: UIColor?

    open var textAlignment: NSTextAlignment

    open var selectedRange: NSRange

    open var isEditable: Bool

    @available(iOS 7.0, *)
    open var isSelectable: Bool

    @available(iOS 3.0, *)
    open var dataDetectorTypes: UIDataDetectorTypes

    @available(iOS 6.0, *)
    open var allowsEditingTextAttributes: Bool

    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString!

    @available(iOS 6.0, *)
    open var typingAttributes: [NSAttributedString.Key : Any]

    open func scrollRangeToVisible(_ range: NSRange)

    open var inputView: UIView?

    open var inputAccessoryView: UIView?

    @available(iOS 6.0, *)
    open var clearsOnInsertion: Bool

    @available(iOS 7.0, *)
    public init(frame: CGRect, textContainer: NSTextContainer?)

    @available(iOS 16.0, *)
    public convenience init(usingTextLayoutManager: Bool)

    public init?(coder: NSCoder)

    @available(iOS 7.0, *)
    open var textContainer: NSTextContainer { get }

    @available(iOS 7.0, *)
    open var textContainerInset: UIEdgeInsets

    @available(iOS 16.0, *)
    open var textLayoutManager: NSTextLayoutManager? { get }

    @available(iOS 7.0, *)
    open var layoutManager: NSLayoutManager { get }

    @available(iOS 7.0, *)
    open var textStorage: NSTextStorage { get }

    @available(iOS 7.0, *)
    open var linkTextAttributes: [NSAttributedString.Key : Any]!

    @available(iOS 13.0, *)
    open var usesStandardTextScaling: Bool

    //\/ If `findInteractionEnabled` is set to true, returns this text view's built-in find interaction. Otherwise, nil.
    @available(iOS 16.0, *)
    open var findInteraction: UIFindInteraction? { get }

    //\/ Enables this text view's built-in find interaction.
    @available(iOS 16.0, *)
    open var isFindInteractionEnabled: Bool

    //\/ The border style for the text field.
    @available(iOS 17.0, *)
    open var borderStyle: UITextView.BorderStyle

    @available(iOS 18.0, *)
    open var textHighlightAttributes: [NSAttributedString.Key : Any]!

    @available(iOS 18.0, *)
    open func drawTextHighlightBackground(for textRange: NSTextRange, origin: CGPoint)

    /**
     * @abstract Convenience for tracking whether Writing Tools is active
     *
     * @return Returns @c YES while Writing Tools is interacting with the receiver (after @c -textViewWritingToolsWillBegin: completes until @c -textViewWritingToolsDidEnd: completes)
     */
    @available(iOS 18.0, *)
    open var isWritingToolsActive: Bool { get }

    @available(iOS 18.0, *)
    open var writingToolsBehavior: UIWritingToolsBehavior

    @available(iOS 18.0, *)
    open var allowedWritingToolsResultOptions: UIWritingToolsResultOptions

    //\/ For text views that have flag `allowsEditingTextAttributes` set,
    //\/ this configuration will be used for `UITextFormattingViewController`
    //\/ when its presentation is requested.
    //\/ 
    //\/ It has a non-nil default value.
    @available(iOS 18.0, *)
    @NSCopying open var textFormattingConfiguration: UITextFormattingViewController.Configuration?
}

@available(iOS 16.0, *)
extension UITextView : UITextSearching {

    @MainActor @preconcurrency public func compare(_ foundRange: UITextRange, toRange: UITextRange, document: AnyHashable??) -> ComparisonResult

    @MainActor @preconcurrency public func performTextSearch(queryString: String, options: UITextSearchOptions, resultAggregator: UITextSearchAggregator<AnyHashable?>)

    @MainActor @preconcurrency public func decorate(foundTextRange: UITextRange, document: AnyHashable??, usingStyle: UITextSearchFoundTextStyle)

    @MainActor @preconcurrency public func shouldReplace(foundTextRange: UITextRange, document: UITextView.DocumentIdentifier?, withText text: String) -> Bool

    @MainActor @preconcurrency public func replace(foundTextRange: UITextRange, document: UITextView.DocumentIdentifier?, withText text: String)

    @MainActor @preconcurrency public func replaceAll(queryString: String, options: UITextSearchOptions, withText text: String)

    @MainActor @preconcurrency public func willHighlight(foundTextRange: UITextRange, document: AnyHashable??)

    @MainActor @preconcurrency public func scrollRangeToVisible(_ range: UITextRange, inDocument: AnyHashable??)

    @available(iOS 16.0, *)
    public typealias DocumentIdentifier = AnyHashable?
}

extension UITextView : UITextDraggable, UITextDroppable, UITextPasteConfigurationSupporting, UIFindInteractionDelegate {
}

extension UITextView {

    @available(iOS 15.0, *)
    open var interactionState: Any
}

,
extension UITextView: Chainable {}
