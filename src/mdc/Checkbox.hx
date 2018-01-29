package mdc;

import mdc.MDC.MDCCheckbox;
import vdom.Attr;
import vdom.VNode;
import vdom.VDom.*;
import coconut.ui.View;
//import coconut.Ui.hxx;

class Checkbox extends View<CheckboxAttr>
{
    var mdcCheckbox:MDCCheckbox;

    static inline var checkSvg = "background-image: url(\"data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath class='mdc-checkbox__checkmark__path' fill='none' stroke='white' d='M1.73,12.91 8.1,19.28 22.79,4.59'/%3E%3C/svg%3E\");";

    //TODO: fix svg support
    function render(attr:CheckboxAttr)
    {
        return
            if ( attr.label != null )
                @hxx '<div class=${attr.className.add(["mdc-form-field" => true])} {...attr}>
                          <div class="mdc-checkbox">
                              <input type="checkbox"
                                   onchange=${attr.onchecked(event.target.checked)}
                                   value=${attr.value}
                                   checked=${attr.checked}
                                   class="mdc-checkbox__native-control"/>
                              <div class="mdc-checkbox__background">
                                  <raw content=${'<svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                      <path class="mdc-checkbox__checkmark__path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                                  </svg>'} />
                            <div class="mdc-checkbox__mixedmark"></div>
                              </div>
                          </div>

                          <label htmlFor="my-checkbox">${attr.label}</label>
                    </div>';
            else
                @hxx '<div class="mdc-checkbox" {...attr}>
                      <input type="checkbox"
                             value=${attr.value}
                             checked=${attr.checked}
                             onchange=${attr.onchecked(event.target.checked)}
                             class="mdc-checkbox__native-control"/>
                      <div class="mdc-checkbox__background">
                        <raw content=${'<svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                                      <path class="mdc-checkbox__checkmark__path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                                  </svg>'} />
                        <div class="mdc-checkbox__mixedmark"></div>
                      </div>
                    </div>';

    }

    static function svg(?attr:SvgAttr, ?children:Children):VNode return h('svg', attr, children);

    static function path(?attr:PathAttr, ?children:Children):VNode return h('path', attr, children);

    override function afterInit(elem)
    {
        this.mdcCheckbox = new MDCCheckbox(elem);
    }

    override function destroy()
    {
        if ( this.mdcCheckbox != null )
            this.mdcCheckbox.destroy();
    }
}

typedef CheckboxAttr = {>Attr,
    @:optional var label(default,never):String;
    @:optional var disabled(default,never):Bool;
    @:optional var checked(default,never):Bool;
    @:optional var indeterminate(default,never):Bool;
    @:optional var value(default,never):String;
    @:optional function onchecked(checked:Bool):Void;
}

typedef SvgAttr = {>Attr,
    @:optional var xmlns:String;
    @:optional var externalResourcesRequired:Bool;
    @:optional var version:Float;
    @:optional var baseProfile:SvgBaseProfile;
    @:optional var width:Float;
    @:optional var height:Float;
    @:optional var preserveAspectRatio:String;
    @:optional var contentScriptType:String;
    @:optional var contentStyleType:String;
    @:optional var viewBox:String;
}

typedef PathAttr = {>Attr,
    @:optional var transform:String;
    @:optional var externalResourcesRequired:Bool;
    @:optional var d:String;
    @:optional var pathLength:Float;
    @:optional var fillOpacity:Float;

    @:optional var fill:String;
    @:optional var stroke:String;
}

@:enum abstract SvgBaseProfile(String)
{
    var None = "none";
    var Full = "full";
    var Basic = "basic";
    var Tiny = "tiny";
}