//
//  DesignableSegmentedControl.swift
//  Swible
//
//  Created by franz busch on 26/04/2017.
//

import UIKit

@IBDesignable
open class DesignableSegmentedControl: UISegmentedControl, Designable {

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        applyStyling()
    }

    public override init(items: [Any]?) {
        super.init(items: items)

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
