package mdc;

import js.html.KeyboardEvent;
import mdc.MDC.MDCTextField;
import coconut.ui.View;
import tink.domspec.ClassName;

class TextField extends View
{
    @:attr var className:ClassName = "";
    @:attr var label:String = null;
    @:attr var value:String = "";
    @:attr var disabled:Bool = null;
    @:attr var invalid:Bool = null;
    @:attr var icon:String = null;
    @:attr var iconPos:TextFieldIconPos = null;
    @:attr var box:Bool = null;
    @:attr var fullWidth:Bool = null;
    @:attr var textArea:Bool = null;
    @:attr var type:String = "text";
    @:attr var onedit:String->Void = null;
    @:attr var pattern:String = "*";
    @:attr var required:Bool = false;
    @:attr var onkeydown:coconut.react.ReactEvent<js.html.Element,KeyboardEvent>->Void = null;

    public var currentValue(get, set):String;

    function get_currentValue() {
        return input.current.value;
    }

    function set_currentValue(value) {
        return input.current.value = value;
    }

    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;

    @:ref var root:js.html.Element;
    @:ref var input:js.html.InputElement;

    var mdcTextField:MDCTextField;



    function render()
    {
        return @hxx '<div ref=${root} class=${className.add(["mdc-text-field" => true,
                                                      "mdc-text-field--disabled" => disabled,
                                                      "mdc-text-field--with-leading-icon" => icon != null,
                                                      "mdc-text-field--box" => box,
                                                      "mdc-text-field--with-leading-icon" => icon != null && iconPos != TextFieldIconPos.Right,
                                                      "mdc-text-field--with-trailing-icon" => iconPos == TextFieldIconPos.Right,
                                                      "mdc-text-field--textarea" => textArea,
                                                      "mdc-text-field--fullwidth" => fullWidth])} ${...this}>
                        <if ${icon != null && iconPos != TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <if ${textArea}>
                            <textarea ref=${input} class="mdc-text-field__input" id=${"tf" + textFieldId} required=${required} onchange=${function (event) {if(onedit != null) onedit(event.currentTarget.value);}} value=${value}></textarea>
                        <else>
                            <input ref=${input} type=${type} class="mdc-text-field__input" id=${"tf" + textFieldId} pattern=${pattern} required=${required} onchange=${function (event) {if(onedit != null) onedit(event.currentTarget.value);}}/>
                        </if>
                        <if ${label != null}>
                            <label class="mdc-floating-label" htmlFor=${"tf" + textFieldId}>${label}</label>
                        </if>
                        <if ${icon != null && iconPos == TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <div class="mdc-line-ripple"></div>
                    </div>';
    }

    override function viewDidUpdate()
    {
        mdcTextField.valid = invalid != true;
        //if ( value != null)
        //    mdcTextField.value = value;
    }

    override function viewDidMount()
    {
        this.mdcTextField = new MDCTextField(root);
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

@:enum abstract TextFieldIconPos(String) from String to String {
    var Left = "left";
    var Right = "right";
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