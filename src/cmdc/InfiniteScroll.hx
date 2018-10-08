package cmdc;

import js.html.MouseEvent;
import js.html.DOMElement;
import coconut.ui.View;
class InfiniteScroll extends View
{
    @:attr var children:coconut.ui.Children;
    @:attr var className:coconut.vdom.ClassName = "";
    @:attr var tolerance:Float = 0.1;
    @:attr var tabIndex:Int = null;
    @:attr var onscrolltop:Void->Void;
    @:attr var onscrollbottom:Void->Void;

    function render()
    {
        return @hxx '
        <div {...this} style="overflow-y:auto">
            <for ${child in children}>
                ${child}
            </for>
        </div>
        ';
    };

    override function afterMounting(element)
    {
        var elem:DOMElement = cast element;
        var ratio = elem.scrollTop / (elem.scrollHeight - elem.clientHeight);

        var topPassed:Bool = ratio <= tolerance;
        var bottomPassed:Bool = ratio >= 1 - tolerance;
        var lastScrollTop = elem.scrollTop;


        elem.addEventListener("scroll", function(event:MouseEvent)
        {
            var isDown = elem.scrollTop > lastScrollTop;
            lastScrollTop = elem.scrollTop;

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