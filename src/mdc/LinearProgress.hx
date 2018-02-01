package mdc;

import mdc.MDC.MDCLinearProgress;
import vdom.Attr;
import coconut.ui.View;
class LinearProgress extends View<LinearProgressAttr>
{
    var mdcLinearProgress:MDCLinearProgress;

    function render()
    '
        <div class=${data.className.add(["mdc-linear-progress mdc-linear-progress--indeterminate"=>true])} {...data}>
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
        mdcLinearProgress.determinate = data.determinate;
        mdcLinearProgress.progress = data.progress;
        mdcLinearProgress.buffer = data.buffer;
        mdcLinearProgress.reverse = data.reverse;

        if ( data.open == true )
        {
            mdcLinearProgress.open();
        }
        else
        {
            mdcLinearProgress.close();
        }
    }
}

typedef LinearProgressAttr = {>Attr,
    @:optional var determinate(default,never):Bool;
    @:optional var progress(default,never):Float;
    @:optional var buffer(default,never):Float;
    @:optional var reverse(default,never):Bool;
    @:optional var open(default,never):Bool;
}