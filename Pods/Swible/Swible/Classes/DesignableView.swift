//
//  DesignableView.swift
//  Swible
//
//  Created by franz busch on 03/09/16.
//

import UIKit

@IBDesignable
open class DesignableView: UIView, Designable {

    override public init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        applyStyling()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func awakeFromNib() {
        super.awakeFromNib()

        setup()
        applyStyling()
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        applyStyling()
    }

    open func setup() {}
    open func applyStyling() {}

}
