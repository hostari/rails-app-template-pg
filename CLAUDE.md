# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Rails 8.0.2 application configured with PostgreSQL, using modern Rails conventions and the "Omakase" stack. The application uses Solid Queue, Solid Cache, and Solid Cable for background jobs, caching, and WebSocket connections.

## Development Setup

- Run `bin/setup` to install dependencies and prepare the development environment
- This script will automatically start the development server via `bin/dev` unless `--skip-server` is passed

## Common Development Commands

### Server
- `bin/dev` - Start the Rails development server
- `bin/rails server` - Alternative way to start the server

### Database
- `bin/rails db:create` - Create development and test databases
- `bin/rails db:prepare` - Create database, load schema, and run pending migrations
- `bin/rails db:migrate` - Run pending migrations
- `bin/rails db:rollback` - Roll back the last migration

### Testing
- `bin/rails test` - Run all tests except system tests
- `bin/rails test:system` - Run system tests
- `bin/rails test:db` - Reset database and run tests

### Code Quality
- `bin/rubocop` - Run RuboCop linter (Rails Omakase style)
- `bin/brakeman` - Run security analysis

### Background Jobs
- `bin/jobs` - Start Solid Queue worker for processing background jobs

## Architecture

### Database Configuration
- Uses PostgreSQL with separate databases for production environments:
  - Primary database for application data
  - Cache database for Solid Cache
  - Queue database for Solid Queue
  - Cable database for Solid Cable

### Asset Pipeline
- Uses Propshaft for asset compilation
- Import maps for JavaScript modules
- Turbo and Stimulus for SPA-like behavior

### Key Gems
- **Rails 8.0.2** - Main framework
- **PostgreSQL** - Database
- **Puma** - Web server
- **Solid Queue** - Background job processing
- **Solid Cache** - Database-backed caching
- **Solid Cable** - Database-backed Action Cable
- **Turbo/Stimulus** - Hotwire frontend framework
- **Bootsnap** - Boot time optimization
- **Kamal** - Deployment tool

### Testing Stack
- Minitest (Rails default)
- Capybara + Selenium for system tests
- Debug gem for debugging

### Directory Structure
- Standard Rails 7+ structure with `app/javascript` for JS files
- Uses `config.autoload_lib` for lib directory autoloading
- PWA files in `app/views/pwa/`