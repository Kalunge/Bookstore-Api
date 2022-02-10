# Bookstore-Api
A backend for storing books and their authors. Created using TDD Approach to cement the core Rails development skills such as 
- TDD Approach => Request tests, Controller tests ...
- Exception Handling via custom errorHandlers inheriting from StandardError
- Endpoints protection
- Writing custom serializers/Representers
- Handling Rails jobs
- Authentication is done using JWT. 
- Hashing Passwords with Bcrypt for Maximum protections
- LInting using Rubocop to maintain code best practices
- Kanban board for tasks distribution(more  Applicable in Team)
- Code Review => Reviewed my own PRs just to add an 'extra eye'


## Built With
- Rails
- Rspec
- PostgreSQL
- jwt

## Documentation

### BOOKS
#### Authentication
<details>
  <summary>
    <b>AUthenticate User</b> - <i>returns a JWT token</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `POST https://localhost/api/v1/authenticate`
  <br /><br />
  

  ```
 {
    "username":"kalunge",
    "password":"qwerty"    
}
  ```

  #### Response
  ```
  {

  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w"
}
  ```
</details>

<details>
  <summary>
    <b>Create Book and Author</b> - <i>returns newly CReated Book</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `Post https://localhost/api/v1/books`
  <br /><br />

  ### Req Body
  ```
{
  "book":
  {   
    "title":"kalunge's Newest Book" 
      },
    "author":
    {
      "first_name":"Titus", 
      "last_name":"Kalunge", 
      "age": 27 
        } 
      }
  ```
  
### Response
  ```
{
  "id": 7,
  "title": "kalunge's Newest Book",
  "author_name": "Titus Kalunge",
  "author_age": 27
}
  ```
</details>
<details>
  <summary>
    <b>Get Books</b> - <i>returns list of 66 bible books</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET https://localhost/api/v1/books`
  <br /><br />
  <b>Authenticated:</b> 
  

  ```
 [
  {
    "id": 1,
    "title": "The meaning of Marriage",
    "author_name": "Timothy  Keller",
    "author_age": 70
  },
  {
    "id": 2,
    "title": "The Freedom of Self forgetfulbess",
    "author_name": "Robert Chire  Sproul",
    "author_age": 78
  },
  {
    "id": 3,
    "title": "The Fear of Man",
    "author_name": "John  Piper",
    "author_age": 68
  },
  {
    "id": 4,
    "title": "12 Rules for Life",
    "author_name": "Timothy  Keller",
    "author_age": 70
  },
  {
    "id": 5,
    "title": "Ascccx ",
    "author_name": "Timothy  Keller",
    "author_age": 70
  },
  {
    "id": 6,
    "title": "kalunge's Newest Book",
    "author_name": "Titus Kalunge",
    "author_age": 27
  }
]
  ```
</details>



#### Planned IMprovements 

### Test
- ``` Rspec  spec/```
- 
## Author
👤 **Titus Muthomi**

- GitHub: [@Kalunge](https://github.com/Kalunge)
- Twitter: [@titus_muthomi](https://twitter.com/titus_muthomi)
- LinkedIn: [Titus Muthomi](https://www.linkedin.com/in/kalunge/)
  
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Kalunge/Bookstore-Api/issues).

## Show your support

Give a ⭐️ if you like this project!



## License

[MIT](./LICENSE)
