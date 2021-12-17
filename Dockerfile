FROM python
WORKDIR /app
ADD . /app
RUN python -m pip install -r requirements.txt
CMD python test.py
