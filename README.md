# Movie Night! - Flutter App

**Movie Night!** is an innovative Flutter app designed to make the process of selecting a movie fun and interactive for two users. Whether you're planning a movie night with a friend or a loved one, this app helps you both agree on what to watch by turning the decision-making process into an enjoyable experience.

## Overview

The **Movie Night!** app facilitates collaborative movie selection between two users. The core functionality revolves around real-time interaction, where users can vote on movies and get instant feedback on whether they have a match. The app integrates with The Movie DB (TMDB) API for movie data and uses a custom API for session management and voting synchronization.

## Features and Functionality

### 1. Welcome Screen
- **Session Options:** Users can either start a new session or join an existing one.
- **Session Code:** Options to generate a new session code or enter an existing code are provided to start the collaborative process.

### 2. Session Management
- **Create Session:** Generates a unique session code using the `/start-session` endpoint of the MovieNight API.
- **Join Session:** Allows the second user to join a session by entering a shared code using the `/join-session` endpoint.

### 3. Movie Selection
- **Movie Data:** Fetches movies from The Movie DB (TMDB) API, displaying a curated list that includes popular, upcoming, or recent releases.
- **Voting System:** Users swipe left or right to vote on movies. Votes are synced in real-time using the MovieNight API's `/vote-movie` endpoint.

### 4. Movie Matching
- **Match Confirmation:** If both users vote "yes" on the same movie, the app confirms a match and displays the movie details in a modal dialog.
- **Next Steps:** After a match, users are prompted to either return to the Welcome screen or continue selecting more movies.

## Technical Implementation

### Device ID Management
- **Unique Identification:** Utilizes the `platform_device_id` package to fetch and store a unique device ID for each user.

### Persistent Data Storage
- **Local Storage:** Uses `SharedPreferences` or similar local storage solutions to store device and session IDs, ensuring data persistence across sessions.

### API Integration
- **TMDB API:** Handles fetching of movie data, managing pagination, and displaying one movie at a time for voting.
- **MovieNight API:** Manages session creation, joining, and voting, ensuring real-time synchronization between users.

## Design and Usability

### UI Elements
- **Custom Branding:** The app features a custom launcher icon and splash screen.
- **Cohesive Design:** Consistent use of a Google Font and defined color schemes for a professional and cohesive look.
- **Accessibility:** Text contrast and spacing are optimized for readability, with padding and margins based on a base unit for consistency.

### Navigation
- **User-Friendly Navigation:** The app provides intuitive navigation between screens, with clear instructions and feedback for user actions.
- **Swipe Voting:** Movies are presented using `Dismissible` widgets for voting, with visual indicators to show user votes.

## Extra Features

### Persistent Vote History
- **Local History:** Stores voted movies in a local JSON file, allowing users to retrieve and review their voting history.
- **Management:** Users can view a list of movies they voted "yes" for and remove entries if desired.

## Technical Requirements and Best Practices

### HTTP Helper
- **API Communication:** A dedicated class handles all API communications, ensuring clean, maintainable, and scalable code.

### Error Handling
- **User Feedback:** Robust error handling ensures that API errors are gracefully managed, with user-friendly messages displayed via `AlertDialog` or `SnackBar`.

### Debugging
- **Conditional Debugging:** `Print` statements are conditional, ensuring that no debug information is output in the production environment.

## Getting Started

### Prerequisites
- **Flutter SDK:** Make sure you have the Flutter SDK installed.
- **API Keys:** Obtain API keys for The Movie DB (TMDB) and the MovieNight API.

### Installation

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

Contributions are welcome! If you'd like to contribute to this project, please fork the repository and create a pull request with your changes. For major changes, consider opening an issue first to discuss the proposed modifications.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For more information, feel free to reach out:

- **Project:** [https://portfolio.tusmodelos.com/greguerin/projects/31/movie-night-match](https://portfolio.tusmodelos.com/greguerin/projects/31/movie-night-match)
- **LinkedIn:** [https://www.linkedin.com/in/gustavo-reguerin](https://www.linkedin.com/in/gustavo-reguerin)
- **Email:** [reguerin@gmail.com](mailto:reguerin@gmail.com)
