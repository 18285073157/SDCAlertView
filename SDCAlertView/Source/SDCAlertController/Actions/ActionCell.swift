//
//  ActionCell.swift
//  SDCAlertController
//
//  Created by Scott Berrevoets on 7/13/15.
//  Copyright © 2015 Scott Berrevoets. All rights reserved.
//

import UIKit

final class ActionCell: UICollectionViewCell {

    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private var highlightedBackgroundView: UIView!

    var enabled = true {
        didSet { self.titleLabel.enabled = self.enabled }
    }

    override var highlighted: Bool {
        didSet { self.highlightedBackgroundView.hidden = !self.highlighted }
    }

    func setAction(action: AlertAction, withVisualStyle visualStyle: VisualStyle) {
        action.actionView = self

        self.titleLabel.font = visualStyle.font(forAction: action)
        self.titleLabel.textColor = visualStyle.textColor(forAction: action)
        self.titleLabel.attributedText = action.attributedTitle
    }
}

final class ActionSeparatorView: UICollectionReusableView {

    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)

        if let attributes = layoutAttributes as? ActionsCollectionViewLayoutAttributes {
            self.backgroundColor = attributes.backgroundColor
        }
    }
}
