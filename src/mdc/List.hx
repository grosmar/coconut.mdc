package mdc;
/**
 * @prop dense = false
 * @prop two-line = false
 * @prop interactive = false
 */
import mdc.MDC.MDCRipple;
import mdc.MDC.RippleAttr;
import vdom.VDom.AnchorAttr;
import vdom.Attr;
import vdom.VDom.*;
import vdom.VDom.ImgAttr;
import coconut.ui.View;
import coconut.ui.Children;

//TODO: add list group support
//TODO: make list items individual Views to have standalone ripple effect
class List extends View
{
	var attributes:Attr;
	@:attribute var dense:Bool = false;
	@:attribute var twoLine:Bool = false;
	@:attribute var avatarList:Bool = false;
	@:attribute var nonInteractive:Bool = false;
	@:attribute var children:Children;

	function render()
	{
		var className = className.add([ "mdc-list" => true,
										"mdc-list--two-line" => twoLine,
										"mdc-list--avatar-list" => avatarList,
										"mdc-list--non-interactive" => nonInteractive,
										"mdc-list--dense" => dense ]);

		return @hxx '<ul className=${className} {...this}>{...children}</ul>';
	}

    /*static public function listItem(attr:{>Attr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<li class=${attr.className.add(["mdc-list-item" => true])}
						 data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>${...children}</li>';

	static public function listLinkItem(attr:{>AnchorAttr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<a href=${attr.href != null ? attr.href : "#"}
						class=${attr.className.add(["mdc-list-item" => true,
													"mdc-ripple-surface" => attr.ripple])}
						onclick=${attr.onclick}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{...children}</a>';

	static public function listStartDetail(attr:{>Attr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__graphic" => true,
													"mdc-ripple-surface" => attr.ripple])}
													data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{...children}</span>';

	static public function listStartIcon(attr:{>Attr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__graphic" => true,
													"material-icons" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{...children}</i>';

	static public function listEndIcon(attr:{>Attr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__meta" => true,
													"material-icons" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{...children}</i>';

	static public function listStartImage(attr:{>ImgAttr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<img class=${attr.className.add(["mdc-list-item__graphic" => true,
													  "mdc-ripple-surface" => attr.ripple])}
						  data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr} />';

	static public function listEndDetail(attr:{>Attr, >RippleAttr, }, ?children:Children):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__meta" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{...children}</span>';

	static public function listText(attr:Attr, ?children:Children):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__text" => true])} {...attr}>{...children}</span>';

	static public function listTextSecondary(attr:Attr, ?children:Children):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__secondary-text" => true])} {...attr}>{...children}</span>';

	static public function listDivider(attr:{>Attr, ?inset:Bool}, ?children:Children):VNode
		return @hxx '<li class=${attr.className.add(["mdc-list-divider" => true, "mdc-list-divider--inset" => attr.inset])} {...attr}>{...children}</li>';*/
}

class ListItem2 extends View
{
	var attributes:{>Attr, >RippleAttr, };
	var children:Children;
	var mdcRipple:MDCRipple;

	function render()
	'
		<li class=${className.add(["mdc-list-item" => true])}
			data-mdc-ripple-is-unbounded=${unboundedRipple} {...this}>{...children}</li>
	';

	override function afterInit(elem)
	{
		mdcRipple = new MDCRipple(elem);
	}

	override function afterDestroy(elem)
	{
		mdcRipple.destroy();
	}
}

class ListText2 extends View
{
	var attributes:Attr;
	var children:Children;

	function render()
	'
		<span class=${className.add(["mdc-list-item__text" => true])} {...this}>{...children}</span>
	';
}