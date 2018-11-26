package mdc;
import coconut.ui.View;
class Icon extends View
{
    @:attr var className:tink.domspec.ClassName = "";
    @:attr var name:IconName;

    function render()
    '
        <i class=${className.add(["material-icons" => true])} >$name</i>
    ';
}
