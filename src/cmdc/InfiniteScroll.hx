package cmdc;

import js.html.MouseEvent;
import js.html.DOMElement;
import coconut.ui.View;
class InfiniteScroll extends View
{
    @:attr var children:coconut.ui.Children;
    @:attr var className:tink.domspec.ClassName = "";
    @:attr var tolerance:Float = 0.1;
    @:attr var tabIndex:Int = null;
    @:attr var onscrolltop:Void->Void;
    @:attr var onscrollbottom:Void->Void;
    @:state public var scrollTop:Int = 0;
    //TODO: remove root access, expose necessary properties
    @:ref public var root:js.html.Element;

    function render()
    {
        return @hxx '
        <div ref=${root} {...this} style=${{overflowY:"auto"}}>
            <for ${child in children}>
                ${child}
            </for>
        </div>
        ';
    };

    override function viewDidMount()
    {
        var elem = root.current;
        var ratio = elem.scrollTop / (elem.scrollHeight - elem.clientHeight);
        scrollTop = elem.scrollTop;

        var topPassed:Bool = ratio <= tolerance;
        var bottomPassed:Bool = ratio >= 1 - tolerance;
        var lastScrollTop = elem.scrollTop;


        elem.addEventListener("scroll", function(event:MouseEvent)
        {
            var isDown = elem.scrollTop > lastScrollTop;
            lastScrollTop = elem.scrollTop;
            scrollTop = elem.scrollTop;

            var ratio = elem.scrollTop / (elem.scrollHeight - elem.clientHeight);

            if ( !isDown && ratio <= tolerance && !topPassed )
            {
                onscrolltop();
                topPassed = true;

            }
            else if ( ratio > tolerance )
            {
                topPassed = false;
            }

            if ( isDown && ratio >= 1 - tolerance && !bottomPassed )
            {
                onscrollbottom();
                bottomPassed = true;
            }
            else if ( ratio < 1 - tolerance )
            {
                bottomPassed = false;
            }
        });
    }
}