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
    @:attr var activeTabIndex:Int = 0;
    @:attr function ontabchange(index:UInt):Void {}

    var mdcTabBar:MDCTabBar;

    @:ref var root:js.html.Element;


    function render()
    {
        //var activeTabIndex = this.activeTabIndex;
        var children = this.children;
        return @hxx '<div ref=${root} class=${className.add(["mdc-tab-bar" => true])} {...this}>
            <div class="mdc-tab-scroller">
                <div class="mdc-tab-scroller__scroll-area">
                    <div class="mdc-tab-scroller__scroll-content">
                        ${...children}
                    </div>
                </div>
            </div>
        </div>';
    }

    override function viewDidMount()
    {
        mdcTabBar = new MDCTabBar(root);
        //mdcTabBar.activateTab(activeTabIndex);
        mdcTabBar.listen('MDCTabBar:activated', tabChangeHandler);
        prevLength = root.current.childNodes.length;
    }

    var prevLength:Int;
    var prevTabIndex:Int = 0;

    override function viewDidUpdate()
    {
        mdcTabBar.activateTab(activeTabIndex);

        if ( prevLength == children.length )
        {
            prevTabIndex = activeTabIndex;
            return;
        }

        prevLength = root.current.children.length;

        if ( this.mdcTabBar != null )
        {
            prevTabIndex = children.length -1 < prevTabIndex ? activeTabIndex : prevTabIndex;
            mdcTabBar.unlisten('MDCTabBar:activated', tabChangeHandler);
            //TODO: add it back, because now it's leaking
            /*for ( tab in this.mdcTabBar.getTabElements_() )
                tab.destroy();*/
            this.mdcTabBar.destroy();
        }

        mdcTabBar = new MDCTabBar(root);
        mdcTabBar.listen('MDCTabBar:activated', tabChangeHandler);
        

        js.Browser.window.requestAnimationFrame(function(_) { prevTabIndex = activeTabIndex; mdcTabBar.activateTab(activeTabIndex); });

    }

    function tabChangeHandler(data:{detail:{index:Int}})
    {
        ontabchange(data.detail.index);
    }

    override function viewWillUnmount()
    {
        if ( this.mdcTabBar != null )
        {
            mdcTabBar.unlisten('MDCTabBar:activated', tabChangeHandler);
            for ( tab in this.mdcTabBar.getTabElements_() )
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
        <button class=${className.add(["mdc-tab" => true,
                                       "mdc-tab--active" => active])} ${...this} >
            <span class="mdc-tab__content">
                <if ${icon != null}>
                    <TabIcon name=${icon} />
                </if>
                <if ${text != null}>
                    <TabText>${this.text}</TabText>
                </if>
                ${...children}
            </span>
            <span class=${className.add(["mdc-tab-indicator" => true,
                                         "mdc-tab-indicator--active" => active])} >
                <span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span>
            </span>
            <span class="mdc-tab__ripple"></span>
        </button>
    ';
}

class TabIcon extends View
{
    @:attr var className:ClassName = "";
    @:attr var name:IconName;

    function render()
    '
        <span class=${className.add(["mdc-tab__icon" => true, "material-icons" => true])} {...this} >${name}</span>
    ';
}

class TabText extends View
{
    @:attr var className:ClassName = "";
    @:attr var children:Children;

    function render()
    '
        <span class=${className.add(["mdc-tab__text-label" => true])} {...this} >${...children}</span>
    ';
}