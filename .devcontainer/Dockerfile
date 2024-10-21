# create rust builder
FROM rust:1.82.0 as builder

# build typst
RUN git clone --branch v0.12.0 --depth 1 https://github.com/typst/typst.git /typst
WORKDIR /typst
RUN cargo update
RUN cargo build -p typst-cli --release

# create output
FROM rust:1.82.0 as output

# install just
RUN cargo install just

# copy typst to bin
COPY --from=builder /typst/target/release/typst /usr/local/bin/typst