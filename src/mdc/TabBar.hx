package mdc;

import tink.CoreApi.CallbackLink;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import coconut.ui.View;
class TabBar extends View<{attr:{>Attr, function ontabchange(index:UInt):Void;}, children:VNode}>
{
    var ind:Int = Math.random();

    static public function tabBar(attr:{>Attr, function ontabchange(index:UInt):Void;}, children:VNode)
        return new TabBar({attr:attr, children:children});

    var handler:MDCTabBar;

    var ontabchange:UInt->Void;

    function render()
    {
        js.Browser.console.log("rend", ind);
        ontabchange = attr.ontabchange;

        return @hxx '<nav class=${attr.className.add(["mdc-tab-bar" => true])} key={1} {...attr}>
            ${children}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    function set_activeTabIndex(index:UInt)
    {
        handler.activeTabIndex = index;
        return index;
    }

    override function afterInit(elem)
    {
        js.Browser.console.log("init", this.handler, ind);
        this.handler = new MDCTabBar(elem);
        handler.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {
            ontabchange(handler.activeTabIndex);
        });
    }

    override function destroy()
    {
        return;
        js.Browser.console.log("dest", this.handler != null, ind);
        if ( this.handler != null )
            this.handler.destroy();
    }
}

