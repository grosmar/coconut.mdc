package mdc;

import js.html.DOMElement;
import mdc.MDC.MDCTextField;
import tink.core.Callback;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class TextField extends View<TextFieldAttr>
{
    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;

    var mdcTextField:MDCTextField;


    function render(attr:TextFieldAttr)
    {
        return @hxx '<div class=${attr.className.add(["mdc-text-field" => true,
                                                      "mdc-text-field--disabled" => attr.disabled,
                                                      "mdc-text-field--with-leading-icon" => attr.icon != null,
                                                      "mdc-text-field--box" => attr.box,
                                                      "mdc-text-field--textarea" => attr.textArea,
                                                      "mdc-text-field--fullwidth" => attr.fullWidth])} {...attr}>
                        <if ${attr.icon != null && attr.iconPos != TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${attr.icon}</i>
                        </if>
                        <if ${attr.textArea}>
                            <textarea class="mdc-text-field__input" id=${"tf" + textFieldId} onchange={attr.onchange.invoke(event.target.value)}>${attr.value}</textarea>
                        <else>
                            <input type=${attr.type == null ? "text" : attr.type} class="mdc-text-field__input" id=${"tf" + textFieldId} value=${attr.value} onchange={attr.onchange.invoke(event.target.value)}/>
                        </if>
                        <if ${attr.label != null}>
                            <label class="mdc-text-field__label" htmlFor=${"tf" + textFieldId}>${attr.label}</label>
                        </if>
                        <if ${attr.icon != null && attr.iconPos == TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${attr.icon}</i>
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

typedef TextFieldAttr = {
    @:optional var label(default,never):String;
    @:optional var value(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var icon(default,never):String;
    @:optional var iconPos(default,never):TextFieldIconPos;
    @:optional var box(default,never):Bool;
    @:optional var fullWidth(default,never):Bool;
    @:optional var textArea(default,never):Bool;
    @:optional var type(default,never):String;

	@:optional var id(default, never):String;
	@:optional var className(default, never):ClassName;
	@:optional var onchange(default, never):Callback<String>;
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