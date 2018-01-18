package mdc;

import js.html.DOMElement;
import mdc.MDC.MDCTextField;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class TextField extends View
{
    var attributes:TextFieldAttr;
    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;

    var mdcTextField:MDCTextField;


    function render()
    {
        return @hxx '<div class=${attr.className.add(["mdc-text-field" => true,
                                                      "mdc-text-field--disabled" => disabled,
                                                      "mdc-text-field--with-leading-icon" => icon != null,
                                                      "mdc-text-field--box" => box,
                                                      "mdc-text-field--textarea" => textArea,
                                                      "mdc-text-field--fullwidth" => fullWidth])} {...attr}>
                        <if ${icon != null && iconPos != TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <if ${textArea}>
                            <textarea class="mdc-text-field__input" id=${"tf" + textFieldId}>${value}</textarea>
                        <else>
                            <input type="text" class="mdc-text-field__input" id=${"tf" + textFieldId} value=${value}/>
                        </if>
                        <if ${label != null}>
                            <label class="mdc-text-field__label" htmlFor=${"tf" + textFieldId}>${label}</label>
                        </if>
                        <if ${icon != null && iconPos == TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${icon}</i>
                        </if>
                        <div class="mdc-text-field__bottom-line"></div>
                    </div>';
    }

    override function afterInit(elem:DOMElement)
    {
        this.mdcTextField = new MDCTextField(elem);
    }

    override function destroy()
    {
        if ( this.mdcTextField != null )
            this.mdcTextField.destroy();
    }
}

typedef TextFieldAttr = {>Attr,
    @:optional var label(default,never):String;
    @:optional var value(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var icon(default,never):String;
    @:optional var iconPos(default,never):TextFieldIconPos;
    @:optional var box(default,never):Bool;
    @:optional var fullWidth(default,never):Bool;
    @:optional var textArea(default,never):Bool;
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