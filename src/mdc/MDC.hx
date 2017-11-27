package mdc;
import vdom.VNode.Children;
import vdom.VDom.EditableAttr;
class MDC
{
	static inline function mdc_list(attr:{>EditableAttr}, ?children:Children):VNode return '
  <button class={attr.className.add(["btn" => true, "btn-small" => attr.small, "btn-big" => attr.big ])} {...attr}>
    {children}
  </button>';
}
