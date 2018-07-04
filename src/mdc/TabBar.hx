package mdc;

import js.html.MouseEvent;
import js.html.DOMElement;
import mdc.MDC.MDCTabBar;
import coconut.ui.View;
import coconut.ui.Children;
import coconut.vdom.ClassName;
//import coconut.Ui.hxx;

class TabBar extends View
{
    @:attr var className:ClassName = "";
    @:attr var children:Children;
    @:attr var mode:TabBarMode = Text;
    @:attr var activeTabIndex:Int = 0;
    @:attr function ontabchange(index:UInt):Void {}

    var mdcTabBar:MDCTabBar;


    function render()
    {
        var activeTabIndex = this.activeTabIndex;
        var children = this.children;
        return @hxx '<nav class=${className.add(["mdc-tab-bar" => true, mode => true])} {...this}>
            ${...children}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
    }

    override function afterInit(elem:DOMElement)
    {
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
            prevTabIndex = activeTabIndex;
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
        mdcTabBar.activeTabIndex = prevTabIndex;

        js.Browser.window.requestAnimationFrame(function(_) { mdcTabBar.activeTabIndex = prevTabIndex = activeTabIndex;});

    }

    function tabChangeHandler(data:{detail:{activeTabIndex:Int}})
    {
        ontabchange(data.detail.activeTabIndex);
    }

    override function beforeDestroy(elem)
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

    @:attr var className:ClassName = "";
    @:attr var onclick:MouseEvent->Void = null;
    @:attr var children:Children = null;
    @:attr var active:Bool = null;
    @:attr var icon:IconName = null;
    @:attr var text:String = null;

    function render()
    '
        <a class=${className.add(["mdc-tab" => true,
                                  "mdc-tab--active" => active])} ${...this} >
            <if ${icon != null}>
                <TabIcon name=${icon} />
            </if>
            <if ${text != null}>
                <TabText>${this.text}</TabText>
            </if>
            ${...children}
        </a>
    ';
}

class TabIcon extends View
{
    @:attr var className:ClassName = "";
    @:attr var name:IconName;

    function render()
    '
        <i class=${className.add(["mdc-tab__icon" => true, "material-icons" => true])} {...this} >${name}</i>
    ';
}

class TabText extends View
{
    @:attr var className:ClassName = "";
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