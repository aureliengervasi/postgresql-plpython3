FROM postgres:9.5.9

RUN apt-get update
RUN apt-get -y install python3 postgresql-plpython3-9.5
RUN apt-get -y install python3-pip

RUN  apt-get clean && \
     rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# Requirements installation
COPY requirements.txt /tmp/
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --requirement /tmp/requirements.txt

# Final set up
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
