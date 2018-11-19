package mdc;
import coconut.ui.View;
import coconut.vdom.ClassName;
import mdc.MDC.MDCSwitch;

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
    //var mdcSwitch:MDCSwitch;

    function render()
    {
        var id = id != null ? id : "switch_" + switchId;

        return @hxx '
        <span {...this}>
            <div  class=${className.add(["mdc-switch" => true, 
                                         "mdc-switch--disabled" => disabled,
                                         "mdc-switch--checked" => checked])}>
                <div class="mdc-switch__track"></div>            
                <div class="mdc-switch__thumb-underlay">
                    <div class="mdc-switch__thumb">
                        <input type="checkbox"
                                id=${id}
                                value=${value}
                                checked=${checked}
                                onchange=${if(onchecked != null) onchecked(event.currentTarget.checked) }
                                class="mdc-switch__native-control" disabled=${disabled} />
                    </div>
                </div>
            </div>
            <if ${label != null}>
                <coconut.vdom.Html.label htmlFor=${id} class="mdc-switch-label">${label}</coconut.vdom.Html.label>
            </if>
        </span>
        ';
    }

    /*override function viewDidMount(elem)
    {
        mdcSwitch = new MDCSwitch(elem);
    }

    override function viewWillUnmount(elem)
    {
        if ( this.mdcSwitch != null )
        {
            mdcSwitch.destroy();
        }
    }*/
}
