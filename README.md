# Gurtkivets
A management system for extracurricular education institutions, developed in Java (Spring), MySQL, HTML, CSS, JavaScript.

## To run with Maven:

1. **Install JDK 17 and Maven:**
   - Install JDK 17 from [Oracle's website](https://www.oracle.com/cis/java/technologies/downloads/#java17).
   - Install Maven from [here](https://maven.apache.org/download.cgi).

2. **Install and Set Up MySQL:**
   - Install MySQL from [MySQL's official website](https://dev.mysql.com/downloads/).
   - Create a database named `gurtkivets`:
     ```sql
     CREATE DATABASE gurtkivets;
     ```

3. **Clone the Repository:**
   - Clone the repository to your local machine:
     ```bash
     git clone https://github.com/c0mm0n9/gurtkivets-public/
     ```

4. **Navigate to Project Directory:**
   - Open a terminal and navigate to the project directory:
     ```bash
     cd gurtkivets-public
     ```

5. **Restore the Database:**
   - Navigate to the `database` directory in the project.
   - Restore the database using the dump.sql file:
     ```bash
     mysql -u <username> -p gurtkivets < dump.sql
     ```
   Replace `<username>` with your MySQL username.

6. **Run the Project:**
   - Build the project using Maven:
     ```bash
     mvn clean install
     ```
   - Run the project using the Maven Spring Boot plugin:
     ```bash
     mvn spring-boot:run
     ```

7. **Access the Application:**
   - Once the application is running, open your web browser.
   - Navigate to the following address:
     ```
     http://localhost:8080/
     ```

Now you're all set to use Gurtkivets!
