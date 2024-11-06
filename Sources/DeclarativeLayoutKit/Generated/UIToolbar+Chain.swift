// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import UIKit


public extension UIToolbar {
    @discardableResult
    func barStyle(_ newValue: UIBarStyle) -> Self {
        barStyle = newValue
        return self
    }

    @discardableResult
    func items(_ newValue: [UIBarButtonItem]?) -> Self {
        items = newValue
        return self
    }

    [@available(iOS 3.0, *)]
    @discardableResult
    func isTranslucent(_ newValue: Bool) -> Self {
        isTranslucent = newValue
        return self
    }

    [@available(iOS 7.0, *)]
    @discardableResult
    func barTintColor(_ newValue: UIColor?) -> Self {
        barTintColor = newValue
        return self
    }

    [@available(iOS 13.0, *)]
    @discardableResult
    func standardAppearance(_ newValue: UIToolbarAppearance) -> Self {
        standardAppearance = newValue
        return self
    }

    [@available(iOS 13.0, *)]
    @discardableResult
    func compactAppearance(_ newValue: UIToolbarAppearance?) -> Self {
        compactAppearance = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func scrollEdgeAppearance(_ newValue: UIToolbarAppearance?) -> Self {
        scrollEdgeAppearance = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func compactScrollEdgeAppearance(_ newValue: UIToolbarAppearance?) -> Self {
        compactScrollEdgeAppearance = newValue
        return self
    }

    [@available(iOS 7.0, *)]
    @discardableResult
    func delegate(_ newValue: any UIToolbarDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func bounds(_ newValue: CGRect) -> Self {
        bounds = newValue
        return self
    }

}
