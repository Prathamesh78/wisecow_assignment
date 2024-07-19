FROM debian
RUN apt-get update && apt-get install -y cowsay fortune python3
COPY wisecow.sh /
RUN chmod +x /wisecow.sh
ENTRYPOINT ["/wisecow.sh"]
EXPOSE 4499
