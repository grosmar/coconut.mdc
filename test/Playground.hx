package;

import vdom.Attr;
import vdom.VNode;
import coconut.ui.View;
import mdc.MDC;
import mdc.*;
import mdc.List.*;
import mdc.TabBar.*;
import mdc.Button.ButtonIconPos;

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
        <div style="margin:20px">
            <h1>Normal Buttons</h1>
            <div>
                <Button label="Simple" onclick={trace("clicked")} />
                <Button label="Dense" dense/>
                <Button label="Compact" compact />
                <Button label="Disabled" disabled />
                <Button label="Unelevated" unelevated />
                <Button label="Icon" icon="favorite" />
                <Button label="Icon right" icon="favorite" iconPos={ButtonIconPos.Right} />
            </div>
            <h1>Raised Buttons</h1>
            <div>
                <Button label="Simple" raised onclick={trace("clicked")} />
                <Button label="Dense" raised dense/>
                <Button label="Compact" raised compact />
                <Button label="Disabled" raised disabled />
                <Button label="Unelevated" raised unelevated />
                <Button label="Icon" raised icon="favorit" />
                <Button label="Icon right" raised icon="favorite" iconPos={ButtonIconPos.Right} />
            </div>

            <h1>TabBar</h1>
            <TabBar>
                <tabs>
                    <tab active>Tab1</tab>
                    <tab>Tab2</tab>
                    <tab>Tab3</tab>
                </tabs>
            </TabBar>

            <h1>List</h1>
            <list interactive twoLine>
                <listLinkItem>
                    <listStartIcon>folder</listStartIcon>
                    Some element
                </listLinkItem>
                <listLinkItem>
                    <listStartIcon>folder</listStartIcon>
                    Some element 2
                </listLinkItem>
                <listLinkItem>
                    <listStartIcon>folder</listStartIcon>
                    Some element 3
                </listLinkItem>
                <listItem >Element without icon</listItem>
            </list>

            <h1>TextField</h1>
            <TextField label="Text input" />
        </div>
    ';
}