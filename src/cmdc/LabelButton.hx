package cmdc;

import mdc.MDC.MDCRipple;
import vdom.VDom.InputAttr;
import vdom.VDom.*;
import coconut.ui.View;

class LabelButton extends View
{
    var attributes:InputAttr;
    @:attr var htmlFor:String;
    @:attr var label:String = null;
    // @:attr var disabled:Bool = null;
    @:attr var icon:String = null;
    @:attr var raised:Bool = false;
    @:attr var unelevated:Bool = false;
    @:attr var stroked:Bool = false;
    @:attr var dense:Bool = false;
    @:attr var compact:Bool = false;
    @:attr var ripple:Bool = true;
    var mdcRipple:MDCRipple = null;

    function render()
    {
        return @hxx '<vdom.VDom.label class=${className.add(["mdc-button" => true,
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
        </vdom.VDom.label>';
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