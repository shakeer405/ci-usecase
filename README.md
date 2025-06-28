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
Why Use JaCoCo?
Reason	Explanation
✅ Measure Test Quality	Ensures your tests are covering enough of your code logic
✅ Identify Untested Code	Highlights unused branches, methods, or classes
✅ Improve Code Reliability	Higher coverage helps reduce bugs and increases confidence in the code
✅ Generate Coverage Reports	Produces visual reports (HTML, XML, CSV) for analysis or CI/CD dashboards
✅ CI/CD Integration	Easily integrates with Jenkins, GitHub Actions, SonarQube, etc.
✅ Track Coverage Over Time	Helps monitor test effectiveness over builds/releases

Functional testing:
| **Tool**                      | **Best For**               | **Language** / Stack   | **CI Integration**      | **Notes**                                                                           |
| ----------------------------- | -------------------------- | ---------------------- | ----------------------- | ----------------------------------------------------------------------------------- |
| **Selenium**                  | Web UI functional testing  | Any (Java, Python, JS) | Jenkins, GitHub, GitLab | Supports all browsers; often paired with WebDriver; ideal for cross-browser testing |
| **Cypress**                   | Modern Web apps            | JavaScript             | GitHub, GitLab, Jenkins | Fast, DOM-focused; built-in retry, screenshots, and video                           |
| **Playwright**                | Cross-browser automation   | JS, Python, .NET, Java | GitHub, Jenkins         | Headless/real browser support; modern alternative to Selenium                       |
| **TestCafe**                  | End-to-end Web testing     | JavaScript/TypeScript  | GitHub, GitLab, Jenkins | Easy setup, no browser drivers required                                             |
| **Postman/Newman**            | API functional testing     | Any (via Postman GUI)  | Jenkins, GitHub         | Newman CLI runs Postman tests in pipelines                                          |
| **Rest Assured**              | REST API testing           | Java                   | Jenkins, GitHub         | Java DSL for API testing, integrates well with JUnit/TestNG                         |
| **Robot Framework**           | Web/API/Database/CLI       | Python (keyword-based) | Jenkins, GitHub, Azure  | Extensible, readable test cases with libraries for API, Selenium, CLI, DB           |
| **SoapUI**                    | SOAP & REST API functional | Java                   | Jenkins, GitHub         | GUI and CLI (`testrunner.sh`) for test execution                                    |
| **Cucumber**                  | BDD-style functional tests | Java, JS, Ruby         | Jenkins, GitHub         | Gherkin syntax for readable test scenarios                                          |
| **Gauge**                     | Functional & BDD testing   | Java, JS, Python, C#   | Jenkins, GitHub         | From ThoughtWorks, supports markdown-based specs                                    |
| **Karate**                    | API + UI + performance     | Java DSL               | Jenkins, GitHub         | Combines functional + performance + mocking in one tool                             |
| **Appium**                    | Mobile app testing         | JS, Java, Python, etc. | Jenkins, GitHub         | Cross-platform testing for Android and iOS apps                                     |
| **Jest**                      | Functional testing in JS   | JavaScript/TypeScript  | GitHub, GitLab, Jenkins | Snapshot testing, mock functions, and coverage support                              |
| **TestNG**                    | Functional + unit testing  | Java                   | Jenkins, GitHub         | Parallel test execution, groups, data providers                                     |
| **Protractor** *(deprecated)* | Angular testing            | JavaScript             | Jenkins, GitHub         | Deprecated in 2023 — consider Cypress or Playwright instead                         |

| **Use Case**                    | **Best Tool**          |
| ------------------------------- | ---------------------- |
| Modern web apps (React/Angular) | ✅ **Cypress**          |
| Cross-browser E2E tests         | ✅ **Playwright**       |
| API tests with CI integration   | ✅ **Postman + Newman** |
| Java-based API testing          | ✅ **Rest Assured**     |
| Mobile app functional testing   | ✅ **Appium**           |
| BDD acceptance testing          | ✅ **Cucumber**         |

maven-failsafe-plugin -- for functional testing 
mvn verify
| Action                    | Command                         | What It Runs                             |
| ------------------------- | ------------------------------- | ---------------------------------------- |
| Run **unit tests only**   | `mvn test`                      | Tests in `src/test/java`, named `*Test`  |
| Run **functional tests**  | `mvn verify`                    | Runs unit + Failsafe tests (e.g., `*IT`) |
| Run functional tests only | `mvn failsafe:integration-test` | Just integration/functional tests        |

| Aspect                | **Unit Testing**                            | **Functional Testing**                               |
| --------------------- | ------------------------------------------- | ---------------------------------------------------- |
| 🔍 **Purpose**        | Test **individual components** in isolation | Test the system’s **end-to-end features or flows**   |
| 🔧 **Focus**          | Single method/class (smallest unit of code) | Complete user scenarios and business logic           |
| 🧱 **Scope**          | Internal code logic                         | External behavior/output                             |
| 🔗 **Dependencies**   | Mocks/stubs used to isolate dependencies    | Real or integrated components (DB, services, UI)     |
| ⚙️ **Tools** (Java)   | JUnit, TestNG                               | Selenium, Rest Assured, Cucumber, Postman, Karate    |
| 🔁 **Frequency**      | Fast, run on every commit                   | Slower, run post-build or post-deploy                |
| 📦 **Environment**    | In-memory/in-process, no deployment needed  | Often requires app deployment or test environment    |
| ✅ **CI/CD Use Case**  | Verify code correctness early               | Verify feature behavior before release               |
| 📊 **Typical Output** | Pass/fail per method                        | User-level test result with coverage/response checks |

| **Unit Test**                          | **Functional Test**                             |
| -------------------------------------- | ----------------------------------------------- |
| "Does `a + b` work correctly in code?" | "When I hit `/add?a=2&b=3`, do I get `5` back?" |

port opeinig:
iptables -I INPUT -p tcp --dport 9000 -j ACCEPT
