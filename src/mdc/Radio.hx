package mdc;

import mdc.MDC.MDCRadio;
import coconut.ui.View;
import tink.domspec.ClassName;

class Radio extends View
{
    @:attr var className:ClassName = "";
    @:attr var id:String = null;
    @:attr var label:String = null;
    @:attr var disabled:Bool = null;
    @:attr var checked:Bool = null;
    @:attr var value:String = null;
    @:attr var name:String = null;
    @:attr var onchecked:Bool->Void = null;

    @:ref var root:js.html.Element;
    
    static var radioIndex = 0;
    var radioId:UInt = radioIndex++;
    var mdcRadio:MDCRadio;

    function render()
    {
        var id = id == null ? "r_" + radioId : id;
        return
            if ( label != null )
                @hxx '<div ref=${root} class=${className.add(["mdc-form-field" => true])} {...this}>
                          <div class="mdc-radio">
                              <input type="radio"
                                   onchange=${if (onchecked != null) onchecked(event.currentTarget.checked)}
                                   class="mdc-radio__native-control"
                                   id=${id}
                                   name=${name}
                              />
                              <div class="mdc-radio__background">
                                <div class="mdc-radio__outer-circle"></div>
                                <div class="mdc-radio__inner-circle"></div>
                              </div>
                          </div>
                          <label htmlFor=${id}>${this.label}</label>
                    </div>';
            else
                @hxx '<div class="mdc-radio">
                          <input type="radio"
                               onchange=${if (onchecked != null) onchecked(event.currentTarget.checked)}
                               class="mdc-radio__native-control"
                               id=${id}
                               name=${name}
                          />
                          <div class="mdc-radio__background">
                            <div class="mdc-radio__outer-circle"></div>
                            <div class="mdc-radio__inner-circle"></div>
                          </div>
                      </div>';

    }

    override function viewDidMount()
    {
        this.mdcRadio = new MDCRadio(root.current);
        setRadioProperties();
    }

    override function viewDidUpdate()
    {
        setRadioProperties();
    }

    function setRadioProperties()
    {
        mdcRadio.checked = checked;
        mdcRadio.disabled = disabled;
        mdcRadio.value = value;
    }

    override function viewWillUnmount()
    {
        if ( this.mdcRadio != null )
            this.mdcRadio.destroy();
    }
}

