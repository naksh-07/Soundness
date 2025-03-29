# **Soundness Docker Image** 🚀  

This repository provides a **Dockerized environment** for using **Soundness CLI** with **Rust and Cargo** pre-installed.  

---

## **🔹 Quick Start: Use the Image**  

To use the Soundness Docker image, simply pull and run it:  

```sh
docker pull rohan014233/soundness:latest
docker run -it rohan014233/soundness:latest
This gives you a fully configured environment with Rust, Cargo, and Soundness CLI ready to use. ✅

📦 About the Project
This project provides a pre-configured and reproducible environment for working with Soundness CLI in Docker.

🛠 Features:
🏗 Ubuntu 22.04 as the base image

🔗 Rust & Cargo installed via rustup

🔨 Soundness CLI installed and verified

🏗 Configured PATH environment to access binaries easily

🔨 Building the Docker Image
If you want to build the image manually, follow these steps:

1️⃣ Clone the Repository
sh
Copy
Edit
git clone [<repo-url>](https://github.com/naksh-07/Soundness.git)
cd Soundness
2️⃣ Build the Image
sh
Copy
Edit
docker build -t soundnessup-image .
3️⃣ Run the Image
sh
Copy
Edit
docker run -it soundnessup-image
🚀 Push the Image to Docker Hub
If you want to push the image to Docker Hub (replace rohan014233 with your username):

1️⃣ Tag the Image
sh
Copy
Edit
docker tag soundnessup-image rohan014233/soundness:latest
2️⃣ Login to Docker Hub
sh
Copy
Edit
docker login
3️⃣ Push the Image
sh
Copy
Edit
docker push rohan014233/soundness:latest
⚙️ Verify Installation in the Container
After running the container, you can check installed tools:

sh
Copy
Edit
rustc --version   # Check Rust installation
cargo --version   # Check Cargo installation
soundness-cli --help  # Verify Soundness CLI
To ensure soundness-cli is available in every session, use this inside the container:

sh
Copy
Edit
source /root/.bashrc
🔗 Mounting Local Files into the Container
To work with local files inside the container, use volume mounting:

sh
Copy
Edit
docker run -it -v $(pwd):/workspace rohan014233/soundness:latest
This mounts your current directory ($(pwd)) into /workspace inside the container.

📌 Summary
Use: docker pull & docker run

Build manually: docker build

Push to Docker Hub: docker push

Mount local files: -v $(pwd):/workspace

🚀 Now you're ready to use Soundness CLI inside Docker! 🔥

📜 License
This project is open-source and freely available for use.

💡 Contributions
Feel free to submit issues or PRs to improve the setup.

### ✅ **How This is GitHub-Friendly:**  
✔️ Uses **proper Markdown formatting**  
✔️ Includes **code blocks** for commands  
✔️ Uses **section headers** (`##`, `###`) for clarity  
✔️ Follows **best practices** for Docker projects  

This will **display beautifully** on GitHub. Let me know if you need any tweaks! 🚀
