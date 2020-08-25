FROM alpine:latest
RUN apk --no-cache add curl ca-certificates bash
RUN echo "CHECK ENV VARIABLE= " $DRONE_STAGE_ARCH
RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$DRNE_STGE_ARCH/kubectl
RUN chmod +x /usr/local/bin/kubectl
COPY update.sh /bin/
ENTRYPOINT ["/bin/bash"]
CMD ["/bin/update.sh"]
