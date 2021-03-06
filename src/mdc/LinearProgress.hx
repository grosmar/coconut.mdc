package mdc;

import mdc.MDC.MDCLinearProgress;
import coconut.ui.View;
import tink.domspec.ClassName;
class LinearProgress extends View
{
    @:attr var className:ClassName = "";
    @:attr var indeterminate:Bool = false;
    @:attr var progress:Float = null;
    @:attr var buffer:Float = null;
    @:attr var reverse:Bool = null;
    @:attr var open:Bool = false;

    @:ref var root:js.html.Element;

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
        <div ref=${root} class=${className.add(["mdc-linear-progress"=>true])} ${...this}>
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


    override function viewDidMount()
    {
        mdcLinearProgress = new MDCLinearProgress(root.current);

        setLinearProgress();
    }

    override function viewDidUpdate()
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