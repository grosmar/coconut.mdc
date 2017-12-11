package;

import tink.state.Observable;
import haxe.Timer;
import tink.state.State;
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
    static var model:TestModel;

    public static function main()
    {
        model = new TestModel({});
        var view = new TestView({model: model});
        js.Browser.document.getElementById("app").appendChild(view.toElement());

        var _ownUserId = new State("");
        var ownUserId:Observable<String> = _ownUserId;

        ownUserId.nextTime(function (v) return v != "").handle( function (v){
            sync();
        });

        Timer.delay( function() _ownUserId.set("1"), 2000);

    }

    static function sync()
    {
        trace("asdasd");
        for ( i in 0...50)
            model.addNotification({unread:Math.random() > 0.5});
    }

}

class TestView extends View<{model:TestModel}>
{
    function render() '
<div class="demo" key={model}>

    <div class="flex-container" key={model}>
        <div class="float" key={model.keyt1}>
            <TabBar ontabchange={function (index) model.activeTabIndex = index} key={model.keyt2}>
                <tabs>
                    <tab active key={model.keyte1}>{model.notificationCount}</tab>
                    <tab key={model.keyte2}>Tab2</tab>
                    <tab key={model.keyte3}>Tab3</tab>
                </tabs>
            </TabBar>
        </div>
    </div>

    <div key={model.key0}>
        <div key={model.key1} style={"border: 1px solid black; display:" + (model.activeTabIndex == 0 ? "block" : "none")}>Tab content 1...</div>
        <div key={model.key2} style={"border: 1px solid black; display:" + (model.activeTabIndex == 1 ? "block" : "none")}>Tab content 2...</div>
        <div key={model.key3} style={"border: 1px solid black; display:" + (model.activeTabIndex == 2 ? "block" : "none")}>Tab content 3...</div>
    </div>

</div>
    ';
}