# pman0214/toppers_asp-h8300

> TOPPERS/ASP on H8/300 Development Environment

[![Docker Build](https://img.shields.io/docker/cloud/automated/pman0214/toppers_asp-h8300.svg)](https://hub.docker.com/r/pman0214/toppers_asp-h8300/)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Content](#content)
- [License](#license)

## Install

```bash
docker pull pman0214/toppers_asp-h8300
```

## Usage

[TOPPERS/ASP](https://www.toppers.jp) is installed at ``/asp``.
Default WORKDIR is ``/app``.

Generate sample files and modify to make your application.

```bash
$ docker run --rm -it -v $PWD:/app pman0214/toppers_asp-h8300 '../asp/configure -T akih8_3069f_gcc'
```

Then build the application.

```bash
$ docker run --rm -it -v $PWD:/app pman0214/toppers_asp-h8300 'make asp.bin'
```

## Content

This docker image is based on [pman0214/h8300-elf-gcc-alpine](https://hub.docker.com/r/pman0214/h8300-elf-gcc-alpine).
The image installs:

* boost 1.72.0
* make 4.3
* perl 5.30.3
* toppers asp kernel 1.7.0
* toppers asp H8/300H architecture/gcc dependent package

## License

This Docker image is released under the BSD 3-clause license.
See ``LICENSE.txt``.

* Copyright (c) 2020 Shigemi ISHIDA
