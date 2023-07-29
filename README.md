# Traffic tracker of interaction between advertisers and website owners
SkillFactory  PHP_DEV_31 Final project - SF-AdTech

## Project description 

**Advertising traffic tracker system**

Traffic tracker created to organize the interaction of companies (advertisers) that want to attract visitors and buyers (clients), and site owners (webmasters) to their site


## Implementation:

PHP version 7.4 + Laravel 8.75 + MySQL 8.0

Developed as a practical task in the "PHP Developer" course.


## Instructions

1. Download the project by running the command:
``` bash
- git clone https://github.com/MikeSiebel/sfadtech.git
```

2. Update the dependencies:
``` bash
- composer update
```

3. Generate a new app key using php artisan (ensure the 'APP_KEY' parameter in .env is cleared first):
``` bash
- php artisan key:generate
```
4. Create a database for the site.

5. Duplicate the .env.example file and rename it as .env. In the .env file, specify the database connection parameters.

6. Modify the passwords for users in /database/seeders/UserSeeder.php.

7. Perform database migrations and seeding using the following command:
``` bash
- php artisan migrate --seed
```

## Documentation 

[Custom system description (rus)](description.md)

***
**2023@MikeSiebel** [sfadtech project - SF-AdTech](https://github.com/MikeSiebel/sfadtech.git)