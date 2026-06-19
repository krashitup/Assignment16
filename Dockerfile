# Base Image
FROM python:3.12-slim

# Install Java and utilities
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    wget \
    curl \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Java Environment
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install PySpark and Jupyter
RUN pip install --no-cache-dir \
    pyspark \
    jupyter

# Working directory
WORKDIR /app

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]