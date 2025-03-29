# Step 1: Use Ubuntu 22 as base image
FROM ubuntu:22.04

# Step 2: Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/root
ENV PATH="/root/.cargo/bin:/root/.soundness/bin:$PATH"

# Step 3: Install dependencies (including OpenSSL and pkg-config)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    build-essential \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Install Rust and Cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y 

# Step 5: Install Soundnessup
RUN mkdir -p /root/.soundness/bin && \
    curl -# -L https://raw.githubusercontent.com/soundnesslabs/soundness-layer/main/soundnessup/soundnessup -o /root/.soundness/bin/soundnessup && \
    chmod +x /root/.soundness/bin/soundnessup

# Step 6: Install Rust and verify installation
RUN /bin/bash -c 'source /root/.cargo/env && rustc --version && cargo --version'

# Step 7: Install Soundness CLI and Fix Path Issues
RUN /bin/bash -c 'source /root/.cargo/env && \
    export OPENSSL_DIR=/usr && \
    export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu && \
    export OPENSSL_INCLUDE_DIR=/usr/include && \
    /root/.soundness/bin/soundnessup install && \
    ls -l /root/.soundness/bin && \
    test -f /root/.soundness/bin/soundness-cli || (echo "❌ soundness-cli installation failed!" && exit 1)'

# Step 8: Ensure ~/.soundness/bin and ~/.cargo/bin are in PATH globally
RUN echo 'export PATH="/root/.cargo/bin:/root/.soundness/bin:$PATH"' >> /root/.bashrc && \
    echo 'source /root/.cargo/env' >> /root/.bashrc

# Step 9: Verify soundness-cli is recognized
RUN /bin/bash -c 'source /root/.bashrc && which soundness-cli && soundness-cli --help || echo "⚠️ soundness-cli not installed correctly!"'

# Step 10: Start a shell session with everything configured
CMD ["/bin/bash", "-c", "source /root/.bashrc && exec bash"]
