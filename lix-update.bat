echo Updating lix dependencies...
call li#gen4
call lix install gh:MVCoconut/coconut.data
call lix install gh:MVCoconut/coconut.react
call lix install gh:MVCoconut/coconut.ui
call lix install gh:MVCoconut/coconut.vdom
call lix install gh:haxetink/tink_anon
call lix install gh:haxetink/tink_core
call lix install gh:haxetink/tink_csss
call lix install gh:haxetink/tink_domspec
call lix install gh:haxetink/tink_hxx
call lix install gh:haxetink/tink_lang
call lix install gh:haxetink/tink_macro
call lix install gh:haxetink/tink_parse
call lix install gh:haxetink/tink_priority
call lix install gh:haxetink/tink_pure
call lix install gh:haxetink/tink_slice
call lix install gh:haxetink/tink_state
call lix install gh:haxetink/tink_syntaxhub
call vscode-lix-gen --build playground.hxml