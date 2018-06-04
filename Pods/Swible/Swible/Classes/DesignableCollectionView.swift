//
//  DesignableCollectionView.swift
//  Swible
//
//  Created by Bhabani Sankar Prusty on 2/23/18.
//

import UIKit

@IBDesignable
open class DesignableCollectionView: UICollectionView, Designable {

    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

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
