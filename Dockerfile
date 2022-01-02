FROM gcc:latest

COPY . .

RUN curl http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz -o libsndfile-1.0.28.tar.gz
RUN tar -xzvf libsndfile-1.0.28.tar.gz
RUN cd libsndfile-1.0.28 && ./configure && make && make install
RUN make
RUN echo "/libsndfile-1.0.28" > /etc/my.conf
RUN ldconfig
RUN echo "test" > test.txt && ./modulate test.txt test.wav

