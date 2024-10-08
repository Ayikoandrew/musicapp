# MusicApp Server

This repository contains the server-side code for the MusicApp project. The server is built using FastAPI and PostgreSQL, and it provides a RESTful API for managing user credentials and music data.

Table of Contents

- Installation
- Usage
- API Endpoints
- Contributing
- License

**Installation**

To get started with the server, follow these steps:

1. Clone the repository:
   git clone https://github.com/Ayikoandrew/musicapp.git
   cd musicapp/server

2. Add dependencies using uv:
   uv add

3. Set up environment variables:
   Create a .env file in the root directory and add the following variables:
   SECRET_KEY=
   DATABASE_URL=

To generate the secret key. Rub this on your terminal
openssl rand -hex 32

4. Usage
   Once the server is running, you can access the API at http://localhost:8000. Use tools like Postman or curl to interact with the endpoints.

5. API Endpoints

6. Contributing
   Contributions are welcome! Please follow these steps to contribute:

   > 1. Fork the repository.
   > 2. Create a new branch (git checkout -b feature-branch).
   > 3. Make your changes.
   > 4. Commit your changes (git commit -m 'Add some feature').
   > 5. Push to the branch (git push origin feature-branch).
   > 6. Open a pull request.

7. License
   This project is licensed under the MIT License. See the LICENSE file for details.

If there’s anything else you’d like to adjust or add, just let me know!
