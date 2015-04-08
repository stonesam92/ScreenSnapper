# ScreenSnapper
An OS X menu-bar application for taking screenshots.

Every time I needed to take a screenshot I ended up having to google the obscure keyboard shortcut or use Grab.

This is a small application that lives in your menu bar and provides shortcuts to taking screenshots and save them to either the clipboard or a file.

![ScreenSnapper in Action](http://i.imgur.com/MgLiYy8.gif)

Allows you to save the entire screen, a selection, or the contents of a single window.

When "Save to File" is enabled, screenshots to be saved to wherever your system screenshot location is (by default this is `~/Desktop/`)

Works by simply simulating the correct system keyboard shortcut using `CGEventCreateKeyboardEvent`.

##Installation:
* Download a zip containing the latest release [here](/stonesam92/ScreenSnapper/releases/download/v1.0.0/ScreenSnapper.zip)
* Extract the zip and copy the app to your Applications folder
* If gatekeeper is enabled, you must right-click the app and select "Open" the first time you run the app
