package mdc;
/**
 * @prop dense = false
 * @prop two-line = false
 * @prop interactive = false
 */
import vdom.Attr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;

class List //extends View<{>Attr, ?dense:Bool, ?twoLine:Bool, ?avatarList:Bool, ?interactive:Bool, ?children:Dynamic}>
{

	static public inline function mdclist(attr:{>Attr, ?dense:Bool, ?twoLine:Bool, ?avatarList:Bool, ?interactive:Bool}, ?children:Children):VNode
	{
		attr.className.add(["mdc-list" => true, "mdc-list--two-line" => attr.twoLine, "mdc-list--avatar-list" => attr.avatarList ]);
		return attr.interactive
			   ? h('nav', attr, children)
			   : h('ul', attr, children);
	}

	/*function render()
	{
		return
		if (interactive)
			@hxx '<nav class="{["mdc-list" => true, "mdc-list--two-line" => twoLine, "mdc-list--avatar-list" => avatarList ])}>{children}</nav>';
		else
			@hxx '<ul {...props} ref ={control => (this.control = control)}>{props.children}</ul>';
	}*/
}



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
			   < li role = "option" {...props} ref ={control => (this.control = control)}>
		{props.children}
		< / li>
		);
	}
}

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