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
import vdom.VNode;
import vdom.VDom.ImgAttr;
import coconut.ui.View;
import coconut.ui.Children;

//TODO: add list group support
//TODO: make list items individual Views to have standalone ripple effect
class List extends View
{
	var attributes:Attr;
	@:attr var dense:Bool = false;
	@:attr var twoLine:Bool = false;
	@:attr var avatarList:Bool = false;
	@:attr var nonInteractive:Bool = false;
	@:attr var children:Children;

	function render()
	{
		return @hxx '<ul className=${className.add(["mdc-list" => true,
													"mdc-list--two-line" => twoLine,
													"mdc-list--avatar-list" => avatarList,
													"mdc-list--non-interactive" => nonInteractive,
													"mdc-list--dense" => dense ])} ${...this}>${...children}</ul>';
	}
}

class ListItem extends View
{
	var attributes:{>Attr, >RippleAttr, };
	@:attr var children:Children;
	var mdcRipple:MDCRipple;

	function render()
	'
		<li class=${className.add(["mdc-list-item" => true])}
			data-mdc-ripple-is-unbounded=${unboundedRipple} ${...this}>${...children}</li>
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

class ListText extends View
{
	var attributes:Attr;
	@:attr var children:Children;

	function render()
	'
		<span class=${className.add(["mdc-list-item__text" => true])} ${...this}>${...children}</span>
	';
}

class ListTextSecondary extends View
{
	var attributes:Attr;
	@:attr var children:Children;

	function render()
	'
		<span class=${className.add(["mdc-list-item__secondary-text" => true])} ${...this}>${...children}</span>
	';
}

class ListGraphic extends View
{
	var attributes:{>Attr, >RippleAttr, };
	@:attr var children:Children;

	function render()
	'
		<span class=${className.add(["mdc-list-item__graphic" => true,
										   "mdc-ripple-surface" => ripple])}
			  data-mdc-ripple-is-unbounded=${unboundedRipple} ${...this}>${...children}</span>
	';
}

class ListGraphicImage extends View
{
	var attributes:{>ImgAttr, >RippleAttr, };

	function render()
	'
		<img class=${className.add(["mdc-list-item__graphic" => true,
								    "mdc-ripple-surface" => ripple])}
		     data-mdc-ripple-is-unbounded=${unboundedRipple} ${...this}></img>
	';
}

class ListMeta extends View
{
	var attributes:{>Attr, >RippleAttr, };
	@:attr var children:Children;

	function render()
	'
		<span class=${className.add(["mdc-list-item__meta" => true,
	 								 "mdc-ripple-surface" => ripple])}
			  data-mdc-ripple-is-unbounded=${unboundedRipple} ${...this}>${...children}</span>
	';
}

class ListDivider extends View
{
	var attributes:Attr;
	@:attr var inset:Bool = false;

	function render()
	'
		<li class=${className.add(["mdc-list-divider" => true,
								   "mdc-list-divider--inset" => inset])} ${...this}></li>
	';
}