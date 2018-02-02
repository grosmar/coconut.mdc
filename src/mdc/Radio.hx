package mdc;

import mdc.MDC.MDCRadio;
import vdom.Attr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Radio extends View<RadioAttr>
{

    static var radioIndex = 0;
    var radioId:UInt = radioIndex++;
    var mdcRadio:MDCRadio;

    function render(attr:RadioAttr)
    {
        var id = attr.id == null ? radioId : attr.id;
        return
            if ( attr.label != null )
                @hxx '<div class="mdc-form-field" {...attr}>
                          <div class="mdc-radio">
                              <input type="radio"
                                   onchange=${attr.onchecked(event.target.checked)}
                                   value=${attr.value}
                                   checked=${attr.checked}
                                   class="mdc-radio__native-control"
                                   id=${"r_" + id}
                                   name=${attr.name}
                              />
                              <div class="mdc-radio__background">
                                <div class="mdc-radio__outer-circle"></div>
                                <div class="mdc-radio__inner-circle"></div>
                              </div>
                          </div>
                          <label htmlFor=${"r_" + id}>${attr.label}</label>
                    </div>';
            else
                @hxx '<div class="mdc-radio">
                          <input type="radio"
                               onchange=${attr.onchecked(event.target.checked)}
                               value=${attr.value}
                               checked=${attr.checked}
                               class="mdc-radio__native-control"
                               id=${"r_" + attr.id}
                               name=${attr.name}
                          />
                          <div class="mdc-radio__background">
                            <div class="mdc-radio__outer-circle"></div>
                            <div class="mdc-radio__inner-circle"></div>
                          </div>
                      </div>';

    }

    override function afterInit(elem)
    {
        this.mdcRadio = new MDCRadio(elem);
    }

    override function destroy()
    {
        if ( this.mdcRadio != null )
            this.mdcRadio.destroy();
    }
}

typedef RadioAttr = {>Attr,
    @:optional var label(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var checked(default,never):Bool;
    @:optional var value(default,never):String;
    @:optional var name(default,never):String;
    @:optional function onchecked(checked:Bool):Void;

}
