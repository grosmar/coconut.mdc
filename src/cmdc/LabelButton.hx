package cmdc;

import mdc.MDC.MDCRipple;
import coconut.ui.View;
import js.html.MouseEvent;

class LabelButton extends View
{
    @:attr var className:tink.domspec.ClassName;
    @:attr var htmlFor:String;
    @:attr var label:String = null;
    @:attr var disabled:Bool = false;
    @:attr var icon:String = null;
    @:attr var raised:Bool = false;
    @:attr var unelevated:Bool = false;
    @:attr var stroked:Bool = false;
    @:attr var dense:Bool = false;
    @:attr var compact:Bool = false;
    @:attr var ripple:Bool = true;
    @:attr var onclick:MouseEvent->Void = null;
    @:ref var root:js.html.Element;
    var mdcRipple:MDCRipple = null;

    function render()
    {
        return @hxx '<label ref=${root} class=${className.add(["mdc-button" => true,
        "mdc-ripple-surface" => ripple,
        "mdc-button--raised" => raised,
        "mdc-button--unelevated" => unelevated,
        "mdc-button--stroked" => stroked,
        "mdc-button--dense" => dense,
        "mdc-button--compact" => compact])}
                             htmlFor=${htmlFor}
                             onclick=${onclick} {...this}>
            <if ${icon != null}>
                <i class="mdc-button__icon material-icons">${icon}</i>
            </if>
            ${label}
        </label>';
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