# dbms

### Running the query

For the assignment, we used popsql for an interactive sql operations. So, to run the querys, we used the credentials as in the .dockerfile to connect to the databse. Once connected, we ran the queries that are in the respective files.

Here's a step-by-step instructions guide to complile and execute the SQL queries writthen throughout the project.

### Initial Setup

<ul>
  <li>
    Download and Install PopSQL.
  </li>
  <li>
    Download and Install Docker.
  </li>
  <li>
    Clone this git repo
  </li>
</ul>

### Starting a database server

**Note: you need to have docker installed to setup the database server this way**

<ul>
<li>To run the server run the following command:</li>
<pre>
  <code> 
    docker compose up -d
  </code>
</pre>
<li>To shut-down the dbms server run the following command:</li>
<pre>
  <code> 
    docker compose down
  </code>
</pre>
</ul>
