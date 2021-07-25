#!/bin/bash

set -euxo pipefail

source gen-bazel-toolchain

chmod +x bazel
pushd third_party/ijar
../../bazel build --logging=6 --subcommands --verbose_failures --crosstool_top=//bazel_toolchain:toolchain --cpu ${TARGET_CPU} zipper ijar
mkdir -p $PREFIX/bin
cp ../../bazel-out/${TARGET_CPU}-fastbuild/bin/third_party/ijar/ijar $PREFIX/bin
cp ../../bazel-out/${TARGET_CPU}-fastbuild/bin/third_party/ijar/zipper $PREFIX/bin
