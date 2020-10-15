//
//  ViewStyleCompatible.swift
//  
//
//  Created by Ernest0N on 13.10.2020.
//


public protocol ViewStyleCompatible {}

extension ViewStyleCompatible {
    @discardableResult
    public func set(style: ViewStyle<Self>) -> Self {
        style.apply(into: self)
        return self
    }
}
