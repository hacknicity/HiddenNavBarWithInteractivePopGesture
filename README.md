## HiddenNavBarWithInteractivePopGesture

A sample app which demonstrates how to hide the navigation bar in a pushed view controller whilst still allowing the interactive swipe back gesture to work. This is a response to a tweet from Kyle Howells https://twitter.com/Freerunnering/status/1252811389556518918

The default interactive swipe gesture for going back is disabled if the navigation bar is hidden, or if the pushed view controller has any left bar button items. Setting `leftItemsSupplementBackButton` will keep the gesture, but then shows a back button and indents the left button. Trying to make that gesture work requires ugly workarounds that don't animate nicely.

This project shows two solutions. It's a bit hacky, but it mostly works and, in my opinion, looks better than the solution Kyle posted in his Twitter thread.

The main trick is to use a custom appearance for the navigation bar in the pushed view controllers. That is done in `TransparentNavBarViewController` by configuring a transparent appearance on the navigationItem. This uses an invisible back button image, clear text color for the back button's title and a transparent navigation bar background. The pushed view controllers don't have any buttons or title configured in their `navigationItem`.

There are two solutions.

1. `FirstViewController` has its own custom UINavigationBar which sits behind the navigation controller's transparent navigation bar. This allows bar buttons to be used which appear just as if they were in the

2. `SecondViewController` has two simple large buttons near the top of the view (positioned so their vertical centre aligns with the bottom of the invisible navigation bar). That layout is not great, but that's something that could be fixed with better constraints or manual layout.

In order to pass touches through to the custom navigation bar or custom buttons which are behind the navigation controller's invisible navigation bar, a custom UINavigationBar subclass, `PassthroughNavigationBar`, is used. This overrides `point(inside:with:)` to return `false` when the top view controller is a subclass of `TransparentNavBarViewController`. Also hacky, but this is required to ensure the buttons work and the invisible back button in the real navigation bar does not consume touches.
