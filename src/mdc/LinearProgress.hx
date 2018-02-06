package mdc;

import mdc.MDC.MDCLinearProgress;
import vdom.Attr;
import coconut.ui.View;
class LinearProgress extends View
{
    var attributes:Attr;
    @:attr var indeterminate:Bool = false;
    @:attr var progress:Float = null;
    @:attr var buffer:Float = null;
    @:attr var reverse:Bool = null;
    @:attr var open:Bool = false;

    var mdcLinearProgress:MDCLinearProgress;

    function render()
    {
        //TODO: temporary hack till v3 resolves update listener
        var intererminate = this.indeterminate;
        var progress = this.progress;
        var buffer = this.buffer;
        var reverse = this.reverse;
        var open = this.open;

        return @hxx '
        <div class=${className.add(["mdc-linear-progress"=>true])} ${...this}>
            <div class="mdc-linear-progress__buffering-dots"></div>
            <div class="mdc-linear-progress__buffer"></div>
            <div class="mdc-linear-progress__bar mdc-linear-progress__primary-bar">
                <span class="mdc-linear-progress__bar-inner"></span>
            </div>
            <div class="mdc-linear-progress__bar mdc-linear-progress__secondary-bar">
                <span class="mdc-linear-progress__bar-inner"></span>
            </div>
        </div>
        ';
    }


    override function afterInit(elem)
    {
        mdcLinearProgress = new MDCLinearProgress(elem);

        setLinearProgress();
    }

    override function afterPatching(elem)
    {
        setLinearProgress();
    }

    function setLinearProgress()
    {
        mdcLinearProgress.determinate = !indeterminate;
        mdcLinearProgress.progress = progress;
        mdcLinearProgress.buffer = buffer;
        mdcLinearProgress.reverse = reverse;

        if ( open == true )
        {
            mdcLinearProgress.open();
        }
        else
        {
            mdcLinearProgress.close();
        }
    }
}