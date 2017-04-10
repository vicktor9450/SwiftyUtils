//
//  Created by Vincent CARLIER on 21/09/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa

// MARK - Localizables

public extension NSView {

    public func convertLocalizables() {
        if subviews.isEmpty {
            return
        }

        for aSubview: NSView in subviews {
            if let aTextField = aSubview as? NSTextField {
                aTextField.stringValue = NSLocalizedString(aTextField.stringValue, comment: "")
                if let placeholder = aTextField.placeholderString {
                    aTextField.placeholderString = NSLocalizedString(placeholder, comment: "")
                }
            } else if let aTextView = aSubview as? NSTextView {
                if let text = aTextView.string {
                    aTextView.string = NSLocalizedString(text, comment: "")
                }
            } else if let aButton = aSubview as? NSButton {
                aButton.title = NSLocalizedString(aButton.title, comment: "")
            } else {
                aSubview.convertLocalizables()
            }
        }
    }

}

// MARK: - Frame

public extension NSView {
    public var x: CGFloat {
        get { return frame.x }
        set { frame = frame.with(x: newValue) }
    }

    public var y: CGFloat {
        get { return frame.y }
        set { frame = frame.with(y: newValue) }
    }

    public var width: CGFloat {
        get { return frame.width }
        set { frame = frame.with(width: newValue) }
    }

    public var height: CGFloat {
        get { return frame.height }
        set { frame = frame.with(height: newValue) }
    }
}