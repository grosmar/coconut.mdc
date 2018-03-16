package mdc;

import js.html.KeyboardEvent;
import js.html.Element;
import js.html.MouseEvent;
import tink.core.Callback;
import vdom.VDom.InputAttr;
import js.html.DOMElement;
import mdc.MDC.MDCTextField;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;

class TextField extends View
{
    @:attr var className:ClassName = "";
    @:attr var label:String = null;
    @:attr var value:String = null;
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
    @:attr var onkeydown:Callback<EventFrom<KeyboardEvent, Element>> = null;

    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;

    var mdcTextField:MDCTextField;



    function render()
    {
        var invalid = this.invalid; //TODO: remove after fixing referencing issue
        var value = this.value; //TODO: remove after fixing referencing issue

        return @hxx '<div class=${className.add(["mdc-text-field" => true,
                                                      "mdc-text-field--disabled" => disabled,
                                                      "mdc-text-field--with-leading-icon" => icon != null,
                                                      "mdc-text-field--box" => box,
                                                      "mdc-text-field--textarea" => textArea,
                                                      "mdc-text-field--fullwidth" => fullWidth])} {...this}>
                        <if ${icon != null && iconPos != TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <if ${textArea}>
                            <textarea class="mdc-text-field__input" id=${"tf" + textFieldId} required=${required} onchange=${if(onedit != null) onedit(event.target.value)}>${value}</textarea>
                        <else>
                            <input type=${type} class="mdc-text-field__input" id=${"tf" + textFieldId} pattern=${pattern} required=${required} onchange=${if(onedit != null) onedit(event.target.value)}/>
                        </if>
                        <if ${label != null}>
                            <vdom.VDom.label class="mdc-text-field__label" htmlFor=${"tf" + textFieldId}>${label}</vdom.VDom.label>
                        </if>
                        <if ${icon != null && iconPos == TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <div class="mdc-line-ripple"></div>
                    </div>';
    }

    override function afterPatching(elem)
    {
        //mdcTextField.valid = invalid != true;
        if ( value != null)
            mdcTextField.value = value;
    }

    override function afterInit(elem:DOMElement)
    {
        this.mdcTextField = new MDCTextField(elem);
    }

    override function beforeDestroy(elem)
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
                                   "mdc-text-field-helper-text--validation-msg" => validation])} aria-hidden="true" ${...this} >
            ${label}
        </p>
    ';
}