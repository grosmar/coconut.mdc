package mdc;

import js.html.MouseEvent;
import tink.domspec.ClassName;
import mdc.MDC.MDCRipple;
import coconut.ui.View;

class Button extends View
{
    @:attr var className:ClassName = "";
    @:attr var onclick:coconut.react.ReactEvent<js.html.InputElement,MouseEvent>->Void = null;
    @:attr var label:String = "";
    @:attr var disabled:Bool = false;
    @:attr var icon:String = null;
    @:attr var raised:Bool = false;
    @:attr var unelevated:Bool = false;
    @:attr var stroked:Bool = false;
    @:attr var dense:Bool = false;
    @:attr var ripple:Bool = true;
    var mdcRipple:MDCRipple = null;

    @:ref var root:js.html.Element;

    function render()
    {
        return @hxx '<button ref=${root} class=${className.add(["mdc-button" => true,
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

    override function viewDidMount()
    {
        this.mdcRipple = new MDCRipple(root);
    }

    override function viewWillUnmount()
    {
        if ( this.mdcRipple != null )
            this.mdcRipple.destroy();
    }
}