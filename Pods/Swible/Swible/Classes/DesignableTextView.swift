//
//  DesignableTextView.swift
//  Swible
//
//  Created by franz busch on 07/04/2017.
//

import UIKit

@IBDesignable
open class DesignableTextView: UITextView, Designable {

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

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
