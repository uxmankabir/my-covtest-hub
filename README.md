# MyCovTest Hub

The valley of Shangri-La is in lockdown - a deadly virus called ASRS-CoV-3 spreading across the world is threatening the future of the valley. Fortunately, a new Rapid Swab Home Kit(RSHT) is developed, which can give the test results straight away in a few minutes without laboratory involvement. Shangri-La government plans to conduct mass testing and track down every case of the virus by distributing the home test kits to every hosehold.

Your task is to develop a web application called **MyCoVTest Hub** to help collect the test results and to provide an accorate picture of the local cases, including more detailed demographics, as well as reginal breakdown by postcode.

### Requirements

In response to the pandemic, all residents in Shangri-La will receieve a Home Test Kit by post. Each pack of the Home Test Kit delivered has a unique Test Tracking Number(TTN). Swab tests that can be easily done at home and anyone tested will get the test result within a few minutes as there is no need to return the test kit to a laboratory for analysis. Anyone completed the test at home will nedd to report the test result via **MyCoVTest Hub** platform.

To submit a test via MyCovTest Hub, you will need to provide some detail as follows:
* Email
* Full name
* Age
* Gender (M/F/Other)
* Address
* Postcode
* TTN Code
* Test result(Positive/Negative/Inconclusive)

In addition to SARS-CoV-3 home test result collection, **MyCoVTest Hub** platform also provides a password-protected Admin dashboard for viewing some real-time demographics statics, including:
* Total number of positive/negative cases
* Positive cases distribution by postcode/age group* [number of positive cases per postcode/age group]
* Infection rate by postcode
* Infection rate by age group

(Admin login creadentials are pre-defined in the system, see Appendix for more information)

**MyCovTest Hub** should show corresponding messages when:
* TTN code does not match the record in the database.
* Another person has already used the provided TTN code.
* The provided email is already associated with another(used) Home Test Kit
* Invalid username or password(for Admin)

Your tasks are to implement the following functions:
1. Home Test Self-reporting page (including validation, TTN verification)
2. Log-in/sign-out feature for Admin
3. Demographics statistics for Admin Dashboard
4. Error page(s) (or Ajax error messages)

Note that you should
* Use appropriate techniques to prevent SQL Injection vulnerabilities.
* Take all necessary measures to prevent unauthorized access to the Admin Dashboard
* Use Secure Hash Algorithm SHA256 to secure passwords (see Appendix 1.3)
* Use cookies to remember the last admin User ID.

The SQL firl **Shangri-La.sql** provided on Blackboard contains three tables (Admin, HomeTestKit, TestResult). You are free to edit the provided schema, add extra columns or create new tables if necessary.

### Appendix

**1.1.** Below is a list of all valid Test Tracking Number (TTN). A tester will need to enter one of the following TTN codes to report the test result.

```
MM2874Z6
FEQQ6UUG
34GC829B
CB8FBCCM
8RL4ENTK
57UBS5J6
4F7YKH9G
R9KZ2NXL
YBQUVXHL
CCZTQBKW
```

**1.2 Admin credentials**
Username: `admin`
Password: `12345`

Username: `tester`
Password: `abcde`

\* Feel free to edit the sample records in **Shangri-La.sql** or make any changes you deem necessary.

### Note
You may use any programming language or framework for the implementation, including but not limited to:

* Java (e.g. Servlet/JSP/Spring)
* Javascript (e.g. React.js/Express.js/Node.js)
* C# (e.g. ASP.NET Core etc.)
* Python (e.g. Flask, Django etc.)
* Ruby On Rails
* PHP (Laravel)