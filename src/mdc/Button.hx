package mdc;

import mdc.MDC.MDCRipple;
import vdom.VDom.InputAttr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Button extends View<ButtonAttr>
{
    var mdcRipple:MDCRipple;

    function render(attr:ButtonAttr)
    {
        return @hxx '<button class=${attr.className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => (attr.ripple != null ? attr.ripple : true),
                                                         "mdc-button--raised" => attr.raised,
                                                         "mdc-button--unelevated" => attr.unelevated,
                                                         "mdc-button--stroked" => attr.stroked,
                                                         "mdc-button--dense" => attr.dense,
                                                         "mdc-button--compact" => attr.compact])} {...attr}
                             onclick=${attr.onclick}>
            <if ${attr.icon != null}>
                <i class="mdc-button__icon material-icons">${attr.icon}</i>
            </if>
            ${attr.label}
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
    @:optional var label(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var icon(default,never):String;
    @:optional var raised(default,never):Bool;
    @:optional var unelevated(default,never):Bool;
    @:optional var stroked(default,never):Bool;
    @:optional var dense(default,never):Bool;
    @:optional var compact(default,never):Bool;
    @:optional var ripple(default,never):Bool;
}