//
//  DesignableTableViewHeaderFooterView.swift
//  Swible
//
//  Created by franz busch on 03/09/16.
//

import UIKit

@IBDesignable
open class DesignableTableViewHeaderFooterView: UITableViewHeaderFooterView, Designable {

    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

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
