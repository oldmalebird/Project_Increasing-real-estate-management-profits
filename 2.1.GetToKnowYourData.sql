/*
Watershed's intern compiled several sources of information that will be useful for your project. These three types of information are contained in the capstone database:
1. The current monthly rent Watershed charges for all of their client’s 244 properties, as well as the property type and geographic location of those properties.
2. Some general information about examples of short-term rental properties. This information can be used to get a sense of what kind of nightly rental price Watershed’s client’s properties could be listed for, if they were converted to short-term rentals.
3. Records about when those short-term rental properties were rented out, so that you can calculate their occupancy rates.
Your job is to determine how the database is organized so that you can retrieve all of the available information about Watershed’s client’s 244 properties, as well as the corresponding short-term rental information for comparable properties in the same location and of the same type.
1. Start by determining what tables the database contains, and what fields are included in each table. Do this by accessing the Jupyter notebook in this lesson, and running the appropriate queries there.
2. Then, we recommend that you make at least a rough relational schema of how the database is organized, so that you know what fields you can use to join tables.
3. Next, make a list of the columns of data you want to retrieve in your final output.
4. Finally, write your queries to retrieve the desired data from the database.
Here are some hints about how to write your queries:
* Start by joining no more than two tables. After you have made sure the query works as written and that the output makes sense, add other tables one at a time, checking the new query and its results each time.
* Your final output should have 244 rows. Given the limited output, the easiest way to extract the results will be to copy and paste the output from your query into Excel, although you could also extract it as a .csv file and open that with Excel. See the notes in the notebook about how to extract the data as a .csv file using a mutli-line sql query.
* We recommend that you calculate the occupancy rates of the example short-term rental properties within MySQL, rather than within Excel (it will be much faster!) To do this, only examine rental dates during 2015, and remember that there are 365 days in the year. The final output of your calculation should be the percentage of days in 2015 that the property was occupied. You may want to consider using a subquery for this calculation.
* Make sure that you extract information from short-term rentals that have the same location and property type as the 244 Watershed properties. (Note: “same location” means not just same city but same city and same zip code – could also be “same location ID”)
* If you run into trouble, use your workbooks and Teradata notes from “Managing Big Data with MySQL” to remind you how to implement different parts of your query.
Begin by opening the Jupyter notebook in this lesson; the instructions and information in this reading are replicated there.
*/
%load_ext sql
%sql mysql://studentuser:studentpw@mysqlserver/capstone
%sql USE capstone

%sql SHOW tables

%%sql
select stinfo.st_property_id, stinfo.location, stinfo.property_type
from st_property_info stinfo left join st_rental_prices stprices
on stinfo.location = stprices.location and stinfo.property_type = stprices.property_type
where stprices.property_type is null
