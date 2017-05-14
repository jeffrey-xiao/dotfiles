def FlagsForFile( filename, **kwargs ):
    return {
        'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' , '-std=c++11', '-isystem', '/home/jeffreyxiao/Documents/source/dcj_testing/includes'],
    }
