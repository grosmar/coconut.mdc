package mdc;

import vdom.VDom.AnchorAttr;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.Ui.hxx;
import coconut.ui.View;
import coconut.ui.Children;
//import coconut.Ui.hxx;

class TabBar extends View
{
    var attributes:Attr;
    @:attribute var children:Children;
    @:attribute var type:TabBarMode = Text;
    @:attribute function ontabchange(index:UInt):Void {}

    var mdcTabBar:MDCTabBar;

    static public function tab(attr:{>AnchorAttr, ?active:Bool, ?icon:String, ?text:String}, ?children:Children):VNode
    {
        return @hxx '<a class=${attr.className.add(["mdc-tab" => true,
                                                    "mdc-tab--active" => attr.active])} {...attr} >
            <if ${attr.icon != null}>
                <tabIcon>${attr.icon}</tabIcon>
            </if>
            <if ${attr.text != null}>
                <tabText>${attr.text}</tabText>
            </if>
            ${...children}
        </a>';
    }

    static public function tabIcon(attr:Attr, children:VNode):VNode
        return @hxx '<i class=${attr.className.add(["mdc-tab__icon" => true, "material-icons" => true])} {...attr} >${children}</i>';

    static public function tabText(attr:Attr, children:VNode):VNode
        return @hxx '<span class=${attr.className.add(["mdc-tab__icon-text" => true])} {...attr} >${children}</span>';



    function render()
    {
        trace("TABBARRENDER");
        return @hxx '<nav class=${className.add(["mdc-tab-bar" => true, type => true])} {...this}>
            ${...children}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    override function afterInit(elem)
    {
        this.mdcTabBar = new MDCTabBar(elem);
        mdcTabBar.listen('MDCTabBar:change', function (data:{detail:MDCTabBar})
        {
            ontabchange(mdcTabBar.activeTabIndex);
        });
    }

    var lastChildren:Children;
    var lastElem:js.html.Element;

    override function afterPatching(elem)
    {
       /* if ( lastChildren == children )
            return;

        lastChildren = children;

        trace("SSS", lastElem == elem);

        if ( this.mdcTabBar != null )
        {
            this.mdcTabBar.destroy();
        }

        //TODO: TEMPORARY HACK fix somehow rerender
        haxe.Timer.delay(function()
                    {
                        this.mdcTabBar = new MDCTabBar(elem);
                        mdcTabBar.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {
                            trace("Change", data);
                            ontabchange(mdcTabBar.activeTabIndex);
                        });
                    }, 200);*/

    }

    override function destroy()
    {
        if ( this.mdcTabBar != null )
            this.mdcTabBar.destroy();
    }
}

@:enum abstract TabBarMode(String) to String
{
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}