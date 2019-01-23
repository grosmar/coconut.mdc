package mdc;

import js.html.MouseEvent;
import tink.domspec.ClassName;
import mdc.MDC.MDCIconButtonToggle;
import coconut.ui.View;

class IconButton extends View
{
    @:attr var className:ClassName = "";
    @:attr var onclick:coconut.react.ReactEvent<js.html.ButtonElement,MouseEvent>->Void = null;
    @:attr var onToggle:Bool->Void = null;
    @:attr var disabled:Bool = false;
    @:attr var icon:String = null;
    @:attr var ripple:Bool = true;
    @:attr var toggledIcon:String = null;
    @:attr var toggled:Bool = false;
    var mdcIconButtonToggle:MDCIconButtonToggle = null;

    @:ref var root:js.html.ButtonElement;

    function render()
    {
        return @hxx '<button ref=${root} class=${className.add(["mdc-icon-button" => true,
                                                                "material-icons" => toggledIcon == null,
                                                                "mdc-ripple-surface" => ripple])}
                             {...this}>
            <if ${toggledIcon != null}>
                <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">${toggledIcon}</i>
                <i class="material-icons mdc-icon-button__icon">${icon}</i>
            <else>
                ${icon}
            </if>
        </button>';
    }

    override function viewDidMount()
    {
        this.mdcIconButtonToggle = new MDCIconButtonToggle(root.current);
        mdcIconButtonToggle.listen("MDCIconButtonToggle:change", function(event:{detail:{isOn:Bool}}) if (onToggle != null) onToggle(event.detail.isOn));
        if ( toggled != this.mdcIconButtonToggle.on)
            this.mdcIconButtonToggle.on = toggled;
    }

    override function viewDidUpdate()
    {
        if ( toggled != this.mdcIconButtonToggle.on)
            this.mdcIconButtonToggle.on = toggled;
    }

    override function viewWillUnmount()
    {
        if ( this.mdcIconButtonToggle != null )
            this.mdcIconButtonToggle.destroy();
    }
}