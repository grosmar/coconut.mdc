package mdc;

import vdom.VDom.InputAttr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Button extends View<{>InputAttr, ?label:String, ?disabled:Bool, ?icon:String, ?iconPos:ButtonIconPos, ?raised:Bool, ?unelevated:Bool, ?stroked:Bool, ?dense:Bool, ?compact:Bool, ?ripple:Bool}>
{

    function render(data)
    {
        return @hxx '<button class=${data.className.add(["mdc-button" => true,
                                                         "mdc-ripple-surface" => (data.ripple != null ? data.ripple : true),
                                                         "mdc-button--raised" => data.raised,
                                                         "mdc-button--unelevated" => data.unelevated,
                                                         "mdc-button--stroked" => data.stroked,
                                                         "mdc-button--dense" => data.dense,
                                                         "mdc-button--compact" => data.compact])} {...data} >
            <if ${data.icon != null && data.iconPos != ButtonIconPos.Right}>
                <i class="mdc-button__icon material-icons">${data.icon}</i>
            </if>
            ${data.label}
            <if ${data.icon != null && data.iconPos == ButtonIconPos.Right}>
                <i class="mdc-button__icon material-icons">${data.icon}</i>
            </if>
        </button>';
    }
}

@:enum abstract ButtonIconPos(String) from String to String {
    var Left = "left";
    var Right = "right";
}