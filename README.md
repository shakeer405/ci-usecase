# ci-usecase
Clean Phase Output
1.Deletes the target directory (removing previous build artifacts)

Compile Phase Output
1.Copies resources (src/main/resources)
2.Compiles Java classes (src/main/java)

Test Phase Output (unless skipped with -DskipTests)

Package Phase Output
Creates JAR/WAR file in target/ directory

Install Phase Output
Installs artifact in local Maven repository (~/.m2)

Comparison Table:
Below is a comprehensive table of popular **unit testing tools**, along with details on:

1. **Tool overview**
2. **Code changes needed in the application**
3. **How to run tests in Jenkins or shell script**

| **Tool**            | **Language**  | **Code Changes in App**                                                                 | **Run in Jenkins/Script**                                            |
| ------------------- | ------------- | --------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **JUnit**           | Java          | Add JUnit dependency in `pom.xml` or `build.gradle`; annotate test classes with `@Test` | `mvn test` or `./gradlew test` in Jenkins pipeline step              |
| **TestNG**          | Java          | Add TestNG dependency; use `@Test` annotations; configure `testng.xml`                  | `mvn test -DsuiteXmlFile=testng.xml` or via Gradle/Ant               |
| **Mockito**         | Java          | Add Mockito dependency; use `Mockito.mock`, `when`, `verify` in tests                   | Same as JUnit/TestNG; used in conjunction with other test frameworks |
| **NUnit**           | C#            | Use `[TestFixture]`, `[Test]` attributes in test classes                                | `dotnet test` in Jenkins or script                                   |
| **xUnit.net**       | C#            | Install `xunit` NuGet package; use `[Fact]`, `[Theory]` attributes                      | `dotnet test`                                                        |
| **PyTest**          | Python        | Install `pytest`; create test files starting with `test_`; use assert statements        | `pytest` or `python3 -m pytest` in Jenkins or shell                  |
| **unittest**        | Python        | Create classes inheriting from `unittest.TestCase`; use `self.assertEqual`, etc.        | `python3 -m unittest discover` or `pytest`                           |
| **doctest**         | Python        | Add docstring examples; use `doctest.testmod()` in main module                          | `python3 -m doctest your_module.py`                                  |
| **Mocha**           | JavaScript    | Install via `npm install --save-dev mocha`; create `test/*.js` files                    | `npx mocha` or `npm test` (if defined in `package.json`)             |
| **Jest**            | JavaScript    | Install via `npm install --save-dev jest`; write `*.test.js`; update `package.json`     | `npx jest` or `npm test`                                             |
| **Jasmine**         | JavaScript    | Install Jasmine; create specs using `describe`, `it`                                    | `npx jasmine`                                                        |
| **Karma**           | JavaScript    | Configure `karma.conf.js`; integrate with Jasmine/Mocha                                 | `npx karma start`                                                    |
| **QUnit**           | JavaScript    | Include in HTML or via Node; write test cases using `QUnit.test()`                      | Run in browser or via Node script                                    |
| **RSpec**           | Ruby          | Install with `gem install rspec`; write specs in `*_spec.rb` files                      | `rspec` command in script or Jenkins step                            |
| **MiniTest**        | Ruby          | Part of Ruby stdlib; write classes inheriting `Minitest::Test`                          | `ruby -Ilib:test test/test_file.rb`                                  |
| **Go test**         | Go            | Write tests in `*_test.go` files with `TestXxx(t *testing.T)`                           | `go test ./...`                                                      |
| **PHPUnit**         | PHP           | Install via Composer; create test classes extending `TestCase`                          | `./vendor/bin/phpunit`                                               |
| **Catch2**          | C++           | Include header; write test cases using `TEST_CASE`                                      | Compile and run binary; use CMake to automate                        |
| **Google Test**     | C++           | Include GTest; write with `TEST`, `ASSERT_*` macros                                     | CMake or `g++` compile + execute binary                              |
| **Boost.Test**      | C++           | Use macros like `BOOST_AUTO_TEST_CASE`; link with Boost Test lib                        | Compile & execute test binary                                        |
| **DUnitX**          | Delphi        | Use `[TestFixture]`, `[Test]` annotations                                               | Run from Delphi test runner or command-line                          |
| **ScalaTest**       | Scala         | Add dependency in `build.sbt`; use `FlatSpec`, `FunSuite`, etc.                         | `sbt test` in Jenkins or shell                                       |
| **SpecFlow**        | C#            | Write Gherkin `.feature` files + step definitions in C#                                 | `dotnet test` (requires SpecFlow plugins)                            |
| **Robot Framework** | Python/others | Create test suites with `.robot` files using keywords                                   | `robot tests/` or use `pabot` for parallel testing                   |

---



