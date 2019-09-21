# DrawGraph

I wanted to create a graphing app that was could grab your attention in a
fun way. I decided to make an app that lets you graph a rectangle by inputting
its coordinates and dimensions.

Upon startup, the screen is blank except for the text fields at the top. When
you fill in all of the text fields and click the DRAW button, a rectangle
appears with a cartoonish face. If you don't like typing, you can just as
easily draw the rectangle with your finger. Be careful, though. Every time you
redraw the rectangle the previous one disappears for good. No two rectangles
are alike.

In building this app, I learned how to better use Xcode to my liking. The app
has one UIView that is the rectangle, and every time you use your finger or
click the DRAW button, the UIView is resized appropriately. I also created
some arrays to store the names of the colors and png file names for the faces.
Once I got the rectangle to draw initially the way I wanted, it was fun to
create the faces and figure out how to get the dimensions of the face to be
the way I wanted. I also like to just draw faces repeatedly and see the
different expressions.

9/9/19
Created initial build, researched different chart libraries

9/11/19
Installed CocoaPods and tried to get Charts module from gitHub

9/13/19
Had to restart after realizing the Charts didn't do what I wanted

9/16/19
Began formatting text and text fields at the top

9/18/19
Finished layout by putting everything in Stacks

9/20/19
Did bulk of the coding.
Got rectangles to draw after filling out text fields
Got rectangles to draw through finger drag
Made rectangles randomly colored
Added random faces to rectangles
Debugged, added more constraints to top

9/21/19
Got app to run on my iPhone
Debugged, added Done button to number pad keyboard
