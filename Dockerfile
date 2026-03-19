# Image includes Yosys and KLayout
FROM openroad/flow-ubuntu22.04-dev:50ff2b

WORKDIR /opt
RUN git clone --recursive --depth 1 https://github.com/The-OpenROAD-Project/OpenROAD.git \
 && cd OpenROAD \
 && ./etc/Build.sh \
 && cd build && make install \
 && rm -rf /opt/OpenROAD
