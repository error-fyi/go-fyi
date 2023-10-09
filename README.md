<!-- markdownlint-configure-file {
  "MD013": {
    "code_blocks": false,
    "tables": false
  },
  "MD033": false,
  "MD041": false
} -->

<a name="readme-top"></a>

<div align="center">

[![GitHub release](https://img.shields.io/github/v/release/error-fyi/go-fyi?color=green&style=for-the-badge)](https://github.com/error-fyi/go-fyi/releases)
[![Nix Devshell](https://img.shields.io/badge/nix-devshell-blue?logo=NixOS&style=for-the-badge)](https://github.com/error-fyi/go-fyi)
[![Continuous Integration](https://img.shields.io/github/actions/workflow/status/tfadeyi/errors/ci.yml?branch=main&style=for-the-badge)](https://github.com/error-fyi/go-fyi/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/License-MIT-yellowgreen.svg?style=for-the-badge)](https://github.com/tfadeyi/errors/blob/main/LICENSE)
[![Language](https://img.shields.io/github/go-mod/go-version/error-fyi/go-fyi?style=for-the-badge)](https://github.com/error-fyi/go-fyi)
[![Go Report Card](https://goreportcard.com/badge/github.com/error-fyi/go-fyi?style=for-the-badge)](https://goreportcard.com/report/github.com/error-fyi/go-fyi)


# go-fyi

<p align="center">

<a href="https://docs.error.fyi"><strong>Explore the docs »</strong></a>

**error.fyi's** Golang client library. It is used to wrap errors and add extra context when the error is returned.

<a href="#Installation">**Installation**</a>
·
<a href="https://docs.error.fyi/docs/intro">**Get Started**</a>
·
<a href="https://docs.error.fyi/docs/libraries/go">**Reference**</a>
·
<a href="https://github.com/error-fyi/go-fyi/issues">**Report Bug**</a>


</p>

</div>

---

# Usage

See [Get Started](https://docs.error.fyi/docs/intro) for more information on generating the `error.yaml`.

```go
package main

import (
  "errors"
  "log"
  _"embed"

  fyi "github.com/error-fyi/go-fyi"
)

//go:embed errors.yaml
var errorsYAML []byte

// @fyi name example-app
// @fyi title Example App
// @fyi base_url docs.example.com
// @fyi version v0.1.0
func main() {
  fyi.SetManifest(errorsYAML)
  err := doSomething()
  if err != nil {
    log.Fatal(err)
  }
}

func doSomething() error {
  // TODO improve this error message
  err := errors.New("something went wrong, please try again")
  // @fyi.error code main_error_18
  // @fyi.error title Transaction Error
  // @fyi.error short There was an error during transaction, value exceeded limit
  // @fyi.error severity low
  // @fyi.error.suggestion short Retry the transaction with a lower input value
  return fyi.Error(err, "main_error_18")
}
```

Output:

```shell
$ go run main.go
2023/10/03 22:46:12 [something went wrong, please try again]

   TRANSACTION ERROR                                                          
                                                                              
  ## What caused the error                                                    
                                                                              
  There was an error during transaction, value exceeded limit                 
                                                                              
  ## Quick Solutions                                                          
                                                                              
  │ Additional information is available at: docs.example.com/example-          
  │ app/errors/main_error_18                                                   
                                                                              
  • Suggestion: Retry the transaction with a lower input value                

exit status 1
```

# Installation

```shell
go get -u github.com/error-fyi/go-fyi
```
