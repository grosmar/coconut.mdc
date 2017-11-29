package mdc;

import vdom.VDom.AnchorAttr;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class TabBar extends View<{>Attr,
                            var tabs:VNode;
                            @:optional var type:TabBarType;
                            @:optional function ontabchange(index:UInt):Void;}>
{
    /*
    var ind:Int = Math.random();

    static public function tabBar(attr:{>Attr, function ontabchange(index:UInt):Void;}, children:VNode)
        return new TabBar({attr:attr, children:children});*/

    static public inline function tab(attr:{>AnchorAttr, ?active:Bool, ?icon:String, ?text:String}, ?children:VNode):VNode
        return @hxx '<a class=${attr.className.add(["mdc-tab" => true,
                                                    "mdc-tab--active" => attr.active])} {...attr} >
            <if ${attr.icon != null}>
                <tabIcon>${attr.icon}</tabIcon>
            </if>
            <if ${attr.text != null}>
                <tabText>${attr.text}</tabText>
            </if>
            ${children}
        </a>';

    static public inline function tabIcon(attr:Attr, children:VNode):VNode
        return @hxx '<i class=${attr.className.add(["mdc-tab__icon" => true, "material-icons" => true])} {...attr} >${children}</i>';

    static public inline function tabText(attr:Attr, children:VNode):VNode
        return @hxx '<span class=${attr.className.add(["mdc-tab__icon-text" => true])} {...attr} >${children}</span>';

    var handler:MDCTabBar;

    var ontabchangeCB:UInt->Void;

    function render(data)
    {
        //js.Browser.console.log("rend", ind);
        ontabchangeCB = data.ontabchange;

        var type:String = data.type != null ? data.type : TabBarType.Text;
        return @hxx '<nav class=${data.className.add(["mdc-tab-bar" => true, type => true])} {...data}>
            ${data.tabs}
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
        //js.Browser.console.log("init", ind);
        this.handler = new MDCTabBar(elem);
        handler.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {
            if (ontabchangeCB != null )
                ontabchangeCB(handler.activeTabIndex);
        });
    }

    override function destroy()
    {
        /*js.Browser.console.log("dest", this.handler != null, ind);

        if ( this.handler != null )
            this.handler.destroy();*/
    }
}

@:enum abstract TabBarType(String) from String to String {
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}