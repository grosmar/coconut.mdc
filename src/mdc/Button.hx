package mdc;

import js.html.MouseEvent;
import tink.domspec.ClassName;
import mdc.MDC.MDCRipple;
import coconut.ui.View;

class Button extends View
{
    @:attr var className:ClassName = "";
    @:attr var onclick:coconut.react.ReactEvent<js.html.ButtonElement,MouseEvent>->Void = function(_) {};
    @:attr var label:String = "";
    @:attr var disabled:Bool = false;
    @:attr var icon:String = null;
    @:attr var raised:Bool = false;
    @:attr var unelevated:Bool = false;
    @:attr var dense:Bool = false;
    @:attr var outlined:Bool = false;
    @:attr var ripple:Bool = true;
    var mdcRipple:MDCRipple = null;

    @:ref var root:js.html.ButtonElement;

    function render()
    {
        return @hxx '<button ref=${root} class=${className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => ripple,
                                                         "mdc-button--raised" => raised,
                                                         "mdc-button--unelevated" => unelevated,
                                                         "mdc-button--outlined" => outlined,
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
        this.mdcRipple = new MDCRipple(root.current);
    }

    override function viewWillUnmount()
    {
        if ( this.mdcRipple != null )
            this.mdcRipple.destroy();
    }
}