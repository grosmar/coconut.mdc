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
                            @:optional var selectedTabIndex:Int;
                            @:optional function ontabchange(index:UInt):Void;}>
{

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

    var mdcTabBar:MDCTabBar;

    var ontabchangeCB:Int->Void;
    var selectedTabIndex:Int;

    function render(attr)
    {
        //js.Browser.console.log("rend", ind);
        ontabchangeCB = attr.ontabchange;
        selectedTabIndex = attr.selectedTabIndex;

        var type:String = attr.type != null ? attr.type : TabBarType.Text;
        return @hxx '<nav class=${attr.className.add(["mdc-tab-bar" => true, type => true])} {...attr}>
            ${attr.tabs}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    override function afterInit(elem)
    {
        this.mdcTabBar = new MDCTabBar(elem);
        mdcTabBar.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {

            if (ontabchangeCB != null )
                ontabchangeCB(mdcTabBar.activeTabIndex);
        });
    }

    override function destroy()
    {
        if ( this.mdcTabBar != null )
            this.mdcTabBar.destroy();
    }
}

@:enum abstract TabBarType(String) to String {
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}