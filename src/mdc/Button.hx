package mdc;

import vdom.VDom.InputAttr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Button extends View<{>InputAttr, ?label:String, ?disabled:Bool, ?icon:String, ?raised:Bool, ?unelevated:Bool, ?stroked:Bool, ?dense:Bool, ?compact:Bool, ?ripple:Bool}>
{

    function render(attr)
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
}