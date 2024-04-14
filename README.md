# dbms

### Starting a database server

**Note: you need to have docker installed to setup the database server this way**

To run the server run the following command:

<pre>
  <code> 
    docker compose up -d
  </code>
</pre>

To shut-down the dbms server run the following command:

<pre>
  <code> 
    docker compose down
  </code>
</pre>

### Running the query

For the assignment, we used popsql for an interactive sql operations. So, to run the querys, you can use the credentials as in the .dockerfile to connect to the databse. Once connected, you can run the queries that are in the respective files.
