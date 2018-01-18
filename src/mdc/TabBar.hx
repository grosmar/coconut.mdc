package mdc;

import vdom.VDom.AnchorAttr;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.Ui.hxx;
import coconut.ui.View;
//import coconut.Ui.hxx;

class TabBar extends View
{
    var attributes:Attr;
    var tabs:VNode;
    @:attribute var mode:TabBarMode = null;
    @:attribute var selectedTabIndex:Int = null;
    @:attribute var ontabchange:UInt->Void = null;

    var mdcTabBar:MDCTabBar;

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



    function render()
    {

        var type:String = style != null ? style : TabBarType.Text;
        return @hxx '<nav class=${className.add(["mdc-tab-bar" => true, style => true])} {...data}>
            ${tabs}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    override function afterInit(elem)
    {
        trace("afterInit");
        this.mdcTabBar = new MDCTabBar(elem);
        mdcTabBar.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {

            if (ontabchange != null )
                ontabchange(mdcTabBar.activeTabIndex);
        });
    }

    override function destroy()
    {
        if ( this.mdcTabBar != null )
            this.mdcTabBar.destroy();
    }
}

@:enum abstract TabBarMode(String) to String {
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}