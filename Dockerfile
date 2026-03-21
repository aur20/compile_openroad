# Compile OpenROAD and yosys
FROM openroad/debian12-dev:latest AS build
RUN apt update && apt install -y libtbb-dev capnproto libcapnp-dev
WORKDIR /
RUN git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
WORKDIR /OpenROAD-flow-scripts
RUN ./build_openroad.sh --local

# Collect executables and klayout
FROM openroad/debian12-dev:latest AS base
COPY --from=build /OpenROAD-flow-scripts/flow/tools/install /OpenROAD-flow-scripts/flow/tools/install
RUN apt update && apt install -y libtbb capnproto klayout && apt clean
