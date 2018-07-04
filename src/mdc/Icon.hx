package mdc;
import coconut.ui.View;
class Icon extends View
{
    @:attr var className:coconut.vdom.ClassName = "";
    @:attr var name:IconName;

    function render()
    '
        <i class=${className.add(["material-icons" => true])} aria-hidden="true">$name</i>
    ';
}
