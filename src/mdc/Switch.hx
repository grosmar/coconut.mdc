package mdc;
import coconut.ui.View;
import vdom.VDom.InputAttr;

class Switch extends View
{
    var attributes:InputAttr;
    @:attr var label:String = null;
    @:attr var onchecked:Bool->Void = null;

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
                <vdom.VDom.label htmlFor=${id} class="mdc-switch-label">${label}</vdom.VDom.label>
            </if>
        </div>
        ';
    }
}
