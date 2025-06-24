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
Tool	Type	Best For	Learning Curve
JUnit 5	Testing	Standard unit tests	Low
TestNG	Testing	Complex test scenarios	Medium
Mockito	Mocking	Dependency mocking	Medium
AssertJ	Assertions	Readable validations	Low
PowerMock	Mocking	Legacy code challenges	High
TestContainers	Integration	Docker-based dependencies	High
