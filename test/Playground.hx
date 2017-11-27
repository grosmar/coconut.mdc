package;

import vdom.Attr;
import vdom.VNode;
import coconut.ui.View;
import mdc.List.*;
import mdc.MDC;

class Playground
{
    public static function main()
    {
        //MDC.init();
        var view = new TestView({});
        js.Browser.document.getElementById("app").appendChild(view.toElement());
    }



}

class TestView extends View<{}>
{
    function render() '
        <div>
            <list interactive twoLine>
                <listLinkItem>
                    <listStartIcon>bluetooth</listStartIcon>
                </listLinkItem>
                <listItem >Hey</listItem>
            </list>

            <div class="mdc-radio">
  <input class="mdc-radio__native-control" type="radio" id="radio-1" name="radios" checked />
  <div class="mdc-radio__background">
    <div class="mdc-radio__outer-circle"></div>
    <div class="mdc-radio__inner-circle"></div>
  </div>
</div>
<label id="radio-1-label" htmlFor="radio-1">Radio 1</label>

<div class="mdc-radio">
  <input class="mdc-radio__native-control" type="radio" id="radio-2" name="radios" />
  <div class="mdc-radio__background">
    <div class="mdc-radio__outer-circle"></div>
    <div class="mdc-radio__inner-circle"></div>
  </div>
</div>
<label id="radio-2-label" htmlFor="radio-2">Radio 2</label>

    </div>
    ';
}