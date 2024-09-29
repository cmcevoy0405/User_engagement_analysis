<h1 align="center" style="color:#FFFFFF; font-family: 'Arial', sans-serif;">Relax user engagement analysis</h1> <p align="left" style="color:#FFFFFF; font-family: 'Verdana', sans-serif;"><b>Key Findings: The analysis revealed that the top two creation sources were responsible for the majority of adopted users. Additionally, users who logged in more recently tended had a far lower adoption rate. Further investigation identified key businesses with the highest number of adopted members. Mailing lists had no impact on user adoption, while inviting users showed a marginally higher rate of adoption.</b> </p>

### Table of contents
- [Business Problem](#business-problem)
- [Introduction](#introduction)
- [Analysis](#analysis)
- [Insights](#insights)

### Buisness Problem
The company needs to understand which behaviors or sign-up methods lead to consistent product usage (adoption) and which user segments are at risk of disengaging. Solving this helps improve customer retention, optimize marketing efforts, and enhance overall product growth.

### Introduction
This analysis focuses on identifying patterns in user engagement and adoption for the Relax Take Home Assignment. The goal is to determine which factors lead users to become "adopted"—defined as visiting the product three times within a week. By examining user behaviors, sign-up methods, and invitation impacts through SQL queries, the analysis aims to uncover insights that can help drive user retention.

### Analysis

#### Identifiying adopted users
Firstly, I had the task of identifying users from the take-home user engagement table. I utilized SQL’s DATEADD and DATEDIFF functions to sum the total number of visits for users in a week. If a user had visited the site more than three times in a week, they were identified as an adopted user. I then added a column to the take-home users table, identifying adopted users with a 1 and non-adopted users with a 0.

#### Creation source analysis
As there were several creation source IDs, I displayed the percentage of adopted users per creation source. SIGNUP_GOOGLE_AUTH and GUEST_INVITE were clear leaders in this section, both with adoption rates over 15%.

#### Recently active
I then created two common table expressions: one identifying users who were active more recently and another for users active less recently. Users who logged in more recently had less than 5% adoption rate compared to 26% for older members.

#### Business Adoption
I simply identified businesses with the highest adoption numbers using WHERE, GROUP BY, and ORDER BY statements. Organizations 7, 3, 2, 13, and 9 had the highest number of adopted users.

#### Mailing impact
I pulled data showing all different combinations of mailing lists for adopted and non-adopted users. The highest number of adopted members were those who had opted out of both mailing preferences, indicating that mailing preferences had a negative impact on adoption rates.

#### Inviting users
Analysis showed that when a user was invited, they were 2% more likely to become an adopted member.

### Insights
To help increase adoption rates:
- It would be beneficial to encourage users to sign up through Google and send out guest invites.
- Strive for long term membership deals, for example offer rewards for loyalty.
- Identify similarities among the leading organizations and target similar businesses.
- Spend less money and time on mailing lists.
- Encourage users to invite friends, possibly by running promotions and offering rewards when a member successfully invites a guest.



