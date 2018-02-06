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
    @:attr var children:Children;
    @:attr var mode:TabBarMode = Text;
    @:attr var activeTabIndex:Int = 0;
    @:attr function ontabchange(index:UInt):Void {}

    var mdcTabBar:MDCTabBar;


    function render()
    {
        return @hxx '<nav class=${className.add(["mdc-tab-bar" => true, mode => true])} {...this}>
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

class Tab extends View
{
    static var tabIdIndex = 0;

    var attributes:AnchorAttr;
    @:attr var children:Children = null;
    @:attr var active:Bool = null;
    @:attr var icon:IconName = null;
    @:attr var text:String = null;

    function render()
    '
        <a  id=${id != null ? id : "tab_" + tabIdIndex++ }
            class=${className.add(["mdc-tab" => true,
                                   "mdc-tab--active" => active])} ${...this} >
            <if ${icon != null}>
                <TabIcon name=${icon} />
            </if>
            <if ${text != null}>
                <TabText>${text}</TabText>
            </if>
            ${...children}
        </a>
    ';
}

class TabIcon extends View
{
    var attributes:Attr;
    @:attr var name:IconName;

    function render()
    '
        <i class=${className.add(["mdc-tab__icon" => true, "material-icons" => true])} {...this} >${name}</i>
    ';
}

class TabText extends View
{
    var attributes:Attr;
    @:attr var children:Children;

    function render()
    '
        <span class=${className.add(["mdc-tab__icon-text" => true])} {...this} >${...children}</span>
    ';
}

@:enum abstract TabBarMode(String) to String
{
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}