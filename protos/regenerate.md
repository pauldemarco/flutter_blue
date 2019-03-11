// Copyright 2017, Paul DeMarco.\
// All rights reserved. Use of this source code is governed by a\
// BSD-style license that can be found in the LICENSE file.

# Generate protobuf files in Dart
1. Get the latest linux protoc compiler (On Mac with brew `brew install protobuf`)
1. Run `pub global activate protoc_plugin`.
You may have the following warning, just follow its instruction
```
Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):

  export PATH="$PATH":"$HOME/.pub-cache/bin"
```
1. Run the following commands from the protos folder `cd ./protos`
```protoc --dart_out=../lib/gen ./flutterblue.proto```
```protoc --objc_out=../ios/gen ./flutterblue.proto```
