// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import UIKit


public extension UIButton {
    [@available(iOS 15.0, *)]
    @discardableResult
    func configurationUpdateHandler(_ newValue: UIButton.ConfigurationUpdateHandler?) -> Self {
        configurationUpdateHandler = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func automaticallyUpdatesConfiguration(_ newValue: Bool) -> Self {
        automaticallyUpdatesConfiguration = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func role(_ newValue: UIButton.Role) -> Self {
        role = newValue
        return self
    }

    [@available(iOS 13.4, *)]
    @discardableResult
    func isPointerInteractionEnabled(_ newValue: Bool) -> Self {
        isPointerInteractionEnabled = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func menu(_ newValue: UIMenu?) -> Self {
        menu = newValue
        return self
    }

    [@available(iOS 16.0, *)]
    @discardableResult
    func preferredMenuElementOrder(_ newValue: UIContextMenuConfiguration.ElementOrder) -> Self {
        preferredMenuElementOrder = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func changesSelectionAsPrimaryAction(_ newValue: Bool) -> Self {
        changesSelectionAsPrimaryAction = newValue
        return self
    }

}
