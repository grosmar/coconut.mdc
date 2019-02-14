package mdc;

import js.html.KeyboardEvent;
import js.html.MouseEvent;
import mdc.MDC.MDCTextField;
import coconut.ui.View;
import tink.domspec.ClassName;

class TextField extends View
{
    @:attr var className:ClassName = "";
    @:attr var inputClass:ClassName = "";
    @:attr var label:String = null;
    @:attr var defaultValue:String = null;
    @:attr var disabled:Bool = null;
    @:attr var invalid:Bool = null;
    @:attr var leadingIcon:String = null;
    @:attr var trailingIcon:String = null;
    @:attr var box:Bool = null;
    @:attr var fullWidth:Bool = null;
    @:attr var textArea:Bool = null;
    @:attr var maxLength:Int = null;
    @:attr var type:String = "text";
    @:attr var onChange:String->Void = null;
    @:attr var pattern:String = null;
    @:attr var required:Bool = false;
    @:attr var onLeadingIconClick:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;
    @:attr var onLeadingIconMouseDown:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;
    @:attr var onLeadingIconMouseUp:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;
    @:attr var onTrailingIconClick:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;
    @:attr var onTrailingIconMouseDown:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;
    @:attr var onTrailingIconMouseUp:coconut.react.ReactEvent<js.html.Element,MouseEvent>->Void = null;

    @:attr public var value:String = null;
    @:state var valueNeedsUpdate:Bool = false;

    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;

    @:ref var root:js.html.Element;
    @:ref var input:js.html.InputElement;
    @:ref var textAreaInput:js.html.TextAreaElement;

    var mdcTextField:MDCTextField;



    function render()
    {
        if ( value != null && mdcTextField != null && value != mdcTextField.value )
            valueNeedsUpdate = true;

        return @hxx '<div ref=${root} 
                          class=${className.add(["mdc-text-field" => true,
                                                 "mdc-text-field--disabled" => disabled,
                                                 "mdc-text-field--with-leading-icon" => leadingIcon != null,
                                                 "mdc-text-field--box" => box,
                                                 "mdc-text-field--invalid" => invalid,
                                                 "mdc-text-field--with-trailing-icon" => trailingIcon != null,
                                                 "mdc-text-field--textarea" => textArea,
                                                 "mdc-text-field--fullwidth" => fullWidth])}
                            >
                        <if ${leadingIcon != null}>
                            <i class="material-icons mdc-text-field__icon" 
                               tabIndex=${0} 
                               onmousedown=${if (onLeadingIconMouseDown != null) onLeadingIconMouseDown(event)} 
                               onmouseup=${if (onLeadingIconMouseUp != null) onLeadingIconMouseUp(event)} 
                               onclick=${if (onLeadingIconClick != null) onLeadingIconClick(event)}>${leadingIcon}</i>
                        </if>
                        <if ${textArea}>
                            <textarea ref=${textAreaInput} maxlength=${maxLength} class=${inputClass.add(["mdc-text-field__input" => true])} id=${"tf" + textFieldId} required=${required} onchange=${function (event) {if(onChange != null) onChange(event.currentTarget.value);}} ></textarea>
                        <else>
                            <input ref=${input} maxLength=${maxLength} type=${type} class=${inputClass.add(["mdc-text-field__input" => true])} id=${"tf" + textFieldId} pattern=${pattern} required=${required} onchange=${function (event) {if(onChange != null) onChange(event.currentTarget.value);}} />
                        </if>
                        <if ${label != null}>
                            <label class="mdc-floating-label" htmlFor=${"tf" + textFieldId}>${label}</label>
                        </if>
                        <if ${trailingIcon != null}>
                            <i class="material-icons mdc-text-field__icon" 
                               tabIndex=${0} 
                               onmousedown=${if (onTrailingIconMouseDown != null) onTrailingIconMouseDown(event)} 
                               onmouseup=${if (onTrailingIconMouseUp != null) onTrailingIconMouseUp(event)} 
                               onclick=${if (onTrailingIconClick != null) onTrailingIconClick(event)}>${trailingIcon}</i>
                        </if>
                        <div class="mdc-line-ripple"></div>
                    </div>';
    }

    override function viewDidUpdate()
    {
        mdcTextField.valid = invalid != true;
        
        if ( value != null && valueNeedsUpdate )
        {
            mdcTextField.value = value;
            valueNeedsUpdate = false;
        }
            
    }

    override function viewDidMount()
    {
        this.mdcTextField = new MDCTextField(root.current);
        mdcTextField.valid = invalid != true;
        
        if ( defaultValue != null)
        {
            this.mdcTextField.value = defaultValue;
        }
        if ( value != null )
        {
            this.mdcTextField.value = value;
        }
    }

    override function viewWillUnmount()
    {
        if ( this.mdcTextField != null )
            this.mdcTextField.destroy();
    }
}

@:enum abstract TextFieldType(String) from String to String {
    var Text = "";
    var Icon = "mdc-tab-bar--icon-tab-bar";
    var IconWithText = "mdc-tab-bar--icons-with-text";
}

class TextFieldHelperText extends View
{
    @:attr var className:ClassName = "";
    @:attr var label:String;
    @:attr var persistent:Bool = null;
    @:attr var validation:Bool = null;

    function render()
    '
        <p class=${className.add([ "mdc-text-field-helper-text" => true,
                                   "mdc-text-field-helper-text--persistent" => persistent,
                                   "mdc-text-field-helper-text--validation-msg" => validation])} ${...this} >
            ${label}
        </p>
    ';
}