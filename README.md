# ScreenSnapper
An OS X menu-bar application for taking screenshots.

Every time I needed to take a screenshot I ended up having to google the obscure keyboard shortcut or use Grab.

This is a small application that lives in your menu bar and provides shortcuts to taking screenshots and save them to either the clipboard or a file.


Allows you to save the entire screen, a selection, or the contents of a single window.

Works by simply simulating the correct system keyboard shortcut using `CGEventCreateKeyboardEvent`.
