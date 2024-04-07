# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Set environment variables
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword

# Expose PostgreSQL port
EXPOSE 5432
