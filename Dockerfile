FROM python
WORKDIR /app
ADD . /app
RUN pip install -r --no-cache-dir requirements.txt
CMD python test.py
