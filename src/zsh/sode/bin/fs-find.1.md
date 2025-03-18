# NAME

**sode fs find** - Find source files

# SYNOPSIS

**sode fs find** \[**--help**\]
**sode fs find** *glob pattern* \[*path* …\]

# DESCRIPTION

List filenames matching *glob pattern* in each *path*.  Glob patterns are those compatible with
`find`.

# OPTIONS

  - **--help**
    Show help

# EXIT STATUS

  - 0
    Success

  - 1+
    Invalid command or command failure

# EXAMPLE

## Look up Makefiles in local repositories

```shell
sode fs find 'Makefile' ~/git
```

# SEE ALSO

[*sode(1)*](../sode.1.md), [*fs(1)*](./fs.1.md)

[*sode(7)*](../sode.7.md)
