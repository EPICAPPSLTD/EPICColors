# EPICColors

EPICColors is a category extension on UIColor written in swift that adds the following functionality to the base framework:

255-RGB color initializer
------
You can now create UIColor objects using 255-RGB notations

#### Usage:
```swift
let color = UIColor(red255: 120, green255: 51, blue255: 86, alpha: 0.5)
```

HEX string color initializer
------
You can now create UIColor objects using Hex notations with 2, 4, 6 and 8 character values, where:

- 2 value hexstrings equate to grey-scale colors, i.e: "FF"
- 4 value hexstrings equate to grey-scale colors with alpha, i.e: "FFAA"
- 6 value hexstrings equate to 255-rgb colors, i.e: "FFAA33"
- 8 value hexstrings equate to 255-rgb colors with alpha, i.e: "FFAA33CC"

Note that the parser is case insensitive. Colors can optionally be appended with "#", "0x" and "0X" symbols, but are not required for the parsing to work.

#### Usage:
```swift
let color1 = UIColor(hexString: "FA") // returns a color equivalent to "#fafafa"
let color2 = UIColor(hexString: "#6F2A") // returns a color equivalent to "#6f6f6f with alpha"
let color3 = UIColor(hexString: "0x22ac4d") // returns a color equivalent to "#22ac4d"
let color4 = UIColor(hexString: "0X89cc24ab") // returns a color equivalent to "#89cc24" with alpha

//alternative notations return the same UIColor objects
let color1_alternative = UIColor(hexString: "0XFA") // returns a color equivalent to "#fafafa"
let color2_alternative = UIColor(hexString: "0x6F2A") // returns a color equivalent to "#6f6f6f with alpha"
let color3_alternative = UIColor(hexString: "#22ac4d") // returns a color equivalent to "#22ac4d"
let color4_alternative = UIColor(hexString: "89cc24ab") // returns a color equivalent to "#89cc24" with alpha
```

This class serves as an extension to the tutorial of the blog article: ["A splash of UIColors"](TODO).
Usage is free for all based on the attached license details, if you find this code useful, please consider [making a donation](http://epic-apps.uk/donations/). :)

Copyright (c) EPIC 
[www.epic-apps.uk](www.epic-apps.uk)



