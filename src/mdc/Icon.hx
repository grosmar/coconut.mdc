package mdc;
import coconut.ui.View;
import vdom.Attr;
class Icon extends View
{
    @:attr var className:ClassName = "";
    @:attr var name:IconName;

    function render()
    '
        <i class=${className.add(["material-icons" => true])} aria-hidden="true">$name</i>
    ';
}
