package mdc;
/**
 * @prop dense = false
 * @prop two-line = false
 * @prop interactive = false
 */
import mdc.MDC.RippleAttr;
import vdom.VDom.AnchorAttr;
import vdom.Attr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.Ui.hxx;
import vdom.VDom.ImgAttr;
import coconut.ui.View;

//TODO: add list group support
//TODO: make list items individual Views to have standalone ripple effect
class List extends View<ListAttr>
{

	function render(attr)
	{
		var className = attr.className.add(["mdc-list" => true,
											"mdc-list--two-line" => attr.twoLine,
											"mdc-list--avatar-list" => attr.avatarList,
											"mdc-list--dense" => attr.dense ]);

		return attr.interactive
			   ? @hxx '<nav className=${className} {...attr}>${attr.items}</nav>'
			   : @hxx '<ul className=${className} {...attr}>${attr.items}</ul>';
	}

	static public function listItem(attr:{>Attr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<li class=${attr.className.add(["mdc-list-item" => true,
													 "mdc-ripple-surface" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						 data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>${children}</li>';

	static public function listLinkItem(attr:{>AnchorAttr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<a href=${attr.href != null ? attr.href : "#"}
						class=${attr.className.add(["mdc-list-item" => true,
													"mdc-ripple-surface" => attr.ripple])}
						onclick=${attr.onclick}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</a>';

	static public function listStartDetail(attr:{>Attr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__graphic" => true,
													"mdc-ripple-surface" => attr.ripple])}
													data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartIcon(attr:{>Attr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__graphic" => true,
													"material-icons" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listEndIcon(attr:{>Attr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__meta" => true,
													"material-icons" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartImage(attr:{>ImgAttr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<img class=${attr.className.add(["mdc-list-item__graphic" => true,
													  "mdc-ripple-surface" => attr.ripple])}
						  data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr} />';

	static public function listEndDetail(attr:{>Attr, >RippleAttr, }, ?children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__meta" => true,
													"mdc-ripple-surface" => attr.ripple])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listText(attr:Attr, ?children:VNode):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__text" => true])} {...attr}>{children}</span>';

	static public function listTextSecondary(attr:Attr, ?children:VNode):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__secondary-text" => true])} {...attr}>{children}</span>';

	static public function listDivider(attr:{>Attr, ?inset:Bool}, ?children:VNode):VNode
		return @hxx '<li class=${attr.className.add(["mdc-list-divider" => true, "mdc-list-divider--inset" => attr.inset])} {...attr}>{children}</li>';
}

@:pure
typedef ListAttr = {>Attr,
	@:optional var dense(default,never):Bool;
	@:optional var twoLine(default,never):Bool;
	@:optional var avatarList(default,never):Bool;
	@:optional var interactive(default,never):Bool;

	@:optional var items(default,never):VNode;
}

