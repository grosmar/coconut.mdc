package mdc;

import mdc.MDC.MDCRadio;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;

class Radio extends View
{
    var attributes:Attr;
    @:attr var label:String = null;
    @:attr var disabled:Bool = null;
    @:attr var checked:Bool = null;
    @:attr var value:String = null;
    @:attr var name:String = null;
    @:attr var onchecked:Bool->Void = null;
    
    static var radioIndex = 0;
    var radioId:UInt = radioIndex++;
    var mdcRadio:MDCRadio;

    function render()
    {
        var id = id == null ? "r_" + radioId : id;
        return
            if ( label != null )
                @hxx '<div class="mdc-form-field" {...this}>
                          <div class="mdc-radio">
                              <input type="radio"
                                   onchange=${if (onchecked != null) onchecked(event.target.checked)}
                                   value=${value}
                                   checked=${checked}
                                   class="mdc-radio__native-control"
                                   id=${"r_" + id}
                                   name=${name}
                              />
                              <div class="mdc-radio__background">
                                <div class="mdc-radio__outer-circle"></div>
                                <div class="mdc-radio__inner-circle"></div>
                              </div>
                          </div>
                          <if ${label != null}>
                            <vdom.VDom.label htmlFor=${id}>${this.label}</vdom.VDom.label>
                          </if>
                    </div>';
            else
                @hxx '<div class="mdc-radio">
                          <input type="radio"
                               onchange=${if (onchecked != null) onchecked(event.target.checked)}
                               value=${value}
                               checked=${checked}
                               class="mdc-radio__native-control"
                               id=${"r_" + id}
                               name=${name}
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

    override function beforeDestroy(elem)
    {
        if ( this.mdcRadio != null )
            this.mdcRadio.destroy();
    }
}

