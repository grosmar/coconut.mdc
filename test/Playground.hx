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
<div class="demo">
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
    <div class="flex-container">
        <div class="float">
            <h2>Simple list</h2>
            <List>
                <items>
                    <listItem>Simple item 1</listItem>
                    <listItem>Simple item 2</listItem>
                    <listItem>Simple item 3</listItem>
                </items>
            </List>
        </div>
        <div class="float">
            <h2>Interactive list</h2>
            <List interactive>
                <items>
                    <listLinkItem>
                        <listStartIcon>folder</listStartIcon>
                        Link item with start icon 1
                    </listLinkItem>
                    <listLinkItem>
                        <listStartIcon>folder</listStartIcon>
                        Link item with start icon 2
                    </listLinkItem>
                    <listLinkItem>
                        <listStartIcon>folder</listStartIcon>
                        Link item with start icon 3
                    </listLinkItem>
                </items>
            </List>
        </div>
        <div class="float">
            <h2>Avatar list</h2>
            <List avatarList interactive>
                <items>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/1.jpg">folder</listStartImage>
                        Item with start icon 1
                    </listItem>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/2.jpg">folder</listStartImage>
                        Item with start icon 2
                    </listItem>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/3.jpg">folder</listStartImage>
                        Item with start icon 3
                    </listItem>
                </items>
            </List>
        </div>
        <div class="float">
            <h2>Two line list</h2>
            <List avatarList interactive twoLine>
                <items>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/1.jpg">folder</listStartImage>
                        <listItemText>
                            Item title 1
                            <listItemTextSecondary>Secondary text 1</listItemTextSecondary>
                        </listItemText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/2.jpg">folder</listStartImage>
                        <listItemText>
                            Item title 2
                            <listItemTextSecondary>Secondary text 2</listItemTextSecondary>
                        </listItemText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/3.jpg">folder</listStartImage>
                        <listItemText>
                            Item title 3
                            <listItemTextSecondary>Secondary text 3</listItemTextSecondary>
                        </listItemText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                </items>
            </List>
        </div>
    </div>

    <h1>TextField</h1>
    <TextField label="Text input" />
</div>
    ';
}