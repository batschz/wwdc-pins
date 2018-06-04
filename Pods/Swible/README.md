# Swible

[![Build Status](https://travis-ci.org/e-Sixt/Swible.svg?branch=master)](https://travis-ci.org/e-Sixt/Swible)
[![codecov](https://codecov.io/gh/e-Sixt/Swible/branch/master/graph/badge.svg)](https://codecov.io/gh/e-Sixt/Swible)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/Swible/badge.png)](https://cocoadocs.org/docsets/NSStringMask)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/e-Sixt/Swible/master/LICENSE)

## Getting Started

Swible is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Swible"
```

## Usage

Swible core protocol is Designable which requires to methods to be implemented.
```swift
public protocol Designable: class {
    func setup()
    func applyStyling()
}
```
**Setup**: Is the first point where you can design your view. Main focus here should be to do the setup of code which only happen once. Often times you add subviews and constrain them inside this method.

**Apply Styling**: Should be used to customize the appearance of your views, for example you would set the backgroundColor, font or aligment here. It is called after setup and can be called multiple times.

### UIKit subclasses
Swible provides a couple of base classes for UIKit views. To create your own designable view, choose a subclass which fits your element and subclass from it. Here is an example for a custom UIView

1. Create a new DesingableView (or any other Designable___) subclass  like
``` swift
class CustomView: DesignableView {

    override func setup() {
        // Do any setup in here, e.g. creating constraints in code
    }

    override func applyStyling() {
        // Do any styling in here, e.g. background color
    }

}
```
2. Design your view and add `@IBInspectable` properties.
3. Sometimes Xcode/Interface Builder does not recognize `Designable` subclasses as `@IBDesignable`. **!Workaround!** Declare your custom class as `@IBDesignable` like:
``` swift
@IBDesignable
class CustomView: DesignableView {
}
```


## Author
* e-Sixt, sixtlabs@sixt.com

## Contributors:
* Franz Busch,      franz-joseph.busch@sixt.com

## License
Swible is available under the MIT license. See the LICENSE file for more info.

![alt text](https://github.com/e-Sixt/Swen/raw/master/logo.png "Sixt Labs Logo")

