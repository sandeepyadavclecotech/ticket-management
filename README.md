# Complaint Ticket Management System

A web-based Complaint Ticket Management System built with Ruby on Rails that allows customers to raise complaints, track ticket status, upload supporting files, and communicate with administrators through a comment system.

## 🚀 Features

### Authentication & Authorization

* User Registration and Login
* Secure Authentication using Devise
* Role-Based Access Control (Admin & Customer)

### Ticket Management

* Create New Tickets
* View Ticket Details
* Edit Existing Tickets
* Delete Tickets
* Automatic Ticket Number Generation
* Ticket Status Tracking

### Comment System

* Customers can add comments on tickets
* Admins can respond to tickets
* Complete comment history maintained

### File Uploads

* Multiple Image Upload Support
* Active Storage Integration
* Attach screenshots or supporting documents

### Dashboard

#### Customer Dashboard

* Total Tickets
* Open Tickets
* Closed Tickets
* In Progress Tickets

#### Admin Dashboard

* Total Tickets
* Open Tickets
* Closed Tickets
* High Priority Tickets

### Search Functionality

Search tickets by:

* Title
* Status
* Priority
* Ticket ID

---

## 🛠️ Technologies Used

### Backend

* Ruby
* Ruby on Rails 8

### Frontend

* HTML5
* CSS3
* Bootstrap 5
* ERB Templates

### Database

* SQLite3

### Authentication

* Devise Gem

### File Storage

* Active Storage

### Version Control

* Git
* GitHub

---

## 📂 Project Structure

### Models

#### Customer

```ruby
has_many :tickets
has_many :comments
```

#### Ticket

```ruby
belongs_to :customer
has_many :comments, dependent: :destroy
has_many_attached :images
```

#### Comment

```ruby
belongs_to :customer
belongs_to :ticket
```

---

## ✅ Validations

### Ticket

```ruby
validates :title, presence: true
validates :description, presence: true,
                      length: { minimum: 10 }
validates :status, presence: true
validates :priority, presence: true
```

### Comment

```ruby
validates :content, presence: true
```

### Customer

Handled automatically by Devise:

* Email Validation
* Password Validation

---

## 🔄 Callbacks

### Automatic Ticket Number Generation

```ruby
before_create :generate_ticket_number

def generate_ticket_number
  self.ticket_number = "TKT-#{SecureRandom.hex(4).upcase}"
end
```


## 🏗️ System Roles

### Customer

* Register/Login
* Create Tickets
* Edit Own Tickets
* View Own Tickets
* Upload Images
* Add Comments

### Admin

* View All Tickets
* Update Ticket Status
* Update Priority
* Add Comments
* Monitor Dashboard

---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/sandeepyadavclecotech/ticket-management.git
```

### Install Dependencies

```bash
bundle install
```

### Setup Database

```bash
rails db:create
rails db:migrate
```

### Start Server

```bash
rails server
```

Open:

```text
http://localhost:3000
```

---

## 🎯 Challenges Faced

### Role-Based Authentication

Implemented separate functionalities for Admin and Customer using role-based authorization.

### Ticket Number Generation

Used Rails callbacks and SecureRandom to generate unique ticket identifiers automatically.

### Search Functionality

Implemented dynamic searching for faster ticket retrieval.

### Comment System

Created a communication channel between customers and administrators through ticket comments.

---

## 📚 Learning Outcomes

* MVC Architecture
* Rails Associations
* Devise Authentication
* Active Storage
* Validations
* Callbacks
* Bootstrap Integration
* Search Functionality
* Role-Based Authorization
* Database Design
* CRUD Operations

---

## 📌 Future Enhancements

* Email Notifications
* Ticket Assignment to Admins
* Priority-Based Escalation
* Export Reports (PDF/Excel)
* Real-Time Notifications using Action Cable

---

## 👨‍💻 Author

**Sandeep Kumar Yadav**

Ruby on Rails Developer

---

## 📄 License

This project is developed for learning and educational purposes.
