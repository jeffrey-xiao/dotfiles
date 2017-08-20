def FlagsForFile( filename, **kwargs ):
    return {
        'flags': [
            '-x',
            'c++',
            '-Wall',
            '-Wextra',
            '-Werror',
            '-std=c++11',
            '-isystem',
            '/usr/include/c++/6.4.0',
            '-isystem',
            '/usr/include/c++/6.4.0/x86_64-solus-linux',
            '-isystem',
            '/usr/include/c++/6.4.0/backward/',
        ],
    }
