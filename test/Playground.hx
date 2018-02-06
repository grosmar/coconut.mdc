package;

import vdom.Attr;
import vdom.VNode;
import coconut.ui.View;
import mdc.MDC;
import mdc.*;
import mdc.TextField.TextFieldHelperText;
import mdc.List.*;
import mdc.List.ListItem;
import mdc.List.ListText;
import mdc.List.ListTextSecondary;
import mdc.List.ListGraphic;
import mdc.List.ListGraphicImage;
import mdc.List.ListMeta;
import mdc.List.ListDivider;
import mdc.TabBar.*;

class Playground
{
    public static function main()
    {
        //MDC.init();
        var view = coconut.Ui.hxx('<TestView />');
        js.Browser.document.getElementById("app").appendChild(view.toElement());
    }



}

class TestView extends View
{
    function render() '
<div class="demo">
    <h1>Normal Buttons</h1>
    <div>
        <Button label="Simple" onclick=${trace("clicked")} />
        <Button label="Dense" dense/>
        <Button label="Compact" compact />
        <Button label="Disabled" disabled />
        <Button label="Unelevated" unelevated />
        <Button label="Icon" icon="favorite" />
    </div>
    <h1>Raised Buttons</h1>
    <div>
        <Button label="Simple" raised onclick=${trace("clicked")} />
        <Button label="Dense" raised dense/>
        <Button label="Compact" raised compact />
        <Button label="Disabled" raised disabled />
        <Button label="Unelevated" raised unelevated />
        <Button label="Icon" raised icon="favorite" />
    </div>

    <h1>Checkbox</h1>
    <div>
        <Checkbox label="Simple" value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        <Checkbox label="Checked" checked />
        <Checkbox label="Indeterminate" indeterminate />
        <Checkbox label="Disabled" disabled />
    </div>

    <h1>TabBar</h1>
    <div class="flex-container">
        <div class="float">
            <TabBar>
                <tab active>Tab1</tab>
                <tab>Tab2</tab>
                <tab>Tab3</tab>
            </TabBar>
        </div>

        <div class="float" >
            <TabBar type=${mdc.TabBar.TabBarMode.Icon}>
                <tab icon="camera" active />
                <tab icon="colorize" />
                <tab icon="edit" />
            </TabBar>
        </div>

        <div class="float">
            <TabBar type=${mdc.TabBar.TabBarMode.IconWithText}>
                <tab icon="camera" active>Tab1</tab>
                <tab icon="colorize">Tab2</tab>
                <tab icon="edit">Tab3</tab>
            </TabBar>
        </div>
    </div>

    <h1>LinearProgress</h1>
    <div class="flex-container">
        <h2>Progress</h2>
        <LinearProgress progress=${0.7} open />
        <h2>Buffer</h2>
        <LinearProgress progress=${0.3} buffer=${0.4} open />
        <h2>Indeterminate</h2>
        <LinearProgress indeterminate open />
        <h2>Reverse</h2>
        <LinearProgress progress=${0.7} reverse open />
        <h2>Reverse indeterminate</h2>
        <LinearProgress indeterminate reverse open />
    </div>

    <h1>List</h1>
    <div class="flex-container">
        <div class="float">
            <h2>Simple list</h2>
            <List>
                <ListItem>Simple item 1</ListItem>
                <ListItem>Simple item 2</ListItem>
                <ListItem>Simple item 3</ListItem>
            </List>
        </div>

        <div class="float">
            <h2>Dense list</h2>
            <List>
                <ListItem>Dense item 1</ListItem>
                <ListItem>Dense item 2</ListItem>
                <ListItem>Dense item 3</ListItem>
            </List>
        </div>
        <div class="float">
            <h2>Interactive list</h2>
            <List>
                <ListItem>
                    <ListGraphic><Icon name=${mdc.Icon.IconName.Folder} /></ListGraphic>
                    Link item with start icon 1
                </ListItem>
                <ListItem>
                    <ListGraphic><Icon name=${mdc.Icon.IconName.Folder} /></ListGraphic>
                    Link item with start icon 2
                </ListItem>
                <ListItem>
                    <ListGraphic><Icon name=${mdc.Icon.IconName.Folder} /></ListGraphic>
                    Link item with start icon 3
                </ListItem>
            </List>
        </div>
        <div class="float">
            <h2>Avatar list (+divider)</h2>
            <List avatarList>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/1.jpg" />
                    Item with start icon 1
                </ListItem>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/2.jpg" />
                    Item with start icon 2
                </ListItem>
                <ListDivider/>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/3.jpg" />
                    Item with start icon 3
                </ListItem>
            </List>
        </div>
        <div class="float">
            <h2>Two line list (+inset divider)</h2>
            <List avatarList twoLine>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/1.jpg" />
                    <ListText>
                        Item title 1
                        <ListTextSecondary>Secondary text 1</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.Icon.IconName.Info} /></ListMeta>
                </ListItem>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/2.jpg" />
                    <ListText>
                        Item title 2
                        <ListTextSecondary>Secondary text 2</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.Icon.IconName.Info} /></ListMeta>
                </ListItem>
                <ListDivider inset />
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/3.jpg" />
                    <ListText>
                        Item title 3
                        <ListTextSecondary>Secondary text 3</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.Icon.IconName.Info} /></ListMeta>
                </ListItem>
            </List>
        </div>
    </div>

    <h1>TextField</h1>
    <div>
        <TextField label="Text input" />
        <TextField label="Boxed input" box />
        <TextField label="Password input" type="password" />
        <TextField label="Icon input" box icon="list" />
        <br/>
        <TextField label="Input with helper" />
        <TextFieldHelperText label="Helper for above" />
        <TextField label="Input with validation" invalid required />
        <TextFieldHelperText label="Error message" validation />
        <TextField label="TextArea" textArea  />
        <br/>
        <TextField label="Text input fullWidth" fullWidth />
        <TextField label="TextArea fullWidth" textArea fullWidth />
    </div>

</div>
    ';
}