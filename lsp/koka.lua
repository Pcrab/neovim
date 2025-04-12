return {
    cmd = { 'koka', '--language-server', '--lsstdio' },
    filetypes = { 'koka' },
    single_file_support = true,
    root_markers = {
        '.git',
    },
}
