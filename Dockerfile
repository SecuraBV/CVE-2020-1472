FROM alpine

RUN apk --no-cache add python3 py3-pip gcc python3-dev musl-dev libffi-dev openssl-dev
WORKDIR /app
COPY ["requirements.txt", "LICENSE", "./"]
RUN pip3 install -r requirements.txt
COPY ["zerologon_tester.py", "README.md", "./"]

RUN adduser -h /app -D user && chown user:user * && chmod 744 zerologon_tester.py
USER user

ENTRYPOINT ["./zerologon_tester.py"]
