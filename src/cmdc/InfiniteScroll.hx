package cmdc;

import js.html.MouseEvent;
import js.html.DOMElement;
import vdom.Attr;
import vdom.VNode;
import coconut.ui.View;
class InfiniteScroll extends View<{>Attr, content:VNode, ?tolerance:Float, onscrolltop:Void->Void, onscrollbottom:Void->Void}>
{
    var tolerance:Float;
    var onscrolltop:Void->Void;
    var onscrollbottom:Void->Void;


    function render(data)
    {
        this.tolerance = data.tolerance != null ? data.tolerance : 0.1;
        this.onscrolltop = data.onscrolltop;
        this.onscrollbottom = data.onscrollbottom;

        return @hxx '
        <div {...data} style="overflow-y:auto">
            ${data.content}
        </div>
        ';
    };

    override function afterInit(elem:DOMElement)
    {
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