package;

import coconut.ui.View;
import mdc.MDC;
import mdc.*;
import mdc.TextField.TextFieldHelperText;
import mdc.List.ListItem;
import mdc.List.ListText;
import mdc.List.ListTextPrimary;
import mdc.List.ListTextSecondary;
import mdc.List.ListGraphic;
import mdc.List.ListGraphicImage;
import mdc.List.ListMeta;
import mdc.List.ListDivider;
import mdc.TabBar.Tab;
import mdc.Toolbar;
import mdc.Icon;
import cmdc.*;

class Playground
{
    public static function main()
    {
        MDC.init();
        var view = coconut.Ui.hxx('<TestView />');
        //view.renderInto(js.Browser.document.getElementById("app"));
        react.ReactDOM.render(view, js.Browser.document.getElementById("app"));
    }



}

/*class TestView extends View
{

    @:state var activeTab:Int = 2;
    @:state var activeTab2:Int = 1;
    @:state var dynamicTabBar:Int = 2;


    function render() '
        <div class="demo" onclick=${test}>Hali</div>';


    function test(e:JsEvent):Void
    {
        trace(e.clientX);
    }

}

typedef JsEvent = tink.domspec.EventFrom<xdom.Wrapped<js.html.Element>, js.html.MouseEvent>;*/

class TestView extends View
{

    @:state var activeTab:Int = 2;
    @:state var activeTab2:Int = 1;
    @:state var dynamicTabBar:Int = 2;

    @:ref var myInput:TextField;
    @:state var myInputValue:String = "Default";

    function render() '
<div class="demo">
    <h1>Normal Buttons</h1>
    <div>
        <Button label="Simple" onclick=${trace("clicked")} />
        <Button label="Dense" dense/>
        <Button label="Disabled" disabled />
        <Button label="Unelevated" unelevated />
        <Button label="Icon" icon="favorite" />
    </div>
    <h1>Raised Buttons</h1>
    <div>
        <Button label="Simple" raised onclick=${trace("clicked")} />
        <Button label="Dense" raised dense/>
        <Button label="Disabled" raised disabled />
        <Button label="Unelevated" raised unelevated />
        <Button label="Icon" raised icon="favorite" />
    </div>
    <h1>Icon Buttons</h1>
    <div>
        <IconButton icon="favorite" onclick=${trace("clicked")} />
        <IconButton icon="favorite_border" toggledIcon="favorite" onclick=${trace("clicked")} />
        <IconButton icon="favorite_border" toggledIcon="favorite" toggled=${true} onToggle=${trace("toggled", event)} />
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
            <TabBar ontabchange=${function(e) {trace(activeTab, e); activeTab=e;}} activeTabIndex=${activeTab}>
                <Tab active>Tab1</Tab>
                <Tab>Tab2</Tab>
                <Tab>Tab3</Tab>
            </TabBar>
        </div>

        <div class="float" >
            <TabBar>
                <Tab icon="camera" active />
                <Tab icon="colorize" />
                <Tab icon="edit" />
            </TabBar>
        </div>

        <div class="float">
            <TabBar>
                <Tab icon="camera" active>Tab1</Tab>
                <Tab icon="colorize">Tab2</Tab>
                <Tab icon="edit">Tab3</Tab>
            </TabBar>
        </div>

        <div >
            <TabBar activeTabIndex=${activeTab2} ontabchange=${function(e) {activeTab2=e;}}>
                <for ${i in 0...dynamicTabBar}>
                    <Tab active=${i==0}>${"Tab" + Std.string(i+1)}</Tab>
                </for>
            </TabBar>
            <Button label="Add tab" class="float" raised onclick=${dynamicTabBar++} />
            <Button label="Del tab" class="float" raised onclick=${function(e) {dynamicTabBar--; if ( activeTab2 >= dynamicTabBar ) activeTab2--;}} />
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
                    <ListGraphic><Icon name=${mdc.IconName.Folder} /></ListGraphic>
                    Link item with start icon 1
                </ListItem>
                <ListItem>
                    <ListGraphic><Icon name=${mdc.IconName.Folder} /></ListGraphic>
                    Link item with start icon 2
                </ListItem>
                <ListItem>
                    <ListGraphic><Icon name=${mdc.IconName.Folder} /></ListGraphic>
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
                        <ListTextPrimary>Item title 1</ListTextPrimary>
                        <ListTextSecondary>Secondary text 1</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.IconName.Info} /></ListMeta>
                </ListItem>
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/2.jpg" />
                    <ListText>
                        <ListTextPrimary>Item title 2</ListTextPrimary>
                        <ListTextSecondary>Secondary text 2</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.IconName.Info} /></ListMeta>
                </ListItem>
                <ListDivider inset />
                <ListItem>
                    <ListGraphicImage src="https://randomuser.me/api/portraits/women/3.jpg" />
                    <ListText>
                        <ListTextPrimary>Item title 3</ListTextPrimary>
                        <ListTextSecondary>Secondary text 3</ListTextSecondary>
                    </ListText>
                    <ListMeta><Icon name=${mdc.IconName.Info} /></ListMeta>
                </ListItem>
            </List>
        </div>
    </div>

    <h1>Radio</h1>
    <div>
        <Radio label="Simple" name="simple-set" value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        <Radio label="Checked" name="simple-set" checked />
        <Radio label="Disabled" name="simple-set" disabled />
    </div>

    <h1>Switch</h1>
    <div>
        <div class="float">
            <Switch value="nolabel" onchecked=${checked => {trace("checked:", checked);}} />
        </div>
        <div class="float">
            <Switch label="Label" value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        </div>
        <div class="float">
            <Switch label="Checked" checked value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        </div>
        <div class="float">
            <Switch label="Disabled" disabled value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        </div>
        <div class="float">
            <Switch label="Checked&Disabled" checked disabled value="simple" onchecked=${checked => {trace("checked:", checked);}} />
        </div>
    </div>

    <h1>TextField</h1>
    <div>
        <TextField label="Text input" />
        <TextField label="Boxed input" box />
        <TextField label="Password input" type="password" />
        <TextField label="Leading Icon" box leadingIcon=${IconName.List} />
        <TextField label="Trailing Icon" box trailingIcon=${IconName.List} />
        <TextField label="Lead&Trailing Icon" box leadingIcon=${IconName.List} trailingIcon=${IconName.Visibility} />
        <TextField label="Default Controlled input" defaultValue="something..." ref=${myInput} value=${myInputValue} onChange=${function(e) { myInputValue = e; trace(e == "333"); if(e == "333") myInputValue="";}} />
        <TextField label="Default Uncontrolled input" defaultValue="something..." />
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

    <h1>Toolbar</h1>
    <div>
        <Toolbar>
            <ToolbarRow>
                <ToolbarSection align=${ToolbarSectionAlign.Start}>
                    <ToolbarMenuIcon name=${mdc.IconName.Menu} onclick=${function(e){}} />
                </ToolbarSection>
                <ToolbarSection>
                    <ToolbarTitle>Toolbar title</ToolbarTitle>
                </ToolbarSection>
                <ToolbarSection align=${ToolbarSectionAlign.End}>
                    <ToolbarIcon name=${mdc.IconName.Person} />
                </ToolbarSection>
            </ToolbarRow>
        </Toolbar>
    </div>

    <h1>Non-native components</h1>
    <div>
        <PasswordTextField label="Password TextField" />
        <InfiniteScroll onscrollbottom=${trace("scrollbottom")} onscrolltop=${trace("scrolltop")}>
            <div>Hello it should be a long text</div>
        </InfiniteScroll>
    </div>
</div>
    ';
}