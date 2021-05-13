## Ironhack ML lab

## End to End : SQL query & Data Wrangling in Python & Visualise in Python or Tableau
# by Lilla Szulyovszky

### Introduction
In this exercise, you will both practice the pandas python techniques from week 1, SQL querying we discussed in the lessons this week and what you learnt about plotting in Python in week1/2 or what you learnt about visualising data in Tableau in week 2 You may also in this lab take some time to learn new techniques by looking up documentation and references. You will work on your own but remember the teaching staff is at your service whenever you encounter problems.

In this lab you will be working on sqlpy-sakila_or_harry.ipynb. Download the jupyter file to get started.

When you are on ssqlpy-sakila_or_harry.ipynb, read the instructions for each part of the process and provide your answers with the correct code. Make sure to test your answers in each cell and save the notebook.Jupyter Notebook should automatically save your work progress. But it's a good idea to periodically save your work manually just in case.

### Goals
In this lab, you will examine some MySQL tables from your local mysql instance, either from the Sakila db, or the Harry Potter db if you have run the dump file.

You will need to import the pymysql library and the create_engine function from the sqlalchemy library to connect python and MySQL as you saw in class today.

import pymysql
from sqlalchemy import create_engine
Once your connection is established with the database you will use some basic SELECT queries to retrieve the data you want in order to answer the questions.

💡 If you receive import errors for pymysql or sqlalchemy, it means you need to install them with conda install or pip install.

💡 you can also go through this blog step by step to complete your installation

### Challenge Steps
Install the required software to connect python and MySQL (see above)
Connect to the server and collect all the appropriate data from users and posts tables with the support of MySQL queries.
Evaluate and potentially amend your query to ensure you have a dataframe you can easily visualise
(optional) Create a merged dataframe with your queries Take into account that you will need some additional steps to enable merging.
Export the data frame to csv - potentially filtered to a subset of rows by date or a subset of useful columns.
Summarise and visualise your insight into the data. You can visualise this inside Python using one of the visualisation libraries (seaborn/matplotlib/bokeh/plotly), or if you prefer, by connecting to the csv with Tableau.
Bonus - add in other interesting features to your visualisations.
publish the csv, your completed jupyter notebook and any visualisations to a github repo with an appropriately worded/formatted readme to navigate your deliverables (if you are using Tableau, save the workbook to your tableau public account and publish the url on your github readme)
What do we really want to know from the data ?
You know the data - its up to you to frame an interesting and specific question that can be visualised.

💡 if you are struggling with SQL and Python today, but you still want to do some nice visualisations during this lab, here is an option for you. I have uploaded an excel file containing data about the top 500 youtube gamers (warning : out of date, from 2017) which you can read into python and visualise or read into excel and visualise. In this case you will be looking at the relationship between youtube accounts, subscribers and views and can still do some interesting data analysis and insight.

❗ If you feel you are already good at Python/Pandas and don't need the instructions in sqlpy-sakila_or_harry.ipynb to walk you through the steps, please feel free to skip sqlpy-sakila_or_harry.ipynb and create your own solution files.

### Deliverables
sqlpy-sakila_or_harry.ipynb with your completed code.
csv containing the resulting dataframe
visualisation inside sqlpy.ipynb or other tool, such as tableau public url of published workbook, any chart images exported as png
