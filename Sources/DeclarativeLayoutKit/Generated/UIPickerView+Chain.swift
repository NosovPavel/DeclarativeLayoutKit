// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import UIKit


public extension UIPickerView {
    @discardableResult
    func dataSource(_ newValue: any UIPickerViewDataSource?) -> Self {
        dataSource = newValue
        return self
    }

    @discardableResult
    func delegate(_ newValue: any UIPickerViewDelegate?) -> Self {
        delegate = newValue
        return self
    }

    @discardableResult
    func bounds(_ newValue: CGRect) -> Self {
        bounds = newValue
        return self
    }

}
