// Generated using Sourcery 2.2.5 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import UIKit


public extension UIPageControl {
    @discardableResult
    func numberOfPages(_ newValue: Int) -> Self {
        numberOfPages = newValue
        return self
    }

    @discardableResult
    func currentPage(_ newValue: Int) -> Self {
        currentPage = newValue
        return self
    }

    @discardableResult
    func hidesForSinglePage(_ newValue: Bool) -> Self {
        hidesForSinglePage = newValue
        return self
    }

    [@available(iOS 17.0, *)]
    @discardableResult
    func progress(_ newValue: UIPageControlProgress?) -> Self {
        progress = newValue
        return self
    }

    [@available(iOS 6.0, *)]
    @discardableResult
    func pageIndicatorTintColor(_ newValue: UIColor?) -> Self {
        pageIndicatorTintColor = newValue
        return self
    }

    [@available(iOS 6.0, *)]
    @discardableResult
    func currentPageIndicatorTintColor(_ newValue: UIColor?) -> Self {
        currentPageIndicatorTintColor = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func backgroundStyle(_ newValue: UIPageControl.BackgroundStyle) -> Self {
        backgroundStyle = newValue
        return self
    }

    [@available(iOS 16.0, *)]
    @discardableResult
    func direction(_ newValue: UIPageControl.Direction) -> Self {
        direction = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func allowsContinuousInteraction(_ newValue: Bool) -> Self {
        allowsContinuousInteraction = newValue
        return self
    }

    [@available(iOS 14.0, *)]
    @discardableResult
    func preferredIndicatorImage(_ newValue: UIImage?) -> Self {
        preferredIndicatorImage = newValue
        return self
    }

    [@available(iOS 16.0, *)]
    @discardableResult
    func preferredCurrentPageIndicatorImage(_ newValue: UIImage?) -> Self {
        preferredCurrentPageIndicatorImage = newValue
        return self
    }

}
