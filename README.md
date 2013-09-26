UIActionSheet-Blocks
================

UIActionSheet+Blocks is a simple Block implementation for UIActionSheet created by Shai Mishali.
This allows you to use the power of blocks instead of implementing a delegate.

USAGE
------

Instead of allocating a new UIActionSheet and assigning a delegate, just call one of the static methods:

```objc
UIActionSheet *sheet = [UIActionSheet presentOnView:self.view
                                          withTitle:@"Select Picture"
                                       otherButtons:@[@"Camera Roll", @"Take a Picture"]
                                           onCancel:^(UIActionSheet *actionSheet) {
                                                NSLog(@"Touched cancel button");
                                           }
                                    onClickedButton:^(UIActionSheet *actionSheet, NSUInteger index) {
                                                NSLog(@"Selected button at index %d", index);
                                            }];
```

![Simple UIActionSHeet](http://i40.tinypic.com/29ge8m9.png)

**OR**

```objc

UIActionSheet *sheet = [UIActionSheet presentOnView:self.view
                                          withTitle:@"John - 555-1212"
                                       cancelButton:@"Dismiss"
                                  destructiveButton:@"Delete Contact"
                                       otherButtons:@[@"Call Contact",@"Message Contact"]
                                           onCancel:^(UIActionSheet *actionSheet) {
                                                NSLog(@"Touched cancel button");
                                            }
                                      onDestructive:^(UIActionSheet *actionSheet) {
                                                NSLog(@"Touched destructive button");
                                            }
                                    onClickedButton:^(UIActionSheet *actionSheet, NSUInteger index) {
                                                NSLog(@"Selected button at index %d", index);
                                            }];
```

![Full UIActionSheet](http://i39.tinypic.com/73j6dw.png)


The class will return the UIActionSheet object which you can manally dismiss if needed.

LICENSE
-------------------

Copyright (C) 2013 Developed by Shai Mishali

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.