package cmdc;

import coconut.ui.View;
import mdc.TextField;
import js.html.KeyboardEvent;
import tink.domspec.ClassName;

class PasswordTextField extends View
{
    @:attr var className:ClassName = "";
    @:attr var inputClass:ClassName = "";
    @:attr var label:String = null;
    @:attr var defaultValue:String = null;
    @:attr var value:String = null;
    @:attr var disabled:Bool = null;
    @:attr var invalid:Bool = null;
    @:attr var box:Bool = null;
    @:attr var fullWidth:Bool = null;
    @:attr var textArea:Bool = null;
    @:attr var maxLength:Int = null;
    @:attr var onChange:String->Void = null;
    @:attr var pattern:String = null;
    @:attr var required:Bool = false;
    @:attr var onkeydown:coconut.react.ReactEvent<js.html.Element,KeyboardEvent>->Void = null;

    @:ref var input:TextField;
    @:state var type:String = "password";


    function render()
    {
        return @hxx '<TextField ref=${input} ${...this} trailingIcon=${type == "password" ? mdc.IconName.Visibility : mdc.IconName.VisibilityOff} onTrailingIconMouseDown=${type="input"} onTrailingIconMouseUp=${type="password"} />';
    }

}
