# Flutter Multi-Module Project

This project demonstrates a modular Flutter application architecture where packages can be developed and maintained independently.

## Project Structure

```
flutter_multi_module_project/
├── apps/
│   └── shell_app/          # Main Flutter application
├── packages/               # Optional packages (managed by setup script)
│   ├── domain_a/          # Domain A package (optional)
│   ├── domain_b/          # Domain B package (optional)
│   └── core_services/     # Core Services package (optional)
├── melos.yaml             # Melos configuration
├── setup_modules.sh       # Package management script
└── README.md
```

## Setup Instructions

1. **Initial Setup**
   ```bash
   # Clone the main project
   git clone <your-main-repo-url>
   cd flutter_multi_module_project
   ```

2. **Package Management**
   ```bash
   # Make the setup script executable
   chmod +x setup_modules.sh
   
   # Run the setup script
   ./setup_modules.sh
   ```
   
   The setup script will:
   - Show available packages
   - Allow you to select which packages to install/remove
   - Handle the cloning and removal of package repositories
   - Update Melos configuration automatically

3. **Development**
   ```bash
   # After selecting packages, bootstrap the project
   melos bootstrap
   ```

## Package Repositories

Each package is maintained in its own repository:
- Domain A: `git@github.com:your-org/domain-a.git`
- Domain B: `git@github.com:your-org/domain-b.git`
- Core Services: `git@github.com:your-org/core-services.git`

## Development Workflow

1. **Working with Packages**
   - Developers can choose which packages to include in their development environment
   - Packages can be developed and tested in isolation
   - Changes to packages should be committed to their respective repositories

2. **Main Application Development**
   - The main application (`shell_app`) can depend on any combination of packages
   - Use the setup script to manage which packages are available locally

3. **CI/CD Considerations**
   - CI/CD pipelines should be set up for each package repository
   - The main application's CI/CD should handle package dependencies appropriately

## Adding New Packages

To add a new package to the ecosystem:
1. Create a new repository for the package
2. Update the `setup_modules.sh` script with the new repository URL
3. Update documentation accordingly

## Best Practices

1. **Version Management**
   - Use semantic versioning for packages
   - Keep track of breaking changes
   - Document migration guides when necessary

2. **Dependencies**
   - Clearly document package dependencies
   - Avoid circular dependencies
   - Keep packages focused and minimal

3. **Testing**
   - Maintain high test coverage for packages
   - Include integration tests where necessary
   - Test packages both in isolation and integration
