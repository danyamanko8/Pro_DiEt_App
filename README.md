# DiEt

This is an app for tracking your daily eaten meal calories and nutrients. Users can get email with report of eaten calories, nutrients and its percentage up/down compared to previous day. Users can also create a daily diet(meal plan for each day) and see how many calories and nutrients it will consume. They can view all eaten meals, calories and nutrients on daily basis/monthly basis, as well as ask to build report for some period of time. Users can also enable/disable ability to get daily/weekly/monthly reports or custom date reports

# Contents

## [Prerequisites](#prerequisites)
## [System dependencies](#system-dependencies)
## [Installation](#installation)

## Prerequisites

The setups steps expect following tools installed on the system.

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Ruby [3.0.1](https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/)
- Rails [7.0.3.1](https://rubygems.org/gems/rails/versions/7.0.3.1)

## System dependencies

[Devise gem](https://github.com/heartcombo/devise)

[Sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron)

## Installation

Follow these easy steps to install and start the app:

### 1. Clone the repository

```bash
git clone https://github.com/danyamanko8/DiEt_M.git
```

### 2. install the gems required by the app

```bash
bundle
```

### 3. Initialize the database

Run the following commands to create and setup the database.

```bash
rails db:create db:migrate db:seed
```

### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
rails s
```

And now you can visit the site with the URL http://localhost:3000
