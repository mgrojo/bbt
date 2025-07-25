<!-- omit from toc -->
## Feature: return code on test failure

bbt is intended to be used in Makefile or other CI context, where it is important to raise the hand when some test fail.
Therefore, the return status is set to fail not only when there is an internal error, or an error when reading the scenario, but also when a test fail.

_Table of Contents:_
- [Scenario: return code on test success](#scenario-return-code-on-test-success)
- [Scenario: return code when the test fail](#scenario-return-code-when-the-test-fail)
- [Scenario: return code when one fail and the other succeed](#scenario-return-code-when-one-fail-and-the-other-succeed)

### Scenario: return code on test success

- Given the new `good_option.md` file
```md
# Scenario: Good option
- When I run `./sut -v`
- Then output contains `version 1.0`
```

- When I run `./bbt good_option.md`
- Then I get no error 
- and `good_option.md.out` is 
```
sut version 1.0
```

### Scenario: return code when the test fail

- Given the new `wrong_option.md` file
```md
# Scenario: Wrong option
- When I run `./sut -wxz`
- Then output contains `sut version`
```

- When I run `./bbt --cleanup wrong_option.md`
- Then I get an error

### Scenario: return code when one fail and the other succeed

The first scenario hereafter fails and the second succeed, but bbt should still return an error code.

- Given the new `wrong_and_good_option.md` file
```md
# Scenario: Wrong option
- When I run `./sut -wxz`
- Then output contains `sut version`

# Scenario: Good option
- When I run `./sut -v`
- Then output contains `sut version`
```

- When I run `./bbt --cleanup wrong_and_good_option.md`
- Then I get an error
