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
documents and examples. Moreover, the code is validated to be functional
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

## The programming cycle

Normally one can work by adding a new test to the test suite (which may
include more than one assertion), running the test suite, and seeing it fail
("red line") with the new test alone. Then you write the code to get the new
test to pass and watch the test suite (including all previous tests) pass.
("green line".) Then you commit your changes to the version control repo.

After that, one can perform one or more commits of [refactoring](https://en.wikipedia.org/wiki/Code_refactoring)
so the internal quality of the code will improve while the tests remain
passing.


## Links

- [Automated Testing section](http://perl-begin.org/tutorials/perl-for-newbies/part5/#page--testing--DIR) of the "Perl for Newbies" tutorials, which goes for more in-depth coverage.
- [Best Practices question and answer](https://github.com/shlomif/Freenode-programming-channel-FAQ/blob/master/FAQ.mdwn#what-are-some-best-practices-in-programming-that-i-should-adopt)
- [I feel naked without my test suite](http://use.perl.org/use.perl.org/_gabor/journal/15774.html) - a cautionary tale.
- [Awesome Guidelines](https://github.com/Kristories/awesome-guidelines) - A curated list of high quality coding style conventions and standards.
- [Discussion about best practices](https://perlhacks.com/2012/03/you-must-hate-version-control-systems/) on Dave Cross's blog.
- [Just write the God-damn tests](http://blogs.perl.org/users/shlomi_fish/2013/02/essay-just-write-the-god-damn-tests-motherfucker.html)
- [The Test Anything Protocol](https://testanything.org/) - allows for test suites written in more than one programming language.
