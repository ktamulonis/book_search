
# Book Search

**Book Search** is a Ruby on Rails application that serves as the front-end chatbot interface for the Flask-based [OpenBook Service](https://github.com/ktamulonis/openbook_service). It allows users to describe the kind of book they are looking for, and the app provides intelligent recommendations based on the input.

---

## Features

- **Chat Interface**: A simple, conversational interface for users to search for books.
- **Smart Recommendations**: Suggests books that match the user's detailed descriptions by leveraging the OpenBook Service.
- **Detailed Responses**: Includes book titles, authors, and additional context that aligns with the user's preferences.

---

[Watch the demo video](./assets/book_search_demo.mp4)

---

## Prerequisites

Before setting up the application, ensure the following are installed:

- Ruby (3.3.6 or later)
- Rails (8.0.1)
- SQLite3 (or another supported database)
- Bundler (2.5.23 or later)
- [OpenBook Service](https://github.com/ktamulonis/openbook_service)

---

## Installation Instructions

### 1. Clone the Repositories Separately

Clone the **Book Search** repository:
```bash
git clone https://github.com/ktamulonis/book_search.git
cd book_search
```

Clone the **OpenBook Service** repository:
```bash
git clone https://github.com/ktamulonis/openbook_service.git
cd openbook_service
```

Follow the setup instructions in the OpenBook Service repository to get the back-end service running.

---

### 2. Install Dependencies

#### Book Search Frontend

1. **Install Gems**:
   Run the following command to install the required Ruby gems:
   ```bash
   bundle install
   ```

2. **Set Up the Database**:
   Create and migrate the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

---

### 3. Run the Applications

#### OpenBook Service Backend

Start the Flask-based service following its setup instructions. Ensure it is running on port (`5001`).

#### Book Search Frontend

Start the Rails server:
```bash
bin/dev
```

Visit the application in your browser at `http://localhost:3000`.

---

## Usage

1. Open the application in your browser, and click create chat.
2. Enter a descriptive phrase in the chat interface, such as:
   ```
   I'm looking for a book that's a mix of mystery and romance, set in a small town, with a strong female lead who solves a crime. Give me up to 3 recommendations.
   ```
3. View the recommendations provided by the chatbot.

---

## Example Response

Here’s an example of what the chatbot might return:

```
That sounds like a fascinating combination! Here are a few book recommendations that match your description:

• "Big Little Lies" by Liane Moriarty - This novel weaves together mystery and romance in a small-town setting. It features strong female characters who navigate complex relationships while uncovering hidden secrets. You'll be drawn into the suspenseful plot and the intricate dynamics between the characters.

• "The Cuckoo's Calling" by Robert Galbraith - Written by J.K. Rowling under a pseudonym, this mystery novel introduces you to a strong female detective who tackles a high-profile case. The story blends elements of romance and mystery, making it a compelling read for fans of both genres.

• "Still Life" by Louise Penny - Set in the charming village of Three Pines, this mystery novel follows a female protagonist who unravels the secrets of the town while solving a crime. The book beautifully combines the cozy atmosphere of a small town with the thrill of a mystery, all while developing a strong and relatable female lead.
```

---

## Development

To start the development server, run:
```bash
bin/dev
```

To access the Rails console, use:
```bash
rails console
```

### Running Tests
To execute the test suite:
```bash
rails test
```

---

## Deployment

To deploy the app, use any Rails-compatible deployment platform such as Heroku, AWS, or Render. Ensure the OpenBook Service is also deployed and accessible.

---

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to enhance the project.

---

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---

Enjoy finding your next favorite book! 📚
# book_search
