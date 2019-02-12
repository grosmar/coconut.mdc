package mdc;
import coconut.ui.View;
import mdc.MDC.MDCChipSet;
import mdc.MDC.MDCChip;


class ChipSet extends View
{
    @:attr var type:ChipSetType = ChipSetType.Default;
    @:attr var children:coconut.ui.Children;
    @:attr var className:tink.domspec.ClassName = "";

    @:ref var root:js.html.Element;

    var mdcChipSet:MDCChipSet;

    function render()
    {
        return @hxx '
        <div ref=${root} class=${className.add(["mdc-chip-set" => true, type => true])} {...this}>
            <for ${child in children}>
                ${child}
            </for>
        </div>
        ';
    };

    override function viewDidMount()
    {
        this.mdcChipSet = new MDCChipSet(root.current);
    }

    override function viewWillUnmount()
    {
        if ( this.mdcChipSet != null )
            this.mdcChipSet.destroy();
    }
}

@:enum abstract ChipSetType(String) to String from String
{
    var Filter:String = "mdc-chip-set--filter";
    var Choice:String = "mdc-chip-set--choice";
    var Default:String = "";

}

class Chip extends View
{
    @:attr var className:tink.domspec.ClassName = "";
    @:attr var label:String;
    @:attr var leadingIcon:IconName = null;
    @:attr var trailingIcon:IconName = null;
    @:attr var filter:Bool = false;
    @:attr var selected:Bool = false;

    @:ref var root:js.html.Element;

    var mdcChip:MDCChip;

    function render()
    '
        <div ref=${root} class=${className.add(["mdc-chip" => true, "mdc-chip--selected" => selected])} tabIndex=${0}>
            <if ${leadingIcon != null}>
                <i class=${"material-icons mdc-chip__icon mdc-chip__icon--leading" + (selected ? " mdc-chip__icon--leading-hidden" : "")}>${leadingIcon}</i>
            </if>
            <if ${filter}>
                <div class="mdc-chip__checkmark" >
                    <!--<svg class="mdc-chip__checkmark-svg" viewBox="-2 -3 30 30">
                        <path class="mdc-chip__checkmark-path" fill="none" stroke="black"
                            d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                    </svg>-->
                </div>
            </if>
            <div class="mdc-chip__text">${label}</div>
            <if ${trailingIcon != null}>
                <i class="material-icons mdc-chip__icon mdc-chip__icon--trailing">${trailingIcon}</i>
            </if>
        </div>
    ';

    override function viewDidMount()
    {
        this.mdcChip = new MDCChip(root.current);
    }

    override function viewWillUnmount()
    {
        if ( this.mdcChip != null )
            this.mdcChip.destroy();
    }
}

