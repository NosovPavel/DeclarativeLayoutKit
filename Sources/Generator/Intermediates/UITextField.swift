import Foundation

@available(iOS 2.0, *)
@MainActor open class UITextField : UIControl, UITextInput, NSCoding, UIContentSizeCategoryAdjusting, UILetterformAwareAdjusting {

    open var text: String?

    @available(iOS 6.0, *)
    @NSCopying open var attributedText: NSAttributedString?

    open var textColor: UIColor?

    open var font: UIFont?

    open var textAlignment: NSTextAlignment

    open var borderStyle: UITextField.BorderStyle

    @available(iOS 7.0, *)
    open var defaultTextAttributes: [NSAttributedString.Key : Any]

    open var placeholder: String?

    @available(iOS 6.0, *)
    @NSCopying open var attributedPlaceholder: NSAttributedString?

    open var clearsOnBeginEditing: Bool

    open var adjustsFontSizeToFitWidth: Bool

    open var minimumFontSize: CGFloat

    weak open var delegate: (any UITextFieldDelegate)?

    open var background: UIImage?

    open var disabledBackground: UIImage?

    open var isEditing: Bool { get }

    @available(iOS 6.0, *)
    open var allowsEditingTextAttributes: Bool

    @available(iOS 6.0, *)
    open var typingAttributes: [NSAttributedString.Key : Any]?

    open var clearButtonMode: UITextField.ViewMode

    open var leftView: UIView?

    open var leftViewMode: UITextField.ViewMode

    open var rightView: UIView?

    open var rightViewMode: UITextField.ViewMode

    open func borderRect(forBounds bounds: CGRect) -> CGRect

    open func textRect(forBounds bounds: CGRect) -> CGRect

    open func placeholderRect(forBounds bounds: CGRect) -> CGRect

    open func editingRect(forBounds bounds: CGRect) -> CGRect

    open func clearButtonRect(forBounds bounds: CGRect) -> CGRect

    open func leftViewRect(forBounds bounds: CGRect) -> CGRect

    open func rightViewRect(forBounds bounds: CGRect) -> CGRect

    @available(iOS, introduced: 2.0, deprecated: 15.0, message: \"This method is no longer called.\")
    open func drawText(in rect: CGRect)

    open func drawPlaceholder(in rect: CGRect)

    open var inputView: UIView?

    open var inputAccessoryView: UIView?

    @available(iOS 6.0, *)
    open var clearsOnInsertion: Bool
}

extension UITextField : UITextDraggable, UITextDroppable, UITextPasteConfigurationSupporting {
}

extension UITextField {

    @available(iOS 15.0, *)
    open var interactionState: Any
}

extension UIView {

    open func endEditing(_ force: Bool) -> Bool
}

@MainActor public protocol UITextFieldDelegate : NSObjectProtocol {

    @available(iOS 2.0, *)
    optional func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool

    @available(iOS 2.0, *)
    optional func textFieldDidBeginEditing(_ textField: UITextField)

    @available(iOS 2.0, *)
    optional func textFieldShouldEndEditing(_ textField: UITextField) -> Bool

    @available(iOS 2.0, *)
    optional func textFieldDidEndEditing(_ textField: UITextField)

    @available(iOS 10.0, *)
    optional func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason)

    @available(iOS 2.0, *)
    optional func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    @available(iOS 13.0, *)
    optional func textFieldDidChangeSelection(_ textField: UITextField)

    @available(iOS 2.0, *)
    optional func textFieldShouldClear(_ textField: UITextField) -> Bool

    @available(iOS 2.0, *)
    optional func textFieldShouldReturn(_ textField: UITextField) -> Bool

    /**
     * @abstract Asks the delegate for the menu to be shown for the specified text range.
     *
     * @param textField                   The text field requesting the menu.
     * @param range                            The characters range for which the menu is presented for.
     * @param suggestedActions   The actions and commands that the system suggests.
     *
     * @return Return a UIMenu describing the desired menu hierarchy. Return @c nil to present the default system menu.
     */
    @available(iOS 16.0, *)
    optional func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu?

    /**
     * @abstract Called when the text field is about to present the edit menu.
     *
     * @param textField    The text field displaying the menu.
     * @param animator      Appearance animator. Add animations to this object to run them alongside the appearance transition.
     */
    @available(iOS 16.0, *)
    optional func textField(_ textField: UITextField, willPresentEditMenuWith animator: any UIEditMenuInteractionAnimating)

    /**
     * @abstract Called when the text field is about to dismiss the edit menu.
     *
     * @param textField    The text field displaying the menu.
     * @param animator      Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
     */
    @available(iOS 16.0, *)
    optional func textField(_ textField: UITextField, willDismissEditMenuWith animator: any UIEditMenuInteractionAnimating)
}

extension UITextField {

    nonisolated public class let textDidBeginEditingNotification: NSNotification.Name

    nonisolated public class let textDidEndEditingNotification: NSNotification.Name

    nonisolated public class let textDidChangeNotification: NSNotification.Name

    @available(iOS 10.0, *)
    nonisolated public class let didEndEditingReasonUserInfoKey: String

    public enum BorderStyle : Int, @unchecked Sendable {

        case none = 0

        case line = 1

        case bezel = 2

        case roundedRect = 3
    }

    public enum ViewMode : Int, @unchecked Sendable {

        case never = 0

        case whileEditing = 1

        case unlessEditing = 2

        case always = 3
    }

    @available(iOS 10.0, *)
    public enum DidEndEditingReason : Int, @unchecked Sendable {

        case committed = 0
    }
}

,
extension UITextField: Chainable {}
