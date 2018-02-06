package mdc;
import coconut.ui.View;
import vdom.Attr;
class Icon extends View
{
    var attributes:Attr;
    @:attr var name:IconName;

    function render()
    '
        <i class="material-icons" aria-hidden="true" ${...this}>$name</i>
    ';
}
