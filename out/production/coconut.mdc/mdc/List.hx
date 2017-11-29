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
import vdom.VDom.ImgAttr;
import coconut.ui.View;

/*class List extends View<{attr:ListAttr, children:VNode}>
{

	function render()
	{
		attr.className.add("mdc-list");
		return
		if (attr.interactive)
			@hxx '<nav class={attr.className.add(["mdc-list" => true, "mdc-list--two-line" => attr.twoLine, "mdc-list--avatar-list" => attr.avatarList ])} {...attr}>{children}</nav>';
		else
			@hxx '<ul class={attr.className.add(["mdc-list" => true, "mdc-list--two-line" => attr.twoLine, "mdc-list--avatar-list" => attr.avatarList ])} {...attr}>{children}</ul>';
	}
}*/

//TODO: add list group support

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

	static public function list(attr:ListAttr, children:VNode):VNode
		return attr.interactive
		   ? @hxx '<nav class=${attr.className.add(["mdc-list" => true,
													"mdc-list--two-line" => attr.twoLine,
													"mdc-list--avatar-list" => attr.avatarList,
												    "mdc-list--dense" => attr.dense ])} {...attr}>${children}</nav>'
		   : @hxx '<ul class=${attr.className.add(["mdc-list" => true,
		 										   "mdc-list--two-line" => attr.twoLine,
											 	   "mdc-list--avatar-list" => attr.avatarList ])} {...attr}>{children}</ul>';

	static public function listItem(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<li class=${attr.className.add(["mdc-list-item" => true,
													 "mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						 data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>${children}</li>';

	static public function listLinkItem(attr:{>AnchorAttr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<a href=${attr.href != null ? attr.href : "#"}
						class=${attr.className.add(["mdc-list-item" => true,
													"mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</a>';

	static public function listStartDetail(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__start-detail" => true,
													"mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
													data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartIcon(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__start-detail" => true,
													"material-icons" => true,
													"mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listEndIcon(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__end-detail" => true,
													"material-icons" => true,
													"mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartImage(attr:{>ImgAttr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<img class=${attr.className.add(["mdc-list-item__start-detail" => true,
													  "mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						  data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr} />';

	static public function listEndDetail(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class=${attr.className.add(["mdc-list-item__end-detail" => true,
													"mdc-ripple-upgraded" => (attr.ripple == null ? MDC.DEFAULT_RIPPLE : attr.ripple)])}
						data-mdc-ripple-is-unbounded=${attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listItemText(attr:Attr, ?children:VNode):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__text" => true])} {...attr}>{children}</span>';

	static public function listItemTextSecondary(attr:Attr, ?children:VNode):VNode
		return @hxx '<span class=${attr.className.add(["mdc-list-item__text__secondary" => true])} {...attr}>{children}</span>';

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

