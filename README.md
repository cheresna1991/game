Godot Engine allows to write unit tests directly in C++.
https://github.com/doctest/doctest
```cpp
#define TEST_STRING_H
#define TEST_STRING_H
#include "tests/test_macros.h"

namespace TestString { // namespace TestString
	TEST_CASE("[String] Hello World!") {
		String hello = "Hello World!";
		CHECK(hello == "Hello World!");
	}
} 

#endif // TEST_STRING_H
```
<ul>MESSAGE - Prints a message.</ul>
<ul>FAIL_CHECK - Marks the test as failing, but continue the execution. Can be wrapped in conditionals for complex checks.</ul>
<ul>FAIL - Fails the test immediately. Can be wrapped in conditionals for complex checks.</ul>

<ul>SIGNAL_WATCH(object, "signal_name") - Starts watching the specified signal on the given object.</ul>
<ul>SIGNAL_CHECK("signal_name", Vector<Vector<Variant>>) - Checks the arguments of all fired signals. The outer vector contains each fired signal, while the inner vector contains the list of arguments for that signal. The order of signals is significant.</ul>
<ul>SIGNAL_CHECK_FALSE("signal_name") - Checks if the specified signal was not fired.</ul>

```
./bin/<godot_binary> --test
```
