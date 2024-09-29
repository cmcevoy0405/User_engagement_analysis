<h1 align="center" style="color:#FFFFFF; font-family: 'Arial', sans-serif;">Relax user engagement analysis</h1> <p align="left" style="color:#FFFFFF; font-family: 'Verdana', sans-serif;"><b>Key Findings: Analysis showed that the top two creation sources were responsible for the majority of adopted users. Users that logged on in a more recent time frame seemed to contain more adopted members. Further analysis showed key businesses that contained the highest number of adopted members. Mailing lists had no impact on user adoption and inviting users seemed to have a marginally higher rate of adoption.</b> </p>

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
Fistly I had the task of identifying users from the takehome user engagement table, I utilised SQL's DATEADD and DATEDIFF functions to sum the total number of visits for users in a week, if the a user had visited the site more than three times in a week they were identified as an adopted user. I then added a column to the takehome users table, identifiying an adopted user with a 1 and not adopted with a 0.

#### Creation source analysis
As there were several creation source id's I displayed the percentage of adopted users per creation source. SIGNUP_GOOGLE_AUTH and GUEST_INVITE were clear leaders in this section both with over 15% adoption rates.

#### Recently active
I then created two common table expression, identifying users that where active more recently and one identifying when users were active less recently. As expected users that were active recently were more likely to be adopted, showing a difference of 7% in adoption rates.

#### Business Adoption
I simply identifed buisness with the highest adoption numbers using where, group by and order by statements. Organisations 7, 3, 2, 13, 9 all had the highest number of adopted users.

#### Mailing impact
I pulled data showing all different combinations of mailing lits for adopted and non-adopted users. The highest number of adopted members was shown when they were opted out for both mailing preferences. Shwoing that mailing preferences had a negative impact on adoption rates.

#### Inviting users
Analysis showed when a user was invited they were 2% more likely to become and adopted member.

### Insights



