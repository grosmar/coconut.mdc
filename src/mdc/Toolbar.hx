package mdc;

import coconut.ui.Children;
import coconut.ui.View;

class Toolbar extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var children:Children;
	//TODO: add fixed&waterfal

	function render(attr)
	'
		<header class=${className.add(["mdc-toolbar" => true])} ${...this}>
			${...children}
		</header>
	';
}

class ToolbarRow extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var children:Children;

	function render(attr)
	'
		<div class=${className.add(["mdc-toolbar__row" => true])} ${...this}>
			${...children}
		</div>
	';
}

class ToolbarSection extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var children:Children;
	@:attr var align:ToolbarSectionAlign = ToolbarSectionAlign.Center;
	@:attr var shringToFit:Bool = false;

	function render(attr)
	'
		<section class=${className.add(["mdc-toolbar__section" => true, "mdc-toolbar__section--shrink-to-fit" => shringToFit, align => true])} ${...this}>
			${...children}
		</section>
	';
}

@:enum abstract ToolbarSectionAlign(String) to String
{
	var Start = "mdc-toolbar__section--align-start";
	var Center = "";
	var End = "mdc-toolbar__section--align-end";
}

class ToolbarTitle extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var children:Children;

	function render(attr)
	'
		<span class=${className.add(["mdc-toolbar__title" => true])} ${...this}>
			${...children}
		</span>
	';
}

class ToolbarMenuIcon extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var name:IconName;
	@:attr var onclick:js.html.Event->Void;

	function render(attr)
	'
		<span class=${className.add(["mdc-toolbar__menu-icon" => true, "material-icons" => true])} ${...this}>
			${name}
		</span>
	';
}

class ToolbarIcon extends View
{
	@:attr var className:coconut.vdom.ClassName = "";
	@:attr var name:IconName;

	function render(attr)
	'
		<span class=${className.add(["mdc-toolbar__icon" => true, "material-icons" => true])} ${...this}>
			${name}
		</span>
	';
}