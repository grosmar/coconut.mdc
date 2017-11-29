package mdc;

import haxe.ds.ObjectMap;
import tink.CoreApi.CallbackLink;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import coconut.ui.View;
class TabBar extends View<{>Attr, tabs:VNode, ontabchange:UInt->Void}>
{
    var ind:Int = Math.random();
    /*static var viewCache = new Map<Int, TabBar>();

    static public function tabBar(attr:{>Attr, function ontabchange(index:UInt):Void;}, children:VNode)
    {
        js.Browser.console.log("NEWWWWW", attr.key);
        var t = viewCache.exists(cast attr.key) ? viewCache.get(cast attr.key) : new TabBar({attr:attr, children:children});
        viewCache.set(cast attr.key, t);
        return t;
    }*/

    var handler:MDCTabBar;

    var ontabchangeCB:UInt->Void;

    function render(data)
    {
        js.Browser.console.log("rend", ind);
        ontabchangeCB = data.ontabchange;

        return @hxx '<nav class=${data.className.add(["mdc-tab-bar" => true])} {...data}>
            ${data.tabs}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    function set_activeTabIndex(index:UInt)
    {
        handler.activeTabIndex = index;
        return index;
    }

    override function beforeInit()
    {
        js.Browser.console.log("before", ind);
    }

    override function afterInit(elem)
    {
        js.Browser.console.log("init", ind);
        this.handler = new MDCTabBar(elem);
        handler.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {
            ontabchangeCB(handler.activeTabIndex);
        });
    }

    override function destroy()
    {
        js.Browser.console.log("dest", this.handler != null, ind);
        return;

        if ( this.handler != null )
            this.handler.destroy();
    }
}

