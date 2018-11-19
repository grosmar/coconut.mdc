package mdc;

import mdc.MDC.MDCCheckbox;
import coconut.vdom.ClassName;
import coconut.ui.View;

class Checkbox extends View
{
    @:attr var className:ClassName = "";
    @:attr var id:String = null;
    @:attr var label:String = null;
    @:attr var disabled:Bool = null;
    @:attr var checked:Bool = null;
    @:attr var indeterminate:Bool = null;
    @:attr var value:String = null;
    @:attr var onchecked:Bool->Void = null;

    @:ref var root:js.html.Element;

    static var checkboxIndex = 0;
    var checkboxId:UInt = checkboxIndex++;
    var mdcCheckbox:MDCCheckbox;

    static inline var checkSvg = "background-image: url(\"data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath class='mdc-checkbox__checkmark__path' fill='none' stroke='white' d='M1.73,12.91 8.1,19.28 22.79,4.59'/%3E%3C/svg%3E\");";

    //TODO: fix svg support
    function render()
    {
        var checked = this.checked;
        var indeterminate = this.indeterminate;
        var disabled = this.disabled;
        var value = this.value;

        var id:String = this.id == null ? "ch_" + checkboxId : this.id;
        return
            if ( label != null )
                @hxx '<div ref=${root} class=${className.add(["mdc-form-field" => true])} {...this}>
                          <div class="mdc-checkbox">
                              <input type="checkbox"
                                   onchange=${if(onchecked != null) onchecked(event.currentTarget.checked) }
                                   value=${value}
                                   checked=${checked}
                                   class="mdc-checkbox__native-control"
                                   id=${id}
                                   />
                              <div class="mdc-checkbox__background">
                                    <!--<svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                      <path class="mdc-checkbox__checkmark__path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                                    </svg>-->
                                    <div class="mdc-checkbox__mixedmark"></div>
                              </div>
                          </div>

                          <coconut.vdom.Html.label htmlFor=${id}>${label}</coconut.vdom.Html.label>
                    </div>';
            else
                @hxx '<div ref=${root} class="mdc-checkbox" {...this}>
                        <input type="checkbox"
                            value=${value}
                            checked=${checked}
                            onchange=${if(onchecked != null) onchecked(event.currentTarget.checked)}
                            class="mdc-checkbox__native-control"/>
                        <div class="mdc-checkbox__background">
                            <!--<svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                <path class="mdc-checkbox__checkmark__path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                            </svg>-->
                            <div class="mdc-checkbox__mixedmark"></div>
                        </div>
                    </div>';

    }

    override function viewDidMount()
    {
        this.mdcCheckbox = new MDCCheckbox(root);
        setCheckboxProperties();
    }

    override function viewDidUpdate()
    {
        setCheckboxProperties();
    }

    function setCheckboxProperties()
    {
        mdcCheckbox.checked = checked;
        mdcCheckbox.indeterminate = indeterminate;
        mdcCheckbox.disabled = disabled;
        mdcCheckbox.value = value;
    }

    override function viewWillUnmount()
    {
        if ( this.mdcCheckbox != null )
            this.mdcCheckbox.destroy();
    }

    //function svg(attr:{className:ClassName, viewBox:String}, ?children:Children) return h('svg', attr, children);
    //function path(attr:{className:ClassName, fill:String, stroke:String, d:String}, ?children:Children):VNode return h('path', attr, children);

}