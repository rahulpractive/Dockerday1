#Day 1: Hello-World Alpine project using a security-first and Lean mindset.
FROM alpine:3.21.3  
# latest gives issues

#creating a non-root user - Security Practice
RUN addgroup -S addgroup \
    && adduser -S adduser -G addgroup
#COPY the app
COPY app/hello.sh /app/hello.sh

#SET permissions and user
RUN chmod +x /app/hello.sh
USER adduser

#Run the script
ENTRYPOINT [ "/app/hello.sh" ]