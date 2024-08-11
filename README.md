# Movie Night! - Flutter App

**Movie Night!** is a Flutter app designed to make movie selection fun and interactive for two users. It simplifies the process of agreeing on a movie by enabling users to vote on films together in real time.

## Overview

This app allows two users to collaborate on movie selection by creating or joining a session. The app fetches movie data from The Movie DB (TMDB) API, and users swipe to vote on movies. When both users vote "yes" on a movie, it's confirmed as a match.

## Features

- **Session Management:** Start or join a session using a unique session code.
- **Movie Selection:** Swipe to vote on movies, with real-time sync via the MovieNight API.
- **Match Confirmation:** Get instant feedback when both users vote "yes" on the same movie.
- **Persistent Data:** Stores session and device IDs locally using `SharedPreferences`.

## Technical Implementation

- **Device ID:** Uses `platform_device_id` for unique device identification.
- **API Integration:** Fetches movie data from TMDB and manages sessions and votes via the MovieNight API.
- **UI & Navigation:** Custom branding, accessible design, and intuitive swipe-based movie voting.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/regu0005/movie-night-app.git
    ```
2. Navigate to the project directory:
    ```bash
    cd movie-night-app
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## Contributing

Contributions are welcome! Fork the repository and submit a pull request with your improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For more information, feel free to reach out:

- **Project:** [Movie Night Match](https://portfolio.tusmodelos.com/greguerin/projects/31/movie-night-match)
- **LinkedIn:** [Gustavo Reguerin](https://www.linkedin.com/in/gustavo-reguerin)
- **Email:** [reguerin@gmail.com](mailto:reguerin@gmail.com)
