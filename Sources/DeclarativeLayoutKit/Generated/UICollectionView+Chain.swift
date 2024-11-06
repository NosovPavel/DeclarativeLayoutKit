// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import UIKit


public extension UICollectionView {
    @discardableResult
    func collectionViewLayout(_ newValue: UICollectionViewLayout) -> Self {
        collectionViewLayout = newValue
        return self
    }

    @discardableResult
    func dataSource(_ newValue: any UICollectionViewDataSource?) -> Self {
        dataSource = newValue
        return self
    }

    [@available(iOS 10.0, *)]
    @discardableResult
    func prefetchDataSource(_ newValue: any UICollectionViewDataSourcePrefetching?) -> Self {
        prefetchDataSource = newValue
        return self
    }

    [@available(iOS 10.0, *)]
    @discardableResult
    func isPrefetchingEnabled(_ newValue: Bool) -> Self {
        isPrefetchingEnabled = newValue
        return self
    }

    [@available(iOS 11.0, *)]
    @discardableResult
    func dragDelegate(_ newValue: any UICollectionViewDragDelegate?) -> Self {
        dragDelegate = newValue
        return self
    }

    [@available(iOS 11.0, *)]
    @discardableResult
    func dropDelegate(_ newValue: any UICollectionViewDropDelegate?) -> Self {
        dropDelegate = newValue
        return self
    }

    [@available(iOS 11.0, *)]
    @discardableResult
    func dragInteractionEnabled(_ newValue: Bool) -> Self {
        dragInteractionEnabled = newValue
        return self
    }

    [@available(iOS 11.0, *)]
    @discardableResult
    func reorderingCadence(_ newValue: UICollectionView.ReorderingCadence) -> Self {
        reorderingCadence = newValue
        return self
    }

    [@available(iOS 16.0, *)]
    @discardableResult
    func selfSizingInvalidation(_ newValue: UICollectionView.SelfSizingInvalidation) -> Self {
        selfSizingInvalidation = newValue
        return self
    }

    @discardableResult
    func backgroundView(_ newValue: UIView?) -> Self {
        backgroundView = newValue
        return self
    }

    @discardableResult
    func allowsSelection(_ newValue: Bool) -> Self {
        allowsSelection = newValue
        return self
    }

    @discardableResult
    func allowsMultipleSelection(_ newValue: Bool) -> Self {
        allowsMultipleSelection = newValue
        return self
    }

    [@available(iOS 9.0, *)]
    @discardableResult
    func remembersLastFocusedIndexPath(_ newValue: Bool) -> Self {
        remembersLastFocusedIndexPath = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func selectionFollowsFocus(_ newValue: Bool) -> Self {
        selectionFollowsFocus = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func allowsFocus(_ newValue: Bool) -> Self {
        allowsFocus = newValue
        return self
    }

    [@available(iOS 15.0, *)]
    @discardableResult
    func allowsFocusDuringEditing(_ newValue: Bool) -> Self {
        allowsFocusDuringEditing = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func isEditing(_ newValue: Bool) -> Self {
        isEditing = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func allowsSelectionDuringEditing(_ newValue: Bool) -> Self {
        allowsSelectionDuringEditing = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ newValue: Bool) -> Self {
        allowsMultipleSelectionDuringEditing = newValue
        return self
    }

}
