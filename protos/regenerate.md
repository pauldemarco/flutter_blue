// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

# Generate protobuf files in Dart
1. Get the latest linux protoc compiler from https://github.com/google/protobuf/releases/tag/v3.4.0
2. Get the latest dart-protoc-plugin from https://github.com/dart-lang/dart-protoc-plugin
3. Make sure protoc + protoc-gen-dart + dart bins are all in the same path
4. Run the following command from the protos folder
```protoc --dart_out=../lib/gen ./flutterblue.proto```