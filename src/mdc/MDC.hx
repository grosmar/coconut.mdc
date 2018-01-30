package mdc;

import js.html.*;

class MDC
{
	public static inline var DEFAULT_RIPPLE = true;

	static function __init__()
	{
		// TODO: remove
		// TODO: deeply check it's performance and if it's leaking!!!
		var observer = new MutationObserver( function( mutations:Array<MutationRecord>, mo:MutationObserver)
		{

			for ( mutation in mutations )
			{
				for ( node in mutation.addedNodes )
				{

					if ( node.nodeType ==  Node.ELEMENT_NODE )
					{
						registerAll(node, "mdc-ripple-surface", MDCRipple, "MDCRipple");
						//registerAll(node, "mdc-radio", MDCRadio, "MDCRadio");
						/*registerAll(node, "mdc-tab-bar", MDCTabBar, "MDCTabBar");
						registerAll(node, "mdc-ripple-surface", MDCRipple, "MDCRipple");
						registerAll(node, "mdc-radio", MDCRadio, "MDCRadio");*/

					}
				}

				for ( node in mutation.removedNodes )
				{
					if ( node.nodeType ==  Node.ELEMENT_NODE )
					{
						//unregisterAll(node, "mdc-tab-bar", "MDCTabBar");
						unregisterAll(node, "mdc-ripple-surface", "MDCRipple");
						//unregisterAll(node, "mdc-radio", "MDCRadio");
					}
				}
			}
		});

		observer.observe(js.Browser.document.body, {childList:true, subtree:true});
	}

	static inline function registerAll<T>(node:Node, className:String, handler:Class<T>, ref:String)
	{
		var el:Element = cast node;

		if ( el.classList.contains(className) )
			register(el, className, handler, ref);

		var list = el.getElementsByClassName(className);
		for ( i in list )
		{
			register(i, className, handler, ref);
		}
	}

	static inline function register<T>(node:DOMElement, className:String, handler:Class<T>, ref:String)
	{
		if ( Reflect.getProperty(node, ref) != null )
			return;

		var handler = Type.createInstance(handler, [node]);
		Reflect.setProperty(node, ref, handler);
	}


	static inline function unregisterAll<T>(node:Node, className:String, ref:String)
	{
		var el:Element = cast node;

		if ( el.classList.contains(className) )
			unregister(el, className, ref);

		var list = el.getElementsByClassName(className);
		for ( i in list )
		{
			unregister(i, className, ref);
		}
	}

	static inline function unregister(node:DOMElement, className:String, ref:String)
	{
		var handler:MDCComponent = Reflect.getProperty(node, ref);

		if ( handler != null )
		{
			handler.destroy();
		}
	}
}



@:native("window.mdc.ripple.MDCRipple")
extern class MDCRipple extends MDCComponent { }

@:native("mdc.textField.MDCTextField")
extern class MDCTextField extends MDCComponent { }

@:native("window.mdc.checkbox.MDCCheckbox")
extern class MDCCheckbox extends MDCComponent
{
	var checked:Bool;
	var indeterminate:Bool;
	var disabled:Bool;
	var value:Bool;
}

@:native("window.mdc.radio.MDCRadio")
extern class MDCRadio extends MDCComponent { }

@:native("window.mdc.tabs.MDCTabBar")
extern class MDCTabBar extends MDCComponent
{
	var activeTabIndex(default,default):Int;

	function listen(event:String, callback:{detail:MDCTabBar}->Void):Void;

	function layout():Void;
	function initialize():Void;
}

extern class MDCComponent
{
	function new(element:DOMElement);

	function destroy():Void;
}

typedef RippleAttr = {
	@:optional var ripple:Bool;
	@:optional var unboundedRipple:Bool;
}