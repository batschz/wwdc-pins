//
//  DesignableStackView.swift
//  
//
//  Created by Prajwal Udupa on 8/3/17.
//
//

import UIKit

@IBDesignable
open class DesignableStackView: UIStackView, Designable {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        applyStyling()
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        applyStyling()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        applyStyling()
    }

    open func setup() {}
    open func applyStyling() {}
}
