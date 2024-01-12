
# Hex - A Modular Ruby Web Application

## Introduction

Welcome to Hex, a Ruby web application designed using the Hexagonal Architecture. This architecture, also known as Ports and Adapters, emphasizes the separation of concerns by dividing an application into distinct layers. This approach increases modularity and maintainability, making Hex an ideal choice for scalable web applications.

## Why Hexagonal Architecture?

-   **Decoupling Core Logic from External Concerns**: Core application logic is decoupled from external interfaces like web frameworks and databases.
-   **Flexibility and Maintainability**: Changes in one part of the system (e.g., UI, database) have minimal impact on others, particularly the business logic.
-   **Ease of Testing**: Core logic can be tested in isolation from external elements.
-   **Adaptability**: Easily adapt to different technologies and frameworks.

## Features

-   **Admin and Web Adapters**: Separate adapters for admin and web interfaces, allowing for clear segregation and easier maintenance.
-   **GraphQL Integration**: A modern approach to API design, offering flexible and efficient data loading.
-   **RESTful Interface**: Traditional REST interface for straightforward CRUD operations.
-   **Domain-Driven Design**: Business logic encapsulated in the domain layer for clarity and cohesion.
-   **SQLite Database**: Lightweight and serverless database ideal for development and testing.

## Current Structure

-   `app/`: Main application directory.
    -   `adapters/`: Adapters for different interfaces.
        -   `admin/`: Admin interface.
        -   `graphql/`: GraphQL API.
        -   `rest/`: RESTful API.
        -   `web/`: Web interface.
    -   `domain/`: Core business logic.
        -   `models/`: Domain models (Author, Post).
        -   `repositories/`: Data access logic.
    -   `ports/`: Ports connecting adapters to the domain.
-   `config/`: Application configuration files.
-   `db/`: Database files.
-   `public/`: Public assets.
-   `spec/`: Test specifications.

## Getting Started

### Prerequisites

-   Ruby (version specified in `.ruby-version`)
-   Bundler (`gem install bundler`)
-   SQLite3

### Installation

1.  Clone the repository:
    
    shCopy code
    
    `git clone [repository-url]` 
    
2.  Navigate to the project directory:
    
    shCopy code
    
    `cd hex` 
    
3.  Install dependencies:
    
    shCopy code
    
    `bundle install` 
    

### Running the Adapters

-   **Web Adapter**:
    
    shCopy code
    
    `ruby app/adapters/web/adapter.rb` 
    
    Access at `http://localhost:4567`.
    
-   **Admin Adapter**:
    
    shCopy code
    
    `ruby app/adapters/admin/adapter.rb` 
    
    Access at `http://localhost:[port]`.
    
-   **GraphQL Adapter**:
    
    shCopy code
    
    `ruby app/adapters/graphql/adapter.rb` 
    
    Use GraphQL client at `http://localhost:[port]/graphql`.
    

### What to Expect

-   **Web Interface**: A user-friendly web interface for viewing and managing blog posts.
-   **Admin Interface**: An administrative dashboard for advanced management tasks.
-   **GraphQL API**: An interactive GraphQL interface to query and mutate data.
-   **REST API**: Standard RESTful endpoints for CRUD operations.

## Documentation

For detailed usage and API documentation, refer to the `docs/` directory (if available) or inline code comments throughout the application.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Copyright

This product is created and maintained by [Flakërim Ismani](https://base.al).
