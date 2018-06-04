//
//  DesignableImageView.swift
//  Swible
//
//  Created by franz busch on 06/03/2017.
//
//

import UIKit

@IBDesignable
open class DesignableImageView: UIImageView, Designable {

    public override init(image: UIImage?) {
        super.init(image: image)

        setup()
        applyStyling()
    }

    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)

        setup()
        applyStyling()
    }

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
