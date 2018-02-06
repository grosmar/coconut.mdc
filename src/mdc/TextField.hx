package mdc;

import vdom.VDom.InputAttr;
import js.html.DOMElement;
import mdc.MDC.MDCTextField;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;

class TextField extends View
{
    var attributes:TextFieldAttr;

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
                            <input type=${type != null ? type : "text"} class="mdc-text-field__input" id=${"tf" + textFieldId} pattern=${pattern} required=${required} onchange=${if(onedit != null) onedit(event.target.value)}/>
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
        mdcTextField.valid = !invalid;
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

typedef TextFieldAttr = {>InputAttr,
    @:optional var label(default,never):String;
    @:optional var value(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var invalid(default,never):Bool;
    @:optional var icon(default,never):String;
    @:optional var iconPos(default,never):TextFieldIconPos;
    @:optional var box(default,never):Bool;
    @:optional var fullWidth(default,never):Bool;
    @:optional var textArea(default,never):Bool;
    @:optional var type(default,never):String;
    @:optional function onedit(value:String):Void;
    @:optional var pattern(default,never):String;
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
    var attributes:TextFieldHelperTextAttr;

    function render()
    '
        <p class=${className.add([ "mdc-text-field-helper-text" => true,
                                   "mdc-text-field-helper-text--persistent" => persistent,
                                   "mdc-text-field-helper-text--validation-msg" => validation])} aria-hidden="true" ${...this} >
            ${label}
        </p>
    ';
}

typedef TextFieldHelperTextAttr = {>Attr,
    var label(default, never):String;
    @:optional var persistent(default, never):Bool;
    @:optional var validation(default, never):Bool;
}