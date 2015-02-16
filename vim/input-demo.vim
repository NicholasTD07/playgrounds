function! InputDemo()
    echom g:rspec_command." --tags ".input('tags: ')
endfunction

function! DefaultArgs(foo, ...)
    echom a:foo.a:1
endfunction
