#1. Retrieve everything from a table
#Question
#How can you retrieve all the information from the cd.facilities table?

SELECT * FROM cd.facilities;

#Answers and Discussion Hide
select * from cd.facilities;
#The SELECT statement is the basic starting block for queries that read information out of the database. A minimal select statement is generally comprised of select [some set of columns] from [some table or group of tables].

#In this case, we want all of the information from the facilities table. The from section is easy - we just need to specify the cd.facilities table. 'cd' is the table's schema - a term used for a logical grouping of related information in the database.

#Next, we need to specify that we want all the columns. Conveniently, there's a shorthand for 'all columns' - *. We can use this instead of laboriously specifying all the column names.

#2. Retrieve specific columns from a table
#Question
#You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

SELECT name, membercost FROM cd.facilities;

#Answers and Discussion Hide
select name, membercost from cd.facilities;
#For this question, we need to specify the columns that we want. We can do that with a simple comma-delimited list of column names specified to the select statement. All the database does is look at the columns available in the FROM clause, and return the ones we asked for, as illustrated below

#Specifying column names to a select statement

 # Generally speaking, for non-throwaway queries it's considered desirable to specify the names of the columns you want in your queries rather than using *. This is because your application might not be able to cope if more columns get added into the table.

#3. Control which rows are retrieved
# Question
# How can you produce a list of facilities that charge a fee to members?

SELECT * FROM cd.facilities WHERE membercost > 0;


#Answers and Discussion Hide
select * from cd.facilities where membercost > 0;
#The FROM clause is used to build up a set of candidate rows to read results from. In our examples so far, this set of rows has simply been the contents of a table. In future we will explore joining, which allows us to create much more interesting candidates.

#Once we've built up our set of candidate rows, the WHERE clause allows us to filter for the rows we're interested in - in this case, those with a membercost of more than zero. As you will see in later exercises, WHERE clauses can have multiple components combined with boolean logic - it's possible to, for instance, search for facilities with a cost greater than 0 and less than 10. The filtering action of the WHERE clause on the facilities table is illustrated below:

#Action of a WHERE clause on a set of candidate rows

# 4. Control which rows are retrieved - part 2
#Question
#How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE monthlymaintenance > 500;

#Answers and Discussion Hide
select facid, name, membercost, monthlymaintenance
from cd.facilities
where
  membercost > 0 and
  (membercost < monthlymaintenance/50.0);
#The WHERE clause allows us to filter for the rows we're interested in - in this case, those with a membercost of more than zero, and less than 1/50th of the monthly maintenance cost. As you can see, the massage rooms are very expensive to run thanks to staffing costs!

#When we want to test for two or more conditions, we use AND to combine them. We can, as you might expect, use OR to test whether either of a pair of conditions is true.

#You might have noticed that this is our first query that combines a WHERE clause with selecting specific columns. You can see in the image below the effect of this: the intersection of the selected columns and the selected rows gives us the data to return. This may not seem too interesting now, but as we add in more complex operations like joins later, you'll see the simple elegance of this behaviour.

