# What you should Know about Automated Testing

## Introduction

<a href="http://en.wikipedia.org/wiki/Test_automation">Automated testing</a>
is a software engineering method in which one writes pieces of code, which
in turn help us ascertain that the production code itself is functioning
correctly. This document provides an introduction to automated software testing.

## Motivation

So why do we want to perform automated software testing? The
first reason is to **prevent bugs**. By writing tests before we write the
production code itself (so-called <b>Test-First Development</b>) we ascertain
that the production code behaves according to the specification given in the
tests. That way, bugs that could occur, if the code was deployed right away, or
tested only manually, would be prevented.

Another reason is to make sure that bugs and regressions are **not
reintroduced** in the code-base.  Say we have a bug, and we write a meaningful
test that fails when the bug is still in the code, and only then fix the bug.
In that case, we can re-use the test in the future to make sure the bug is not
present in the current version of the code. If the bug re-surfaces in a certain
variation, then it will likely be caught by the test.

Finally, by writing tests we provide **specifications** to the code and even
some form of API documentation, as well as examples of what we want the code
to achieve. This causes less duplication than writing separate specification
documents and examples, and, furthermore, is validated to be functional
because we actually run it.

## An example

Let's suppose we want to write a [function](https://en.wikipedia.org/wiki/Subroutine) that adds two numbers. In pseudocode, we can write:

```
function add(first_number, second_number)
{
    return 4;
}
```

We can write a test for it similar to:

```
assert_equal(add(2, 2), 4, "2+2 == 4");
```

This test will pass! But we should write more tests:

```
assert_equal(add(0, 0), 0, "0+0 == 0");
assert_equal(add(-1, 1), 0, "-1+1 == 0");
assert_equal(add(1, 5), 6, "1+5 == 6");
assert_equal(add(-6, 5), -1, "negative outcome");
```

And so forth. For some of these tests, the code may need to be corrected.

## Links

- [Best Practices question and answer](https://github.com/shlomif/Freenode-programming-channel-FAQ/blob/master/FAQ.mdwn#what-are-some-best-practices-in-programming-that-i-should-adopt)
- [I feel naked without my test suite](http://use.perl.org/use.perl.org/_gabor/journal/15774.html) - a cautionary tale.
- [Awesome Guidelines](https://github.com/Kristories/awesome-guidelines) - A curated list of high quality coding style conventions and standards.
