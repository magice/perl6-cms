# Unit tests

A system for describing and testing independent units for perl6. It
targets units containable within 1 file or less. It only concerns
itself with:
* Organization of tests
* Running tests
* Collection of statistics
* Presentation of result

It should not concern with:
* Libraries with which to communicate with tested system (and
"systems" are probably beside its scope)
* Mocking

It should
* Work alone or with build tool (aka make)
* Allow for setup and tear down
* Allow for filter tests to run

## Syntax
should look akin to:
    describe something {
        setup (:once) {
            /* run before all tests once*/
        }
        setup {
            /* run before EACH steps */
        }
        it does-this {
            expect(this)
        }
        it does-that (environment) -> {
            expect(that)
        }
        it expects-failure {
            expect_exception {
            }
        }
        cleanup {
            /* clean each test*/
        }
        cleanup {
            /* clean whole suite */
        }
    }
