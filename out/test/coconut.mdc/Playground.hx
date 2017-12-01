package;

import vdom.Attr;
import vdom.VNode;
import coconut.ui.View;
import mdc.MDC;
import mdc.*;
import mdc.List.*;
import mdc.TabBar.*;
import mdc.TabBar.TabBarType;

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
    </div>

    <h1>Raised Buttons</h1>
    <div>
        <Button label="Simple" raised onclick={trace("clicked")} />
        <Button label="Dense" raised dense/>
        <Button label="Compact" raised compact />
        <Button label="Disabled" raised disabled />
        <Button label="Unelevated" raised unelevated />
        <Button label="Icon" raised icon="favorite" />
    </div>

    <h1>TabBar</h1>
    <div class="flex-container">
        <div class="float">
            <TabBar>
                <tabs>
                    <tab active>Tab1</tab>
                    <tab>Tab2</tab>
                    <tab>Tab3</tab>
                </tabs>
            </TabBar>
        </div>

        <div class="float" >
            <TabBar type={TabBarType.Icon}>
                <tabs>
                    <tab icon="camera" active />
                    <tab icon="colorize" />
                    <tab icon="edit" />
                </tabs>
            </TabBar>
        </div>

        <div class="float">
            <TabBar type={TabBarType.IconWithText}>
                <tabs>
                    <tab icon="camera" active>Tab1</tab>
                    <tab icon="colorize">Tab2</tab>
                    <tab icon="edit">Tab3</tab>
                </tabs>
            </TabBar>
        </div>
    </div>


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
            <h2>Dense list</h2>
            <List>
                <items>
                    <listItem>Dense item 1</listItem>
                    <listItem>Dense item 2</listItem>
                    <listItem>Dense item 3</listItem>
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
            <h2>Avatar list (+divider)</h2>
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
                    <listDivider/>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/3.jpg">folder</listStartImage>
                        Item with start icon 3
                    </listItem>
                </items>
            </List>
        </div>
        <div class="float">
            <h2>Two line list (+inset divider)</h2>
            <List avatarList interactive twoLine>
                <items>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/1.jpg">folder</listStartImage>
                        <listText>
                            Item title 1
                            <listTextSecondary>Secondary text 1</listTextSecondary>
                        </listText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/2.jpg">folder</listStartImage>
                        <listText>
                            Item title 2
                            <listTextSecondary>Secondary text 2</listTextSecondary>
                        </listText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                    <listDivider inset />
                    <listItem>
                        <listStartImage src="https://randomuser.me/api/portraits/women/3.jpg">folder</listStartImage>
                        <listText>
                            Item title 3
                            <listTextSecondary>Secondary text 3</listTextSecondary>
                        </listText>
                        <listEndIcon>info</listEndIcon>
                    </listItem>
                </items>
            </List>
        </div>
    </div>

    <h1>TextField</h1>
    <div>
        <TextField label="Text input" />
        <TextField label="Boxed input" box />
        <TextField label="Icon input" box icon="list" />
        <TextField label="Textarea" textArea  />
        <br/>
        <TextField label="Text fullWidth" fullWidth />
        <TextField label="Textarea fullWidth" textArea fullWidth />
    </div>
</div>
    ';
}