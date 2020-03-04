//
//  TextView.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import Foundation
import SwiftUI

struct TextView: UIViewRepresentable {
    let placeholder: String
    
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = PlaceholderTextView()
        textView.placeholder = placeholder
        textView.placeholderFont = .preferredFont(forTextStyle: .body)
        textView.font = .preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = false
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        uiView.text = text
    }
}

@IBDesignable
open class PlaceholderTextView: UITextView {
    public let placeholderLabel: UILabel = UILabel()

    private var placeholderLabelConstraints = [NSLayoutConstraint]()

    @IBInspectable open var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }

    @IBInspectable open var placeholderColor: UIColor = UIColor.placeholderText {
        didSet { placeholderLabel.textColor = placeholderColor }
    }

    override open var font: UIFont! {
        didSet {
            if placeholderFont == nil {
                placeholderLabel.font = font
            }
        }
    }

    open var placeholderFont: UIFont? {
        didSet {
            let font = (placeholderFont != nil) ? placeholderFont : self.font
            placeholderLabel.font = font
        }
    }

    override open var textAlignment: NSTextAlignment {
        didSet { placeholderLabel.textAlignment = textAlignment }
    }

    override open var text: String! {
        didSet { textDidChange() }
    }

    override open var attributedText: NSAttributedString! {
        didSet { textDidChange() }
    }

    override open var textContainerInset: UIEdgeInsets {
        didSet { updateConstraintsForPlaceholderLabel() }
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: nil)

        placeholderLabel.font = font
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.text = placeholder
        placeholderLabel.numberOfLines = 0
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        textContainerInset = .zero
        updateConstraintsForPlaceholderLabel()
    }

    private func updateConstraintsForPlaceholderLabel() {
        removeConstraints(placeholderLabel.constraints)
        placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: textContainerInset.left + textContainer.lineFragmentPadding).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: textContainerInset.right + textContainer.lineFragmentPadding).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: textContainerInset.top).isActive = true
        placeholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: textContainerInset.bottom).isActive = true
    }

    @objc private func textDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
