package mdc;

import mdc.MDC.MDCRipple;
import vdom.VDom.InputAttr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Button extends View
{
    var attributes:InputAttr;
    @:attribute var label:String = null;
    @:attribute var disabled:Bool = null;
    @:attribute var icon:String = null;
    @:attribute var raised:Bool = null;
    @:attribute var unelevated:Bool = null;
    @:attribute var stroked:Bool = null;
    @:attribute var dense:Bool = null;
    @:attribute var compact:Bool = null;
    @:attribute var ripple:Bool = null;
    var mdcRipple:MDCRipple = null;

    //TODO: add back attributes  "mdc-button--compact" => compact])} {...attributes}
    function render()
    {
        return @hxx '<button class=${className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => (ripple != null ? ripple : true),
                                                         "mdc-button--raised" => raised,
                                                         "mdc-button--unelevated" => unelevated,
                                                         "mdc-button--stroked" => stroked,
                                                         "mdc-button--dense" => dense,
                                                         "mdc-button--compact" => compact])}
                             onclick=${onclick}>
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

typedef ButtonAttr = {>InputAttr,
    var label:String;
    var disabled:Bool;
    var icon:String;
    var raised:Bool;
    var unelevated:Bool;
    var stroked:Bool;
    var dense:Bool;
    var compact:Bool;
    var ripple:Bool;
}