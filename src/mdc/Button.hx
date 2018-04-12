package mdc;

import js.html.InputElement;
import js.html.ButtonElement;
import tink.core.Callback;
import js.html.MouseEvent;
import js.html.Element;
import vdom.Attr.ClassName;
import mdc.MDC.MDCRipple;
import vdom.VDom.InputAttr;
//import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
import vdom.Attr;
//import coconut.Ui.hxx;

class Button extends View
{
    @:attr var className:ClassName = "";
    @:attr var onclick:Callback<EventFrom<MouseEvent, InputElement>> = null;
    @:attr var label:String = null;
    @:attr var disabled:Bool = false;
    @:attr var icon:String = null;
    @:attr var raised:Bool = false;
    @:attr var unelevated:Bool = false;
    @:attr var stroked:Bool = false;
    @:attr var dense:Bool = false;
    @:attr var ripple:Bool = true;
    var mdcRipple:MDCRipple = null;

    function render()
    {
        return @hxx '<button class=${className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => ripple,
                                                         "mdc-button--raised" => raised,
                                                         "mdc-button--unelevated" => unelevated,
                                                         "mdc-button--stroked" => stroked,
                                                         "mdc-button--dense" => dense])}
                             {...this}>
            <if ${icon != null}>
                <i class="material-icons mdc-button__icon">${icon}</i>
            </if>
            ${label}
        </button>';
    }

    override function afterInit(elem)
    {
        this.mdcRipple = new MDCRipple(elem);
    }

    override function beforeDestroy(elem)
    {
        if ( this.mdcRipple != null )
            this.mdcRipple.destroy();
    }
}