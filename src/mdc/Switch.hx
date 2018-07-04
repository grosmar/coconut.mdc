package mdc;
import coconut.ui.View;
import coconut.vdom.ClassName;

class Switch extends View
{
    @:attr var id:String = null;
    @:attr var checked:Bool = null;
    @:attr var className:ClassName = "";
    @:attr var label:String = null;
    @:attr var value:String = null;
    @:attr var onchecked:Bool->Void = null;
    @:attr var disabled:Bool = null;

    static var switchIndex = 0;
    var switchId:UInt = switchIndex++;

    function render()
    {
        var id = id != null ? id : "switch_" + id;

        return @hxx '
        <div {...this}>
            <div class="mdc-switch">
                <input type="checkbox"
                       id=${id}
                       value=${value}
                       checked=${checked}
                       onchange=${if(onchecked != null) onchecked(event.target.checked) }
                       class="mdc-switch__native-control" disabled=${disabled} />
                <div class="mdc-switch__background">
                    <div class="mdc-switch__knob"></div>
                </div>
            </div>
            <if ${label != null}>
                <coconut.vdom.Html.label htmlFor=${id} class="mdc-switch-label">${label}</coconut.vdom.Html.label>
            </if>
        </div>
        ';
    }
}
