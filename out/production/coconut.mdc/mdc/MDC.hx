package mdc;
import js.html.DOMElement;
import js.html.Node;
import js.html.MutationRecord;
import js.html.MutationObserver;

class MDC
{
	static function __init__()
	{
		// TODO: deeply check it's performance and if it's leaking!!!

		var observer = new MutationObserver( function( mutations:Array<MutationRecord>, mo:MutationObserver)
		{

			for ( mutation in mutations )
			{
				for ( node in mutation.addedNodes )
				{
					if ( node.nodeType ==  Node.ELEMENT_NODE )
					{
						register(node, "mdc-ripple-surface", MDCRipple, "MDCRipple");
						register(node, "mdc-radio", MDCRadio, "MDCRadio");
					}
				}

				for ( node in mutation.removedNodes )
				{
					if ( node.nodeType ==  Node.ELEMENT_NODE )
					{
						unregister(node, "mdc-ripple-surface", "MDCRipple");
						unregister(node, "mdc-radio", "MDCRadio");
					}
				}
			}

			//untyped window.mdc.autoInit();
		});

		observer.observe(js.Browser.document.body, {childList:true, subtree:true});
	}

	static inline function register<T>(node:Node, className:String, handler:Class<T>, ref:String)
	{
		var el = cast(node, DOMElement);
		var list = el.getElementsByClassName(className);

		for ( i in list )
		{
			var handler = Type.createInstance(handler, [i]);

			Reflect.setProperty(i, ref, handler);
		}
	}

	static inline function unregister<T>(node:Node, className:String, ref:String)
	{
		var el = cast(node, DOMElement);
		var list = el.getElementsByClassName(className);

		for ( i in list )
		{
			var p:MDCComponent = Reflect.getProperty(i, ref);
			if ( p != null )
			{
				p.destroy();
			}
		}
	}
}

@:native("window.mdc.ripple.MDCRipple")
extern class MDCRipple extends MDCComponent
{

}

@:native("window.mdc.radio.MDCRadio")
extern class MDCRadio extends MDCComponent
{

}

extern class MDCComponent
{
	function new(element:DOMElement);

	function destroy():Void;
}