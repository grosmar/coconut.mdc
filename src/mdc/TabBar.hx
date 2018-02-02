package mdc;

import js.html.DOMElement;
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
    @:attribute var activeTabIndex:Int = 0;
    @:attribute function ontabchange(index:UInt):Void {}

    var mdcTabBar:MDCTabBar;
    static var tabIdIndex = 0;

    static public function tab(attr:{>AnchorAttr, ?active:Bool, ?icon:String, ?text:String}, ?children:Children):VNode
    {
        return @hxx '<a id=${attr.id != null ? attr.id : "tab_" + tabIdIndex++ } class=${attr.className.add(["mdc-tab" => true,
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
        return @hxx '<nav class=${className.add(["mdc-tab-bar" => true, type => true])} {...this}>
            ${...children}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    override function afterInit(elem:DOMElement)
    {
        js.Browser.console.log(elem.children);
        this.mdcTabBar = new MDCTabBar(elem);
        mdcTabBar.listen('MDCTabBar:change', tabChangeHandler);
        mdcTabBar.activeTabIndex = activeTabIndex;
        mdcTabBar.tabs[activeTabIndex].isActive = true;
        prevLength = elem.children.length;
    }

    var prevLength:Int;
    var prevTabIndex:Int = 0;

    override function afterPatching(elem:DOMElement)
    {
        if ( prevLength == elem.children.length )
        {
            mdcTabBar.activeTabIndex = activeTabIndex;
            return;
        }

        prevLength = elem.children.length;

        if ( this.mdcTabBar != null )
        {
            prevTabIndex = children.length -1 < prevTabIndex ? activeTabIndex : prevTabIndex;
            mdcTabBar.unlisten('MDCTabBar:change', tabChangeHandler);
            for ( tab in this.mdcTabBar.tabs )
                tab.destroy();
            this.mdcTabBar.destroy();
        }

        mdcTabBar = new MDCTabBar(elem);
        mdcTabBar.listen('MDCTabBar:change', tabChangeHandler);
        mdcTabBar.tabs[prevTabIndex].isActive = true;

        js.Browser.window.requestAnimationFrame(function(_) mdcTabBar.activeTabIndex = activeTabIndex);

    }

    function tabChangeHandler(data:{detail:MDCTabBar})
    {
        ontabchange(mdcTabBar.activeTabIndex);
    }

    override function destroy()
    {
        if ( this.mdcTabBar != null )
        {
            mdcTabBar.unlisten('MDCTabBar:change', tabChangeHandler);
            for ( tab in this.mdcTabBar.tabs )
                tab.destroy();
            mdcTabBar.destroy();
        }
    }
}

@:enum abstract TabBarMode(String) to String
{
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}