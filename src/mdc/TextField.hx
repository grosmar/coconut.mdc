package mdc;

import mdc.MDC.MDCTextField;
import vdom.VNode;
import vdom.Attr;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class TextField extends View<{>Attr, ?label:String, ?value:String, ?disabled:Bool, ?icon:String, ?iconPos:TextFieldIconPos, ?box:Bool}>
{
    static var textFieldIdIndex = 0;
    var textFieldId:UInt = textFieldIdIndex++;


    var handler:MDCTextField;


    function render(data)
    {
        return @hxx '<div class=${data.className.add(["mdc-text-field" => true,
                                                      "mdc-text-field--disabled" => data.disabled,
                                                      "mdc-text-field--with-leading-icon" => data.icon != null,
                                                      "mdc-text-field--box" => data.box])} {...data}>
                        <if ${data.icon != null && data.iconPos != TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${data.icon}</i>
                        </if>
                        <input type="text" class="mdc-text-field__input" id=${"tf" + textFieldId} value=${data.value}/>
                        <label class="mdc-text-field__label" htmlFor=${"tf" + textFieldId}>${data.label}</label>
                        <if ${data.icon != null && data.iconPos == TextFieldIconPos.Right}>
                            <i class="material-icons mdc-text-field__icon">${data.icon}</i>
                        </if>
                        <div class="mdc-text-field__bottom-line"></div>
                    </div>';
    }

    override function afterInit(elem)
    {
        //js.Browser.console.log("init", ind);
        this.handler = new MDCTextField(elem);
        /*handler.listen('MDCTabBar:change', function (data:{detail:MDCTabBar}) {
            if (ontabchangeCB != null )
                ontabchangeCB(handler.activeTabIndex);
        });*/
    }

    override function destroy()
    {
        /*js.Browser.console.log("dest", this.handler != null, ind);

        if ( this.handler != null )
            this.handler.destroy();*/
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