package mdc;
/**
 * @prop dense = false
 * @prop two-line = false
 * @prop interactive = false
 */
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

@:tink
class List
{

	static public function list(attr:ListAttr, children:VNode):VNode
		return attr.interactive
		   ? @hxx '<nav class={attr.className.add(["mdc-list" => true, "mdc-list--two-line" => attr.twoLine, "mdc-list--avatar-list" => attr.avatarList, "mdc-list--dense" => attr.dense ])} {...attr}>{children}</nav>'
		   : @hxx '<ul class={attr.className.add(["mdc-list" => true, "mdc-list--two-line" => attr.twoLine, "mdc-list--avatar-list" => attr.avatarList ])} {...attr}>{children}</ul>';

	static public function listItem(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<li class={attr.className.add(["mdc-list-item" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</li>';

	static public function listLinkItem(attr:{>AnchorAttr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<a href={attr.href != null ? attr.href : "#"} class={attr.className.add(["mdc-list-item" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</a>';

	static public function listStartDetail(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class={attr.className.add(["mdc-list-item__start-detail" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartIcon(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
	return @hxx '<i class={attr.className.add(["mdc-list-item__start-detail" => true, "material-icons" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</i>';

	static public function listStartImage(attr:{>ImgAttr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<img class={attr.className.add(["mdc-list-item__start-detail" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr} />';

	static public function listEndDetail(attr:{>Attr, >RippleAttr, }, children:VNode):VNode
		return @hxx '<i class={attr.className.add(["mdc-list-item__end-detail" => true, "mdc-ripple-upgraded" => !attr.noRipple])} data-mdc-ripple-is-unbounded={attr.unboundedRipple} {...attr}>{children}</i>';

	/*static public function listLink(attr:AnchorAttr, children:VNode):VNode
		return new ListLink({attr:attr, children:children});*/
}

@:pure
typedef ListAttr = {>Attr,
	@:optional var dense(default,never):Bool;
	@:optional var twoLine(default,never):Bool;
	@:optional var avatarList(default,never):Bool;
	@:optional var interactive(default,never):Bool;
}

typedef RippleAttr = {
	@:optional var noRipple:Bool;
	@:optional var unboundedRipple:Bool;
}

/*
class ListLink extends View<{attr:AnchorAttr, children:VNode}>
{

	function render()
		'<a href={attr.href != null ? attr.href : "#"} class={attr.className.add("mdc-list-item")} {...attr}>{children}</a>';


	override function afterInit(_)
	{
		@in(.01) @do get('a').focus();
	}

}*/
/*

class ListItem extends MaterialComponent
{
	public function new()
	{
		super();
		this.componentName = "list-item";
	}

	function materialDom(props)
	{
		return (
		<li {...props} >
			{props.children}
		</li>
		);
	}
}
/*
class LinkItem extends MaterialComponent
{
	public function new()
	{
		super();
		this.componentName = "list-item";
	}

	function componentDidMount()
	{
		super.attachRipple();
	}

	function materialDom(props)
	{
		return (
			   < a role = "option" {...props} ref ={control => (this.control = control)}>
		{props.children}
		< / a>
		);
	}
}

/**
 * @prop start-detail = true
 * @prop end-detail = false
 */
/*class ListItemIcon extends MaterialComponent
{
	public function new()
	{
		super();
		this.componentName = "mdc-list-item__icon";
	}

	function getProxyClassName(props)
	{
		let classNames = [];

		// default behavior
		props["start-detail"] = props["start-detail"] || true;

		// setting class names mutually exclusive
		if (props["end-detail"])
		{
			classNames.push("mdc-list-item__end-detail");
		}
		else if (props["start-detail"])
		{
			classNames.push("mdc-list-item__start-detail");
		}
		return classNames.join(" ");
	}

	function materialDom(props)
	{
		const className = "material-icons " + this.getProxyClassName(props);
		return (
			   < i
		className ={className}
		aria - hidden = "true"
		{...props}
		ref ={control => (this.control = control)}
		>
		{props.children}
		< / i>
		);
	}
}

/**
 * @prop start-detail = true
 * @prop end-detail = false
 */
/*class ListItemAvatar extends ListItemIcon
{
	public function new()
	{
		super();
		this.componentName = "mdc-list-item__avatar";
	}

	function materialDom(props)
	{
		return (
			   < img
		{...props}
		className ={super.getProxyClassName(props)}
		{...props}
		ref ={control => (this.control = control)}
		width ={props.width || "56"}
		height ={props.height || "56"}
		alt ={props.alt || ""}
		/ >
		);
	}
}

class ListDivider extends MaterialComponent
{
	public function new()
	{
		super();
		this.componentName = "list-divider";
		this._mdcProps = ["inset"];
	}

	function materialDom(props)
	{
		return (
			   < li
		role = "separator"
		{...props}
		ref ={control => (this.control = control)}
		/ >
		);
	}
}

class ListTextContainer extends MaterialComponent
{
	public function new()
	{
		super();
		this.componentName = "list-item__text";
	}

	function materialDom(props)
	{
		return (
			   < span {...props} ref ={control => (this.control = control)}>
		{props.children}
		< / span>
		);
	}
}

class ListPrimaryText extends ListTextContainer
{
	public function new()
	{
		super();
		this.componentName = "list-item__text__primary";
	}
}

class ListSecondaryText extends ListTextContainer
{
	public function new()
	{
		super();
		this.componentName = "list-item__text__secondary";
	}
}*/