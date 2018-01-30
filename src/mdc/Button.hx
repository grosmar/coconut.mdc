package mdc;

import mdc.MDC.MDCRipple;
import vdom.VDom.InputAttr;
//import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Button extends View
{
    var attributes:InputAttr;
    @:attribute var label:String = null;
    // @:attribute var disabled:Bool = null;
    @:attribute var icon:String = null;
    @:attribute var raised:Bool = false;
    @:attribute var unelevated:Bool = false;
    @:attribute var stroked:Bool = false;
    @:attribute var dense:Bool = false;
    @:attribute var compact:Bool = false;
    @:attribute var ripple:Bool = true;
    var mdcRipple:MDCRipple = null;

    function render()
    {
        return @hxx '<button class=${className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => ripple,
                                                         "mdc-button--raised" => raised,
                                                         "mdc-button--unelevated" => unelevated,
                                                         "mdc-button--stroked" => stroked,
                                                         "mdc-button--dense" => dense,
                                                         "mdc-button--compact" => compact])}
                             onclick=${onclick} {...this}>
            <if ${icon != null}>
                <i class="mdc-button__icon material-icons">${icon}</i>
            </if>
            ${label}
        </button>';
    }

    override function afterInit(elem)
    {
        this.mdcRipple = new MDCRipple(elem);
    }

    override function destroy()
    {
        if ( this.mdcRipple != null )
            this.mdcRipple.destroy();
    }
}