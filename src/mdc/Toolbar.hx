package mdc;

import vdom.VDom.AnchorAttr;
import mdc.MDC.MDCTabBar;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Toolbar extends View<{>Attr}
{

	function render(attr)
	{
		//js.Browser.console.log("rend", ind);
		ontabchangeCB = attr.ontabchange;

		var type:String = attr.type != null ? attr.type : TabBarType.Text;
		return @hxx '<nav class=${attr.className.add(["mdc-tab-bar" => true, type => true])} {...attr}>
            ${attr.tabs}
            <span class="mdc-tab-bar__indicator" ></span>
        </nav>';
	}

	function set_activeTabIndex(index:UInt)
	{
		mdcTabBar.activeTabIndex = index;
		return index;
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