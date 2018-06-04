//
//  DesignableLabel.swift
//  Swible
//
//  Created by franz busch on 06.02.17.
//

import UIKit

@IBDesignable
open class DesignableLabel: UILabel, Designable {

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        applyStyling()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()

        setup()
        applyStyling()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        applyStyling()
    }

    open func setup() {}
    open func applyStyling() {}

}