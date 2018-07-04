package mdc;

import js.html.MouseEvent;
import coconut.vdom.ClassName;
import mdc.MDC.MDCRipple;
import coconut.ui.View;

class Button extends View
{
    @:attr var className:ClassName = "";
    @:attr var onclick:MouseEvent->Void = null;
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