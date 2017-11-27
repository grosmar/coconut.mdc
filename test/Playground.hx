package;

import coconut.ui.View;

class Playground
{
    public static function main()
    {
        js.Browser.document.getElementById("app").appendChild(new TestView({}).toElement());
    }


}

class TestView extends View<{}>
{
    function render()
        '<div>Hello</div>';
}